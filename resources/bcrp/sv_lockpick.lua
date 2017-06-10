AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1, 5) == '/lockpick' then
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Lockpicking...")
		citizen.wait(10000)
        TriggerClientEvent('drifter:lockpicking')
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "...done. Try the door!")
        CancelEvent()
    end
end)