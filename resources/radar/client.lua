Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		
		if playerPed then
			playerCar = GetVehiclePedIsIn(playerPed, false)
			if playerCar and GetPedInVehicleSeat(playerCar, -1) == playerPed then
				registration = "FDW-345"
				speedMph = "55"

				SendNUIMessage({
					showreg = true,
					carSpeedLine1 = speedMph,
					carRegLine1 = registration
				})
			else
				SendNUIMessage({hidehud = true})
			end
		end
	end
end)