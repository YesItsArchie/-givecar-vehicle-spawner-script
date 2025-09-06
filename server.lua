RegisterCommand("givecar", function(source, args)
    local carModel = args[1] or "adder" -- default if none specified
    TriggerClientEvent("custom:spawnCar", source, carModel)
end, false)
