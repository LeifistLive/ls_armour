local IsFirstSpawn = true

AddEventHandler("playerSpawned", function(spawn)
    if IsFirstSpawn == true then
        Citizen.Wait(15000)
        IsFirstSpawn = false
    end
end)



RegisterNetEvent('ls_armour:setarmour')
AddEventHandler('ls_armour:setarmour', function(armour)
    Citizen.Wait(10000) 
    SetPedArmour(PlayerPedId(), tonumber(armour))
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsFirstSpawn == false then
            TriggerServerEvent('ls_armour:refresharmour', GetPedArmour(PlayerPedId()))
            Citizen.Wait(10000)
        end
    end
end)
