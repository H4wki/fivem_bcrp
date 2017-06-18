--[[function round(n)
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
				playerCarFuelLevel=DecorGetFloat(playerCar, "drf_Fuel_Level")
				playerCarFuelPercent=round(playerCarFuelLevel)
				--playerCarFuelPercent2=math.ceil(playerCarFuelPercent * 1.5384)
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
]]--


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(1, 96) then
		SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
		end
	end
end)