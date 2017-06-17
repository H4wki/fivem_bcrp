AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1, 6) == '/radar' then
        TriggerClientEvent('drifter:radarToggle',source)
        CancelEvent()
    end
end)