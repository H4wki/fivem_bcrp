
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permission (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
  ["AmmuNation"] = {
    _config = {blipid=156,blipcolor=1},
    ["WEAPON_PISTOL"] = {"Pistol",800,15,""},
    ["WEAPON_COMBATPISTOL"] = {"Combat Pistol",1500,15,""},
    ["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",500,70,""},
    ["WEAPON_KNIFE"] = {"Knife",50,0,""}
  },
  ["Police Armory"] = {
    _config = {blipid=156,blipcolor=1,permission="police.cloakroom"},
    ["WEAPON_PISTOL"] = {"Pistol",0,1,""},
    ["WEAPON_COMBATPISTOL"] = {"Combat Pistol",0,1,""},
    ["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",0,1,""},
    ["WEAPON_CARBINERIFLE"] = {"Carbine Rifle",0,1,""},
    ["WEAPON_SMG"] = {"SWAT SMG",0,1,""},
    ["WEAPON_BZGAS"] = {"Tear Gas",0,0,""},
    ["WEAPON_STUNGUN"] = {"Taser",0,0,""},
    ["WEAPON_NIGHTSTICK"] = {"Nighstick",0,0,""}
  }
}

-- list of gunshops positions

cfg.gunshops = {
  {"AmmuNation", 1692.41, 3758.22, 34.7053},
  {"AmmuNation", 252.696, -48.2487, 69.941},
  {"AmmuNation", 844.299, -1033.26, 28.1949},
  {"AmmuNation", -331.624, 6082.46, 31.4548},
  {"AmmuNation", -664.147, -935.119, 21.8292},
  {"AmmuNation", -1320.983, -389.260, 36.483},
  {"AmmuNation", -1119.4880,2697.0866,18.5541},
  {"AmmuNation", 2569.62, 294.453, 108.735},
  {"AmmuNation", -3172.6037,1085.7481,20.8387},
  {"AmmuNation", 21.70, -1107.41, 29.79},
  {"AmmuNation", 810.15, -2156.88, 29.61},
  {"Police Armory", 452.3533,-980.0969,30.6896}
}

return cfg
