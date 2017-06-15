
local cfg = {}

-- define customization parts
local parts = {
  ["Face"] = 0,
  ["Hair"] = 2,
  ["Hand"] = 3,
  ["Legs"] = 4,
  ["Shirt"] = 8,
  ["Shoes"] = 6,
  ["Jacket"] = 11,
  ["Hats"] = "p0",
  ["Glasses"] = "p1",
  ["Ears"] = "p2",
  ["Watches"] = "p6"
}

local Clothing = {
  ["Hand"] = 3,
  ["Legs"] = 4,
  ["Shirt"] = 8,
  ["Shoes"] = 6,
  ["Jacket"] = 11,
  ["Hats"] = "p0",
  ["Glasses"] = "p1",
  ["Ears"] = "p2",
  ["Watches"] = "p6"
}

-- changes prices (any change to the character parts add amount to the total price)
cfg.drawable_change_price = 20
cfg.texture_change_price = 5


-- skinshops list {parts,x,y,z}
cfg.skinshops = {
  {Clothing,72.2545394897461,-1399.10229492188,29.3761386871338},
  {Clothing,-703.77685546875,-152.258544921875,37.4151458740234},
  {Clothing,-167.863754272461,-298.969482421875,39.7332878112793},
  {Clothing,428.694885253906,-800.1064453125,29.4911422729492},
  {Clothing,-829.413269042969,-1073.71032714844,11.3281078338623},
  {Clothing,-1193.42956542969,-772.262329101563,17.3244285583496},
  {Clothing,-1447.7978515625,-242.461242675781,49.8207931518555},
  {Clothing,11.6323690414429,6514.224609375,31.8778476715088},
  {Clothing,1696.29187011719,4829.3125,42.0631141662598},
  {Clothing,123.64656829834,-219.440338134766,54.5578384399414},
  {Clothing,618.093444824219,2759.62939453125,42.0881042480469},
  {Clothing,1190.55017089844,2713.44189453125,38.2226257324219},
  {Clothing,-3172.49682617188,1048.13330078125,20.8632030487061},
  {Clothing,-1108.44177246094,2708.92358398438,19.1078643798828}
}

return cfg
