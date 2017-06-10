local Proxy = require("resources/vRP/lib/Proxy")

RegisterServerEvent('drift:radar')
AddEventHandler('drift:radar', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.radar") then
		vRP.giveMoney(user_id,1200)
	end																														
end)
