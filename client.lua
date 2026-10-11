RegisterCommand('cleararea', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local radius = 50.0

    local vehicles = GetGamePool('CVehicle')
    local count = 0
    for _, vehicle in ipairs(vehicles) do
        local vehCoords = GetEntityCoords(vehicle)
        if #(coords - vehCoords) <= radius and GetPedInVehicleSeat(vehicle, -1) == 0 then
            DeleteEntity(vehicle)
            count = count + 1
        end
    end

    TriggerEvent('chat:addMessage', {
        color = {0, 255, 100},
        multiline = true,
        args = { "ADMIN SYSTEM", "Pulizia completata da Peppe7804! Rimossi " .. count .. " veicoli vuoti." }
    })
end, false)
