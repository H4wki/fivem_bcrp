AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1, 5) == '/jack' then
		TriggerClientEvent('drifter:forceOpen', player, 5000)
		Citizen.Trace("Called on Server - /forceopen")
        CancelEvent()
    end
end)