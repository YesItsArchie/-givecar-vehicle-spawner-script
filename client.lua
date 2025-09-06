RegisterNetEvent("custom:spawnCar")
AddEventHandler("custom:spawnCar", function(carModel)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    local model = GetHashKey(carModel)

    -- Request and load model
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end

    -- Create vehicle
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)

    -- Make sure player owns it
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "CUSTOM")

    -- Cleanup model
    SetModelAsNoLongerNeeded(model)

    -- Notify player
    TriggerEvent("chat:addMessage", {
        args = {"^2[Custom Event]", "Spawned vehicle: " .. carModel}
    })
end)
