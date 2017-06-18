function initFuelRandom(veh)
  randomFuel=math.random(40,95)
  DecorSetFloat(veh, "drf_Fuel_Level", randomFuel)
end

function burnFuel(veh)
  currentFuel=DecorGetFloat(veh, "drf_Fuel_Level")
  speed = GetEntitySpeed(veh)
  speedMph = math.ceil(speed * 2.236936)
  if speedMph > 100 then
    afterFuelBurn = currentFuel - 0.060
  elseif speedMph > 80 then
    afterFuelBurn = currentFuel - 0.040
  elseif speedMph > 60 then --0.028 = empty from full in 30 minutes
    afterFuelBurn = currentFuel - 0.030
  elseif speedMph > 40 then
    afterFuelBurn = currentFuel - 0.025
  elseif speedMph > 20 then
    afterFuelBurn = currentFuel - 0.020
  elseif speedMph > 10 then
    afterFuelBurn = currentFuel - 0.015
  elseif speedMph > 5 then
    afterFuelBurn = currentFuel - 0.010
  else
    afterFuelBurn = currentFuel - 0.004
  end
  Citizen.Trace(afterFuelBurn)
  return afterFuelBurn
end

Citizen.CreateThread(function()
	while true do
		local playerPed = GetPlayerPed(-1)
		if playerPed then
			veh = GetVehiclePedIsIn(playerPed, false)
			if veh and GetPedInVehicleSeat(veh, -1) == playerPed then
				if !(DecorExistOn(veh, "drf_Fuel_Level"))then
					initFuelRandom(veh)
				end
			else
				local updFuelLevel = burnFuel(veh)
				DecorSetFloat(veh, "drf_Fuel_Level", updFuelLevel)
			end
		end
		Wait(500)
	end
end)