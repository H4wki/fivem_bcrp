local Proxy = require("resources/vRP/lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.paycheck") then
		vRP.giveMoney(user_id,1200)
		vRPclient.notify(source,{"PAYDAY: $1200"})
	elseif vRP.hasPermission(user_id,"emergency.paycheck") then
		vRP.giveMoney(user_id,1000)
		vRPclient.notify(source,{"PAYDAY: $1000"})
	end																														
end)
