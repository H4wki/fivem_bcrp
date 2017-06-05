Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local thisVehicle = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 5.001, 0, 70)
		if DoesEntityExist(vehicle) then
			user_id = PlayerId(player)
			SetEntityAsMissionEntity(thisVehicle, true, true) --this is mandatory in order to retrieve the network ID
			vehNetworkId = GetNetworkIdFromEntity(thisVehicle) --get our networkID because the vehicle is now persistent
			TriggerClientEvent('nocarjack:addOwnedVehicle', playerId, vehNetworkId) --Send the networkID to the player
		Wait(1)
	end
end)