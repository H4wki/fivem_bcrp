RegisterNetEvent('drifter:lockpicking')
AddEventHandler('drifter:lockpicking', function(source)
	if drifter_lockpicking==false then
		drifter_lockpicking=true
	end
end)
Citizen.CreateThread(function() 
    while true do              
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
			local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
            local lock = GetVehicleDoorLockStatus(veh)
			local pedd = GetPedInVehicleSeat(veh, -1)
			if drifter_lockpicking then
				if pedd then
					SetVehicleDoorsLocked(veh, 2)
					SetPedCanBeDraggedOut(pedd, false)
				else
					SetVehicleDoorsLocked(veh, 0)
				end
				drifter_lockpicking=false
			else	
				if lock == 7 then
					SetVehicleDoorsLocked(veh, 2)
				end
				if pedd then                   
					SetPedCanBeDraggedOut(pedd, false)
				end
			end	 
        end   
        Citizen.Wait(0)	    							
    end
end)