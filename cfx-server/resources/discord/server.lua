
-- This function could be a lot better, by adding a test on the name var, using other Discord options, etc.
function sendToDiscord(name, message)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/325694299943731203/oAlvPFjgTQ54QRrdGcbmRWB1AM4zR3oXV3hICZkEFCKSO_xaZfPZAoWJZGh75hodNcRY', function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('playerConnecting', function(name)
  sendToDiscord('SYSTEM', name .. ' joined.')
end)

AddEventHandler('playerDropped', function(reason)
  sendToDiscord('SYSTEM', GetPlayerName(source) .. ' left (' .. reason .. ')')
end)

AddEventHandler('chatMessage', function(source, name, message)  
  if message == nil or message == '' then return FALSE end
  message2 = string.format ("%s : %s", name, message)
  PerformHttpRequest('https://discordapp.com/api/webhooks/325694299943731203/oAlvPFjgTQ54QRrdGcbmRWB1AM4zR3oXV3hICZkEFCKSO_xaZfPZAoWJZGh75hodNcRY', function(err, text, headers) end, 'POST', json.encode({content = message2}), { ['Content-Type'] = 'application/json' })
end)