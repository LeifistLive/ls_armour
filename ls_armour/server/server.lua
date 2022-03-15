ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




AddEventHandler('esx:playerLoaded', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT armour FROM users WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.getIdentifier()
        }, function(result)
        if result[1].armour ~= nil then
        if result[1].armour ~= 0 then
            TriggerClientEvent('ls_armour:setarmour', source, result[1].armour)
        end
        end
    end)
end)


RegisterServerEvent('ls_armour:refresharmour')
AddEventHandler('ls_armour:refresharmour', function(updateArmour)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.execute("UPDATE users SET armour = @armour WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.getIdentifier(),
        ['@armour'] = tonumber(updateArmour)
    })
end)

