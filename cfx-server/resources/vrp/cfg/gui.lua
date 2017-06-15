
-- gui config file

local cfg = {}

-- additional css loaded to customize the gui display (see gui/design.css to know the available css elements)
-- it is not recommended to modify the vRP core files outside the cfg/ directory, create a new resource instead
-- you can load external images/fonts/etc using the NUI absolute path: nui://my_resource/myfont.ttf
-- example, changing the gui font (suppose a vrp_mod resource containing a custom font)
cfg.css = [[
@font-face {
  font-family: "Custom Font";
  src: url(nui://vrp_mod/customfont.ttf) format("truetype");
}

body{
  font-family: "Custom Font";
}
]]

-- list of static menu types (map of name => {.title,.blipid,.blipcolor,.permission (optional)})
-- static menus are menu with choices defined by vRP.addStaticMenuChoices(name, choices)
cfg.static_menu_types = {
  ["missions"] = {
    title = "Missions",
    blipid = 205, 
    blipcolor = 5
  }
}

-- list of static menu points
cfg.static_menus = {
  {"missions", 1855.13940429688,3688.68579101563,34.2670478820801}
}

return cfg

--[[This is the full list of Menu building events available from vRP core modules:
vRP:buildMainMenu
vRP:buildATMMenu
vRP:buildGarageMenu
vRP:buildGarageOwnedMenu
vRP:buildGarageBuyMenu
vRP:buildGarageRentMenu
vRP:buildGunshopMenu
vRP:buildMarketMenu (you can get the exact Market name from the Menu data passed to the event)
vRP:buildPhoneMenu
vRP:buildPhoneDirectoryMenu
vRP:buildPhoneContactMenu
vRP:buildPhoneSMSMenu
vRP:buildPhoneServiceMenu
vRP:buildSkinshopMenu
vRP:buildBusinessDirectoryMenu
vRP:buildBusinessMenu
vRP:buildCloacroomMenu
vRP:buildEmoteMenu
vRP:buildGroupMenu
vRP:buildHouseMenu
vRP:buildHouseEnterMenu
vRP:buildIdentityMenu
VRP:buildInventoryMenu
vRP:buildInventoryItemMenu (you can get the exact Item name from the Menu data passed to the event)
vRP:buildTransformerMenu
vRP:buildInformerMenu
vRP:buildPoliceMenu
vRP:buildPoliceFineMenu
]]--
