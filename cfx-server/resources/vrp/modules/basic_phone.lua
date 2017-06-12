
-- basic phone module

local lang = vRP.lang
local cfg = require("resources/vrp/cfg/phone")
local htmlEntities = require("resources/vrp/lib/htmlEntities")
local services = cfg.services

--[[Menu events in this module:
vRP:buildPhoneMenu
vRP:buildPhoneDirectoryMenu
vRP:buildPhoneContactMenu
vRP:buildPhoneSMSMenu
vRP:buildPhoneServiceMenu
]]

-- api

-- Send a service alert to all service listeners
--- sender: a player or nil (optional, if not nil, it is a call request alert)
--- service_name: service name
--- x,y,z: coordinates
--- msg: alert message
function vRP.sendServiceAlert(sender, service_name,x,y,z,msg)
  local service = services[service_name]
  local answered = false
  if service then
    local players = {}
    for k,v in pairs(vRP.rusers) do
      local player = vRP.getUserSource(tonumber(k))
      -- check user
      if vRP.hasPermission(k,service.alert_permission) and player ~= nil then
        table.insert(players,player)
      end
    end

    -- send notify and alert to all listening players
    for k,v in pairs(players) do
      vRPclient.notify(v,{service.alert_notify..msg})
      -- add position for service.time seconds
      vRPclient.addBlip(v,{x,y,z,service.blipid,service.blipcolor,"("..service_name..") "..msg}, function(bid)
        SetTimeout(service.alert_time*1000,function()
          vRPclient.removeBlip(v,{bid})
        end)
      end)

      -- call request
      if sender ~= nil then
        vRP.request(v,lang.phone.service.ask_call({service_name, htmlEntities.encode(msg)}), 30, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              vRPclient.notify(sender,{service.answer_notify})
              vRPclient.setGPS(v,{x,y})
              answered = true
            else
              vRPclient.notify(v,{lang.phone.service.taken()})
            end
          end
        end)
      end
    end
  end
end

-- send an sms from an user to a phone number
-- return true on success
function vRP.sendSMS(user_id, phone, msg)
  if string.len(msg) > cfg.sms_size then -- clamp sms
    sms = string.sub(msg,1,cfg.sms_size)
  end

  local identity = vRP.getUserIdentity(user_id)
  local dest_id = vRP.getUserByPhone(phone)
  if identity and dest_id then
    local dest_src = vRP.getUserSource(dest_id)
    if dest_src then
      local phone_sms = vRP.getPhoneSMS(dest_id)

      if #phone_sms >= cfg.sms_history then -- remove last sms of the table
        table.remove(phone_sms)
      end

      local from = vRP.getPhoneDirectoryName(dest_id, identity.phone).." ("..identity.phone..")"
      
      vRPclient.notify(dest_src,{lang.phone.sms.notify({from, msg})})
      table.insert(phone_sms,1,{identity.phone,msg}) -- insert new sms at first position {phone,message}
      return true
    end
  end

  return false
end

-- send an smspos from an user to a phone number
-- return true on success
function vRP.sendSMSPos(user_id, phone, x,y,z)
  local identity = vRP.getUserIdentity(user_id)
  local dest_id = vRP.getUserByPhone(phone)
  if identity and dest_id then
    local dest_src = vRP.getUserSource(dest_id)
    if dest_src then
      local from = vRP.getPhoneDirectoryName(dest_id, identity.phone).." ("..identity.phone..")"
      vRPclient.notify(dest_src,{lang.phone.smspos.notify({from})}) -- notify
      -- add position for 5 minutes
      vRPclient.addBlip(dest_src,{x,y,z,162,37,from}, function(bid)
        SetTimeout(cfg.smspos_duration*1000,function()
          vRPclient.removeBlip(dest_src,{bid})
        end)
      end)
      return true
    end
  end

  return false
end

-- get phone directory data table
function vRP.getPhoneDirectory(user_id)
  local data = vRP.getUserDataTable(user_id)
  if data then
    if data.phone_directory == nil then
      data.phone_directory = {}
    end

    return data.phone_directory
  else
    return {}
  end
end

-- get directory name by number for a specific user
function vRP.getPhoneDirectoryName(user_id, phone)
  local directory = vRP.getPhoneDirectory(user_id)
  for k,v in pairs(directory) do
    if v == phone then
      return k
    end
  end

  return "unknown"
end
-- get phone sms tmp table
function vRP.getPhoneSMS(user_id)
  local data = vRP.getUserTmpTable(user_id)
  if data then
    if data.phone_sms == nil then
      data.phone_sms = {}
    end

    return data.phone_sms
  else
    return {}
  end
end

-- build phone menu
local phone_menu = {name=lang.phone.title(),css={top="75px",header_color="rgba(0,125,255,0.75)"}}

