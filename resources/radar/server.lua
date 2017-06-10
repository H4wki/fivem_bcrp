
TriggerEvent("es:addGroup", "police", "user", function(group) end)

TriggerEvent('es:addGroupCommand', 'radar', "police", function(source, args, user)
	TriggerClientEvent('drifter:radarToggle',source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)