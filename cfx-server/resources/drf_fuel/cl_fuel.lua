function initFuelRandom(drf_veh)
  local randomFuel = math.random(40000,95000)
  DecorRegister("_Fuel_Level", 3);
  DecorSetInt(drf_veh, "_Fuel_Level", randomFuel)
  Citizen.Trace("fuel leve set")
  Citizen.Trace(randomFuel)
end

function burnFuel(drf_veh)
	local currentFuel=DecorGetInt(drf_veh, "_Fuel_Level")
	Citizen.Trace(currentFuel)
	local speed = GetEntitySpeed(drf_veh)
	local speedMph = math.ceil(speed * 2.236936)
	Citizen.Trace(speedMph)
	if speedMph < 5 then
		burnRate = 5
	elseif speedMph >80 then
		burnRate = (speedMph * 2)
	elseif speedMph >60 then
		burnRate = math.ceil(speedMph * 1.5)
	else
		burnRate = speedMph
	end
	local afterFuelBurn = (currentFuel - burnRate)
	DecorSetInt(drf_veh, "_Fuel_Level", afterFuelBurn)
	Citizen.Trace(burnRate)
	Citizen.Trace(currentFuel)
end

Citizen.CreateThread(function()
	while true do
		local playerPed = GetPlayerPed(-1)
		if playerPed then
			local veh = GetVehiclePedIsIn(playerPed, false)
			drf_veh = veh
			--Citizen.Trace("veh detected")
			if drf_veh and GetPedInVehicleSeat(drf_veh, -1) == playerPed then
				if not DecorExistOn(drf_veh, "_Fuel_Level") then
					initFuelRandom(drf_veh)
					--Citizen.Trace("veh fuel init")
				else
					burnFuel(drf_veh)
					--Citizen.Trace("veh fuel burned")
				end
			end
		end
		Wait(1000)
	end
end)