Citizen.CreateThread(function()
	local LastVehcile=nil
	while true do
		Citizen.Wait(1)
		local target=GetVehiclePedIsIn(GetPlayerPed(-1), true)
		if not traget  and LastVehcile == nil then
			DisableControlAction(0,124, true)-- back left 124
			DisableControlAction(0,125, true)-- front right
			DisableControlAction(0,127, true)-- trunk2
			DisableControlAction(0,128, true)-- back right
			DisableControlAction(0,131, true)-- trunk1
			DisableControlAction(0,133, true)-- Hood
			DisableControlAction(0,134, true)-- Front left 134
			DisableControlAction(0,132, true)-- this is the modifier
			if IsDisabledControlJustPressed(0,134) and IsDisabledControlPressed(0,132) then
				print("hopefullyshit happenes")
				if GetVehicleDoorAngleRatio(target,0) ==0 then
					SetVehicleDoorOpen(target, 0, false)
				else
					SetVehicleDoorShut(target,0)
				end
			end
			if IsDisabledControlJustPressed(0,125) and IsDisabledControlPressed(0,132) then
				if GetVehicleDoorAngleRatio(target,1) ==0 then
					SetVehicleDoorOpen(target, 1, false)
				else
					SetVehicleDoorShut(target,1)
				end
			end
			if IsDisabledControlJustPressed(0,124) and IsDisabledControlPressed(0,132) then
				if GetVehicleDoorAngleRatio(target,2) ==0 then
						SetVehicleDoorOpen(target, 2, false)
				else
					SetVehicleDoorShut(target,2)
				end
			end
			if IsDisabledControlJustPressed(0,128) and IsDisabledControlPressed(0,132) then
				if GetVehicleDoorAngleRatio(target,3) ==0 then
					SetVehicleDoorOpen(target, 3, false)
				else
					SetVehicleDoorShut(target,3)
				end
			end
			if IsDisabledControlJustPressed(0,133) and IsDisabledControlPressed(0,132) then
				if GetVehicleDoorAngleRatio(target,4) ==0 then
					SetVehicleDoorOpen(target, 4, false)
				else
					SetVehicleDoorShut(target,4)
				end
			end
			if IsDisabledControlJustPressed(0,131) and IsDisabledControlPressed(0,132) then
				if GetVehicleDoorAngleRatio(target,5) ==0 then
					SetVehicleDoorOpen(target, 5, false)
				else
					SetVehicleDoorShut(target,5)
				end
			end
			if IsDisabledControlJustPressed(0,127) and IsDisabledControlPressed(0,132) then
				if GetVehicleDoorAngleRatio(target,6) ==0 then
					SetVehicleDoorOpen(target, 6, false)
				else
					SetVehicleDoorShut(target,6)
				end
			end
		end
	end
end)