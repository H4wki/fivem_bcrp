Citizen.CreateThread(function()
	while true do
		Wait(5000)
		local user_id = vRP.getUserId(player)
		if vRP.hasPermission(user_id,"police.handcuff") then
		TriggerClientEvent('nocarjack:skipThisFrame', user_id, 5000)
		end
	end
end)