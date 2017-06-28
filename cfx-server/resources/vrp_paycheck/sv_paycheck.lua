local Proxy = require("resources/vRP/lib/Proxy")

function task_paychecks()
	for k,v in pairs(vRP.users) do
		local source = vRP.getUserSource(v)
		local user_id = v
		print("Paycheck for users "..k.." "..v) -- Debug
		if vRP.hasPermission(user_id, "police.paycheck") then
			vRP.giveMoney(v,1200)
			vRPclient.notify(source,{"POLICE SALARY: ~g~$~b~"..1500})
		elseif vRP.hasPermission(user_id, "emergency.paycheck") then
			vRP.giveMoney(v,1200)
			vRPclient.notify(source,{"EMS SALARY: ~g~$~b~"..1000})
		elseif vRP.hasPermission(user_id, "taxi.paycheck") then
			vRP.giveMoney(v,1200)
			vRPclient.notify(source,{"TAXI BONUS: ~g~$~b~"..500})
		elseif vRP.hasPermission(user_id, "repair.paycheck") then
			vRP.giveMoney(v,1200)
			vRPclient.notify(source,{"MECHANIC BONUS: ~g~$~b~"..500})
		elseif vRP.hasPermission(user_id, "player.paycheck") then
			vRP.giveMoney(v,1200)
			vRPclient.notify(source,{"UNEMPLOYMENT BENEFITS: ~g~$~b~"..250})
		end
	end
	SetTimeout(600000, task_paychecks) --Pay every 10 minutes.
end
task_paychecks()