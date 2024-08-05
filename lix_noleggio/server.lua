

RegisterNetEvent('nui:openMenu')
AddEventHandler('nui:openMenu', function()

    SetNuiFocus(true, true)


    SendNUIMessage({
        action = 'open'
    })
end)


ESX.RegisterServerCallback('lix:PrendiSoldiNoleggio', function(src, cb, prezzo)
    local xPlayer = ESX.GetPlayerFromId(src)
    prezzo = tonumber(Config.Prezzo)
    
    if xPlayer.getAccount('bank').money >= prezzo then
        xPlayer.removeAccountMoney('bank', prezzo)
        cb(true)
    else
        xPlayer.showNotification('Non hai abbastanza soldi!')
        cb(false)
    end
end)


