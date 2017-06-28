
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"You are superadmin."}) end},
    "player.group.add",
    "player.group.remove",
    "player.givemoney",
    "player.giveitem"
  },
  ["admin"] = {
    "admin.tickets",
    "admin.announce",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.display_custom",
    "player.coords",
    "player.tptome",
    "player.tpto"
  },
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone",
    "player.paycheck",
    "player.calladmin",
    "police.askid",
    "police.store_weapons",
    "police.seizable" -- can be seized
  },
  ["police"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
    },
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "police.paycheck",
    "-police.store_weapons",
    "-police.seizable" -- negative permission, police can't seize itself, even if another group add the permission
  },
  ["emergency"] = {
    _config = { gtype = "job" },
    "emergency.revive",
    "emergency.shop",
    "emergency.paycheck",
    "emergency.service"
  },
  ["repair"] = {
    _config = { gtype = "job"},
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
    "repair.paycheck"
  },
  ["taxi"] = {
    _config = { gtype = "job" },
    "taxi.service",
    "taxi.paycheck"
  },
  ["copjob"] = {
    _config = { gtype = "job" },
    "police.whitelist"
  },
  ["emsjob"] = {
    _config = { gtype = "job" },
    "ems.whitelist"
  },
  ["citizen"] = {
    _config = { gtype = "job" }
  }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
    "admin"
  }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
  ["Employment"] = {
    _config = {x = -268.363739013672, y = -957.255126953125, z = 31.22313880920410, blipid = 351, blipcolor = 47},
    "Taxi",
    "Repair",
    "Citizen"
  },
  ["Police Job"] = {
    _config = {x = 447.245666503906,y = -975.791931152344, z = 30.689582824707 , blipid = 351, blipcolor= 38, permission="police.whitelist" },
    "Police",
    "Citizen"
  },
  ["EMS Job"] = {
    _config = {x=-498.959716796875,y=-335.715148925781,z=34.5017547607422, blipid = 351, blipcolor= 1, permission="ems.whitelist" },
    "Emergency",
    "Citizen"
  }
}

return cfg