local function ch_directory(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    local phone_directory = vRP.getPhoneDirectory(user_id)
    -- build directory menu
    local menu = {name=choice,css={top="75px",header_color="rgba(0,125,255,0.75)"}}

    local ch_add = function(player, choice) -- add to directory
      vRP.prompt(player,lang.phone.directory.add.prompt_number(),"",function(player,phone)
        vRP.prompt(player,lang.phone.directory.add.prompt_name(),"",function(player,name)
          name = tostring(name)
          phone = tostring(phone)
          if #name > 0 and #phone > 0 then
            phone_directory[name] = phone -- set entry
            vRPclient.notify(player, {lang.phone.directory.add.added()})
          else
            vRPclient.notify(player, {lang.common.invalid_value()})
          end
        end)
      end)
    end

    local ch_entry = function(player, choice) -- directory entry menu
      -- build entry menu
      local emenu = {name=choice,css={top="75px",header_color="rgba(0,125,255,0.75)"}}

      local name = choice
      local phone = phone_directory[name] or ""

      local ch_remove = function(player, choice) -- remove directory entry
        phone_directory[name] = nil
        vRP.closeMenu(player) -- close entry menu (removed)
      end

      local ch_sendsms = function(player, choice) -- send sms to directory entry
        vRP.prompt(player,lang.phone.directory.sendsms.prompt({cfg.sms_size}),"",function(player,msg)
          if vRP.sendSMS(user_id, phone, msg) then
            vRPclient.notify(player,{lang.phone.directory.sendsms.sent({phone})})
          else
            vRPclient.notify(player,{lang.phone.directory.sendsms.not_sent({phone})})
          end
        end)
      end

      local ch_sendpos = function(player, choice) -- send current position to directory entry
        vRPclient.getPosition(player,{},function(x,y,z)
          if vRP.sendSMSPos(user_id, phone, x,y,z) then
            vRPclient.notify(player,{lang.phone.directory.sendsms.sent({phone})})
          else
            vRPclient.notify(player,{lang.phone.directory.sendsms.not_sent({phone})})
          end
        end)
      end

      emenu[lang.phone.directory.sendsms.title()] = {ch_sendsms}
      emenu[lang.phone.directory.sendpos.title()] = {ch_sendpos}
      emenu[lang.phone.directory.remove.title()] = {ch_remove}

      -- nest menu to directory
      emenu.onclose = function() ch_directory(player,lang.phone.directory.title()) end 

      -- open mnu
      vRP.constructMenu(player, emenu, "vRP:buildPhoneContactMenu")
    end

    menu[lang.phone.directory.add.title()] = {ch_add}

    for k,v in pairs(phone_directory) do -- add directory entries (name -> number)
      menu[k] = {ch_entry,v}
    end

    -- nest directory menu to phone (can't for now)
    -- menu.onclose = function(player) vRP.openMenu(player, phone_menu) end

    -- open menu
    vRP.constructMenu(player,menu,"vRP:buildPhoneDirectoryMenu")
  end
end

local function ch_sms(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    local phone_sms = vRP.getPhoneSMS(user_id)

    -- build sms list
    local menu = {name=choice,css={top="75px",header_color="rgba(0,125,255,0.75)"}}

    -- add sms
    for k,v in pairs(phone_sms) do
      local from = vRP.getPhoneDirectoryName(user_id, v[1]).." ("..v[1]..")"
      local phone = v[1]
      menu["#"..k.." "..from] = {function(player,choice)
        -- answer to sms
        vRP.prompt(player,lang.phone.directory.sendsms.prompt({cfg.sms_size}),"",function(player,msg)
          if vRP.sendSMS(user_id, phone, msg) then
            vRPclient.notify(player,{lang.phone.directory.sendsms.sent({phone})})
          else
            vRPclient.notify(player,{lang.phone.directory.sendsms.not_sent({phone})})
          end
        end)
      end, lang.phone.sms.info({from,htmlEntities.encode(v[2])})}
    end

    -- nest menu
    menu.onclose = function(player) vRP.constructMenu(player,phone_menu,"vRP:buildPhoneMenu") end

    -- open menu
    vRP.constructMenu(player,menu,"vRP:buildPhoneSMSMenu")
  end
end

-- build service menu
local service_menu = {name=lang.phone.service.title(),css={top="75px",header_color="rgba(0,125,255,0.75)"}}

-- nest menu
service_menu.onclose = function(player) vRP.constructMenu(player,phone_menu,"vRP:buildPhoneMenu") end

local function ch_service_alert(player,choice) -- alert a service
  local service = services[choice]
  if service then
    vRPclient.getPosition(player,{},function(x,y,z)
      vRP.prompt(player,lang.phone.service.prompt(),"",function(player, msg)
        vRPclient.notify(player,{service.notify}) -- notify player
        vRP.sendServiceAlert(player,choice,x,y,z,msg) -- send service alert (call request)
      end)
    end)
  end
end

for k,v in pairs(services) do
  service_menu[k] = {ch_service_alert}
end

local function ch_service(player, choice)
  vRP.constructMenu(player,service_menu,"vRP:buildPhoneServiceMenu")
end

phone_menu[lang.phone.directory.title()] = {ch_directory,lang.phone.directory.description()}
phone_menu[lang.phone.sms.title()] = {ch_sms,lang.phone.sms.description()}
phone_menu[lang.phone.service.title()] = {ch_service,lang.phone.service.description()}

-- add phone menu to main menu

AddEventHandler("vRP:buildMainMenu",function(player) 
  local choices = {}
  choices[lang.phone.title()] = {function() vRP.constructMenu(player,phone_menu,"vRP:buildPhoneMenu") end}

  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id, "player.phone") then
    vRP.buildMainMenu(player,choices)
  end
end)
