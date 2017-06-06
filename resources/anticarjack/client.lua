RegisterNetEvent('drifter:forceOpen')

AddEventHandler('drifter:forceOpen', function(command)
	local pos = GetEntityCoords(player)
    local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, player, 0)
    local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)

    if vehicleHandle ~= nil then
    SetVehicleHasBeenOwnedByPlayer(vehicleHandle, true)
	Citizen.Trace("Called on Client - /forceopen")
    end
end)

RegisterNetEvent('drifter:food')

AddEventHandler('drifter:food', function(command)
	vRP.setHunger(1,0)
end)