Citizen.CreateThread(function()
	while true do
		Wait(10)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			targetVehicleEntry = GetVehiclePedIsTryingToEnter(playerPed)
				checkCarLock(targetVehicleEntry)
			end
		end
	end
end)

function checkCarLock(car)
	if car then
		local netID=NetworkGetNetworkIdFromEntity(car)
		if nil netID then
			SetVehicleDoorsLocked(car, 2)
		end
	end
end