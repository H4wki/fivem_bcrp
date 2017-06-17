local Tunnel = require("resources/vrp/lib/Tunnel")
local Proxy = require("resources/vrp/lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","frfuel")

fuel = 2.19 -- Fuel Cost, this could be made to randomise between 1.05 and 1.30 or something like that

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

RegisterServerEvent('frfuel:fuelAdded')
AddEventHandler('frfuel:fuelAdded', function(amount)

    for k,v in ipairs(GetPlayers())do
		local cost = fuel * amount
		local cost2 = round(cost)
		if vRP.tryFullPayment(source,cost2)then
			vRPclient.notify("You have paid $" .. cost .. " for fuel")
		else
			vRPclient.notify("You have driven off without paying $" .. cost .. " for fuel")
			vRPclient.notify("Police may have been notified!")
		end
    end

end)