function round(n)
  return math.floor((math.floor(n*2) + 1)/2)
end

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		
		if playerPed then
			playerCar = GetVehiclePedIsIn(playerPed, false)
			if playerCar and GetPedInVehicleSeat(playerCar, -1) == playerPed then
				carSpeed = GetEntitySpeed(playerCar)
				playerCarFuelLevel=DecorGetInt(playerCar, "_Fuel_Level")
				--playerCarFuelPercent=round(playerCarFuelLevel)
				playerCarFuelPercent=math.ceil(playerCarFuelLevel * 0.001)
				speedMph = math.ceil(carSpeed * 2.236936)

				SendNUIMessage({
					showhud = true,

					unitLine1 = "MPH",
					speedLine1 = speedMph,
					
					unitLine2 = "Fuel",
					speedLine2 = string.format("%s%%",playerCarFuelPercent)
				})
			else
				SendNUIMessage({hidehud = true})
			end
		end
	end
end)