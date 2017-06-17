
RegisterClientEvent('frfuel:paidfuel')
AddEventHandler('frfuel:paidfuel', function(cost)
	vRP.notify("You have paid $" .. cost .. " for fuel")
end)

RegisterClientEvent('frfuel:stealfuel')
AddEventHandler('frfuel:stealfuel', function(cost)
	vRP.notify("You have driven off without paying $" .. cost .. " for fuel")
	vRP.notify("Police may have been notified!")
end)