IsPickingUp = false
Props = {}
Activ = {
    v = nil,
    coords = nil,
    coordsi = nil,
    obj = nil,
    id = nil,
    rewards = {
        item = nil,
        amount = nil
    }
}


CreateThread(function()
    while true do
        Wait(700)
        local coords = GetEntityCoords(PlayerPedId())

        for i, v in pairs(Config.PropSpots) do
            if #(coords - v.pos) <= (v.radius) then
                v.inrange = true
                SpawnProps(v)
            else
                v.inrange = false
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(Config.PropSpots) do
            for j, p in pairs(v.spawnedprops) do
                ESX.Game.DeleteObject(p.obj)
            end
        end
    end
end)

CreateThread(function()
    while true do
        local Sleep = 1000

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for i, v in pairs(Config.PropSpots) do
            v.nearbyObject, v.nearbyID = nil, nil
            if v.inrange then
                if v.showradius == true and v.showedradius == false then
                    v.radiusbllip = AddBlipForRadius(v.pos.x, v.pos.y, v.pos.z, v.radius)
                    SetBlipHighDetail(v.radiusbllip, true)
                    SetBlipColour(v.radiusbllip, v.blipcolor)
                    SetBlipAlpha(v.radiusbllip, 128)
                    v.showedradius = true
                end

                for i = 1, #v.spawnedprops, 1 do
                    local prop = v.spawnedprops[i].obj
                    local canInteract = v.spawnedprops[i].canInteract
                    if #(coords - GetEntityCoords(prop)) < 3.0 then
                        v.nearbyObject, v.nearbyID, v.nearbyCanInteract = prop, i, canInteract
                    end
                end

                if v.nearbyObject and IsPedOnFoot(playerPed) and v.nearbyCanInteract == true then
                    Sleep = 0
                    if not IsPickingUp then
                        ShowHelpNotificaiton(v.farmlabel)
                    end

                    if IsControlJustReleased(0, 38) and not IsPickingUp then
                        FarmType = "Prop"
                        FarmProp(v)
                    end
                else
                    HideHelpNotificaiton()
                end
            else
                if v.radiusbllip ~= nil and v.showedradius == true then
                    RemoveBlip(v.radiusbllip)
                    v.showedradius = false
                end
            end
        end

        Wait(Sleep)

    end
end)

function FarmProp(v)
    Props.setreward(v)
    Activ.v = v
    if FarmType == "Prop" then
        Activ.obj = v.nearbyObject
        Activ.id = v.nearbyID
    end

    if tonumber(ESX.PlayerData.job.grade) >= v.rang and ESX.PlayerData.job.name == v.job or v.job == nil then
        IsPickingUp = true
        TriggerServerEvent("d-farmingzone:server:prop:start", Source, v.requireditem, Activ.rewards.item,
            Activ.rewards.amount)
    else
        Notify(_U('justjobcanfarm', v.joblabel, v.rang))
    end
end

Props.setreward = function(v)
    math.randomseed(GetGameTimer())
    local number = math.random(1, #v.items)

    Activ.rewards.item = v.items[number].item

    math.randomseed(GetGameTimer())
    local amount = math.random(v.items[number].minamount, v.items[number].maxamount)
    Activ.rewards.amount = amount
end

Props.clearreward = function()
    Activ.rewards.item = nil
    Activ.rewards.amount = nil
end

RegisterNetEvent("d-farmingzone:props:start")
AddEventHandler("d-farmingzone:props:start", function()
    StartFarm()
end)

RegisterNetEvent("d-farmingzone:props:cantfarm")
AddEventHandler("d-farmingzone:props:cantfarm", function()
    Wait(1000)
    IsPickingUp = false
end)

function FinishedFrarming()
    CreateThread(function()
        Props.clearreward()
        if FarmType == "Prop" then
            IsPickingUp = false
            if Activ.v.delete then
                Activ.v.spawnedprops[Activ.id].canInteract = false
                table.remove(Activ.v.spawnedprops, Activ.id)
                Wait(Activ.v.delete.delay)

                ESX.Game.DeleteObject(Activ.obj)
            else
                Activ.v.spawnedprops[Activ.id].canInteract = false
                Wait(Activ.v.cooldown)
                Activ.v.spawnedprops[Activ.id].canInteract = true
            end
        elseif FarmType == 'Marker' then
            Activ.v.markercoords = nil
            if Activ.v.cooldown then
                Wait(Activ.v.cooldown)
                IsPickingUp = false
            else
                IsPickingUp = false
            end
        elseif FarmType == "Object" then
            IsPickingUp = false
            local obj = Activ.v.activobj

            table.insert(Object.used, obj)
            Wait(Activ.v.cooldown)
            for key, value in pairs(Object.used) do
                if value == obj then
                    table.remove(Object.used, key)
                end
            end
        else
            if Activ.v.cooldown then
                Wait(Activ.v.cooldown)
            end
            IsPickingUp = false
        end
    end)
end

function SpawnProps(v)

    Citizen.CreateThread(function()
        while #v.spawnedprops <= v.propamount do
            Citizen.Wait(0)
            local Coords = GeneratePropCoords(v)

            ESX.Game.SpawnLocalObject(v.prop, Coords, function(obj)
                PlaceObjectOnGroundProperly(obj)
                FreezeEntityPosition(obj, true)
                local data = {
                    obj = obj,
                    canInteract = true
                }
                table.insert(v.spawnedprops, data)
            end)
        end
    end)
end

function ValidateCoord(v, plantCoord)
    if #v.spawnedprops > 0 then
        local validate = true

        for k, p in pairs(v.spawnedprops) do
            if #(plantCoord - GetEntityCoords(p.obj)) < v.distancebetweenprops then
                validate = false
            end
        end

        if #(plantCoord - v.pos) > v.radius then
            validate = false
        end

        return validate
    else
        return true
    end
end

function GeneratePropCoords(v)
    while true do
        Wait(0)
        local centercoords = v.pos
        local radius = v.radius
        local CoordX, CoordY

        math.randomseed(GetGameTimer())
        local modX = math.random(radius * -1, radius)

        Wait(100)

        math.randomseed(GetGameTimer())
        local modY = math.random(radius * -1, radius)

        CoordX = centercoords.x + modX
        CoordY = centercoords.y + modY

        local CoordZ = GetCoordZ(CoordX, CoordY, centercoords.z)
        local coord = vector3(CoordX, CoordY, CoordZ)

        if ValidateCoord(v, coord) then
            return coord
        end
    end
end

function GetCoordZ(x, y, centerz)
    for i = centerz - 10, centerz + 10, 1 do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, i)

        if foundGround then
            return z
        end
    end

    return 43.0
end
