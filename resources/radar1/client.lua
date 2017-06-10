Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		
		if playerPed then
			playerCar = GetVehiclePedIsIn(playerPed, false)
			if playerCar and GetPedInVehicleSeat(playerCar, -1) == playerPed then
				--local coordA = GetEntityCoords(playerCar, 1)
				--local coordB = GetOffsetFromEntityInWorldCoords(playerCar, 0.0, 20.0, 0.0)
				--local carM = getVehicleInDirection(coordA, coordB)
				local pos = GetEntityCoords(playerCar)
				--local carM = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 10.0,0,70)
				local entityWorld = GetOffsetFromEntityInWorldCoords(playerCar, -20.0, 600.0, 0.0)
				local entityWorld2 = GetOffsetFromEntityInWorldCoords(playerCar, 0.0, 600.0, 0.0)
				local entityWorld3 = GetOffsetFromEntityInWorldCoords(playerCar, 20.0, 600.0, 0.0)
				local rayHandlea = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, playerCar, 0)
				local rayHandle2a = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld2.x, entityWorld2.y, entityWorld2.z, 10, playerCar, 0)
				local rayHandle3a = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld3.x, entityWorld3.y, entityWorld3.z, 10, playerCar, 0)
				local rayHandleb = CastRayPointToPoint(pos.x, pos.y, pos.z+0.25, entityWorld.x, entityWorld.y, entityWorld.z, 10, playerCar, 0)
				local rayHandle2b = CastRayPointToPoint(pos.x, pos.y, pos.z+0.25, entityWorld2.x, entityWorld2.y, entityWorld2.z, 10, playerCar, 0)
				local rayHandle3b = CastRayPointToPoint(pos.x, pos.y, pos.z+0.25, entityWorld3.x, entityWorld3.y, entityWorld3.z, 10, playerCar, 0)
				local a, b, c, d, carMa = GetRaycastResult(rayHandlea)
				local a, b, c, d, carM2a = GetRaycastResult(rayHandle2a)
				local a, b, c, d, carM3a = GetRaycastResult(rayHandle3a)
				local a, b, c, d, carMb = GetRaycastResult(rayHandleb)
				local a, b, c, d, carM2b = GetRaycastResult(rayHandle2b)
				local a, b, c, d, carM3b = GetRaycastResult(rayHandle3b)
				--local poscarM = GetEntityCoords(carM)
				--local carM2 = GetClosestVehicle(poscarM['x'], poscarM['y'], poscarM['z'], 10.0,0,70)
				if carMa ~=nil then
					rdrTargetReg=GetVehicleNumberPlateText(carMa)
					rdrTargetSpd=GetEntitySpeed(carMa)*2.236936
					rdrTgtSpd=string.format("%.0f", rdrTargetSpd)
						if (rdrTargetSpd > 0) then
						lastRdrTgtSpd=rdrTgtSpd
						end
					SendNUIMessage({
						showreg = true,
						carSpeedLine1 = lastRdrTgtSpd,
						carRegLine1 = rdrTargetReg
					})
				elseif carM2a ~=nil then
					rdrTargetReg=GetVehicleNumberPlateText(carM2a)
					rdrTargetSpd=GetEntitySpeed(carM2a)*2.236936
					rdrTgtSpd=string.format("%.0f", rdrTargetSpd)
						if (rdrTargetSpd > 0) then
						lastRdrTgtSpd=rdrTgtSpd
						end
					SendNUIMessage({
						showreg = true,
						carSpeedLine1 = lastRdrTgtSpd,
						carRegLine1 = rdrTargetReg
					})
				elseif carM3a ~=nil then
					rdrTargetReg=GetVehicleNumberPlateText(carM3a)
					rdrTargetSpd=GetEntitySpeed(carM3a)*2.236936
					rdrTgtSpd=string.format("%.0f", rdrTargetSpd)
						if (rdrTargetSpd > 0) then
						lastRdrTgtSpd=lastRdrTgtSpd
						end
					SendNUIMessage({
						showreg = true,
						carSpeedLine1 = lastRdrTgtSpd,
						carRegLine1 = rdrTargetReg
					})
				elseif carMb ~=nil then
					rdrTargetReg=GetVehicleNumberPlateText(carMb)
					rdrTargetSpd=GetEntitySpeed(carMb)*2.236936
					rdrTgtSpd=string.format("%.0f", rdrTargetSpd)
						if (rdrTargetSpd > 0) then
						lastRdrTgtSpd=rdrTgtSpd
						end
					SendNUIMessage({
						showreg = true,
						carSpeedLine1 = lastRdrTgtSpd,
						carRegLine1 = rdrTargetReg
					})
				elseif carM2b ~=nil then
					rdrTargetReg=GetVehicleNumberPlateText(carM2b)
					rdrTargetSpd=GetEntitySpeed(carM2b)*2.236936
					rdrTgtSpd=string.format("%.0f", rdrTargetSpd)
						if (rdrTargetSpd > 0) then
						lastRdrTgtSpd=rdrTgtSpd
						end
					SendNUIMessage({
						showreg = true,
						carSpeedLine1 = lastRdrTgtSpd,
						carRegLine1 = rdrTargetReg
					})
				elseif carM3b ~=nil then
					rdrTargetReg=GetVehicleNumberPlateText(carM3b)
					rdrTargetSpd=GetEntitySpeed(carM3b)*2.236936
					rdrTgtSpd=string.format("%.0f", rdrTargetSpd)
						if (rdrTargetSpd > 0) then
						lastRdrTgtSpd=lastRdrTgtSpd
						end
					SendNUIMessage({
						showreg = true,
						carSpeedLine1 = lastRdrTgtSpd,
						carRegLine1 = rdrTargetReg
					})
				else
					SendNUIMessage({
						showreg = true,
						carSpeedLine1 = lastRdrTgtSpd,
						carRegLine1 = "NONE"
					})
				end
			else
				SendNUIMessage({hidehud = true})
			end
		end
	end
end)