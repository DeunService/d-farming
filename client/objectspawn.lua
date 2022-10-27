local InRadius = false

Object = {
    used = {}
}

CreateThread(function()
    while true do
        Wait(700)

        local coords = GetEntityCoords(PlayerPedId())

        for i, v in pairs(Config.ObjectSpots) do
            if #(coords - v.pos) <= (v.radius) then
                v.inrange = true
            else
                v.inrange = false
            end
        end
    end
end)

local obj
local objPos
local canInteract = false
CreateThread(function()
    while true do
        local Sleep = 1000
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for i, v in pairs(Config.ObjectSpots) do
            if v.inrange then
                for key, value in pairs(v.obj.models) do
                    local model = GetHashKey(value)

                    obj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 1.0, model, false
                        ,
                        false
                        ,
                        false)

                    if DoesEntityExist(obj) then
                        if obj ~= v.activobj then
                            v.activobj = obj
                            objPos = GetEntityCoords(obj)
                        end
                    end
                end

                if objPos then
                    local dist = #(coords - objPos)

                    if dist <= v.obj.interactRadius then
                        canInteract = true
                    elseif dist > v.obj.interactRadius then
                        canInteract = false
                    end
                end

            end
        end

        Wait(Sleep)
    end
end)
CreateThread(function()
    while true do
        local Sleep = 1000

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for i, v in pairs(Config.ObjectSpots) do
            if v.inrange then
                if v.showradius == true and v.showedradius == false then
                    v.radiusbllip = AddBlipForRadius(v.pos.x, v.pos.y, v.pos.z, v.radius)
                    SetBlipHighDetail(v.radiusbllip, true)
                    SetBlipColour(v.radiusbllip, v.blipcolor)
                    SetBlipAlpha(v.radiusbllip, 128)
                    v.showedradius = true
                end

                if canInteract == true and IsPedOnFoot(playerPed) and Object.hasCooldown(v.activobj) == false then
                    Sleep = 0
                    if not IsPickingUp then
                        ShowHelpNotificaiton(v.farmlabel)
                    end

                    if IsControlJustReleased(0, 38) and not IsPickingUp then
                        FarmType = "Object"
                        FarmProp(v)
                    end
                else
                    HideHelpNotificaiton()
                end
            else
                if v.radiusbllip and v.showedradius == true then
                    RemoveBlip(v.radiusbllip)
                    v.showedradius = false
                end
            end
        end

        Wait(Sleep)

    end
end)

Object.hasCooldown = function(obj)
    for i, v in pairs(Object.used) do
        if obj == v then
            return true
        end
    end

    return false
end
