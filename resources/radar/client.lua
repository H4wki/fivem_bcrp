Citizen.CreateThread(function()
	while true do
		Wait(500)

		playerPed = GetPlayerPed(-1)
		
		if playerPed then
			playerCar = GetVehiclePedIsIn(playerPed, false)
			if playerCar and GetPedInVehicleSeat(playerCar, -1) == playerPed then
				--local coordA = GetEntityCoords(playerCar, 1)
				--local coordB = GetOffsetFromEntityInWorldCoords(playerCar, 0.0, 20.0, 0.0)
				--local carM = getVehicleInDirection(coordA, coordB)
				local pos = GetEntityCoords(playerCar)
				--local carM = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 10.0,0,70)
				local entityWorld = GetOffsetFromEntityInWorldCoords(playerCar, 0.0, 500.0, 0.0)
				local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, playerCar, 0)
				local a, b, c, d, carM = GetRaycastResult(rayHandle)
				--local poscarM = GetEntityCoords(carM)
				--local carM2 = GetClosestVehicle(poscarM['x'], poscarM['y'], poscarM['z'], 10.0,0,70)
				if carM ~=nil then
				rdrTargetReg=GetVehicleNumberPlateText(carM)
				rdrTargetSpd=GetEntitySpeed(carM)*2.236936
				rdrTgtSpd=string.format("%.0f", rdrTargetSpd)
				SendNUIMessage({
					showreg = true,
					carSpeedLine1 = rdrTgtSpd,
					carRegLine1 = rdrTargetReg
				})
				else
				SendNUIMessage({
					showreg = true,
					carSpeedLine1 = "0",
					carRegLine1 = "NONE"
				})
				end
			else
				SendNUIMessage({hidehud = true})
			end
		end
	end
end)