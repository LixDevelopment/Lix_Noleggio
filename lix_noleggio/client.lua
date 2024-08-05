Citizen.CreateThread(function()
    Wait(250)
    for k, v in pairs(Config.Posizione) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'noleggio'..k,
            pos = v.pos,
            scale = vector3(1.5, 1.5, 1.5),
            msg = 'Premi ~INPUT_CONTEXT~ Per raccogliere',
            control = 'E',
            type = 20,
            color = { r = 130, g = 120, b = 110 },
            action = function()
                TriggerEvent('nui:openMenu')
            end
        })
    end
end)

RegisterNetEvent('nui:openMenu')
AddEventHandler('nui:openMenu', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open' 
    })
end)

RegisterNetEvent('spawnVehicle')
AddEventHandler('spawnVehicle', function(vehicleName)
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end
    ESX.TriggerServerCallback('lix:PrendiSoldiNoleggio', function(hasoldi)
        if hasoldi then
            local vehicle = CreateVehicle(vehicleName, -237.1479, -994.5768, 29.1552, GetEntityHeading(playerPed), true, false)
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            SetPedIntoVehicle(playerPed, vehicle, -1)
            SetModelAsNoLongerNeeded(vehicleName)

            SetNuiFocus(false, false)

            SendNUIMessage({
                action = 'close' 
            })
            end
        end)

end)

RegisterNetEvent('spawnVehicle2')
AddEventHandler('spawnVehicle2', function(vehicleName)
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end
    ESX.TriggerServerCallback('lix:PrendiSoldiNoleggio', function(hasoldi)
        if hasoldi then
            local vehicle = CreateVehicle(vehicleName, -237.1479, -994.5768, 29.1552, GetEntityHeading(playerPed), true, false)
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            SetPedIntoVehicle(playerPed, vehicle, -1)
            SetModelAsNoLongerNeeded(vehicleName)

            SetNuiFocus(false, false)

            SendNUIMessage({
                action = 'close' 
            })
        end
    end)

end)

RegisterNUICallback('selectVehicle', function(data, cb)
    if data.vehicle then
        TriggerEvent('spawnVehicle', data.vehicle)
    end
    SetNuiFocus(false, false)
end)

RegisterNUICallback('selectVehicle2', function(data, cb)
    if data.vehicle then
        TriggerEvent('spawnVehicle', data.vehicle)
    end
    SetNuiFocus(false, false)
end)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = 'close' 
    })
end)