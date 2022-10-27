local InRadius = false

Radius = {

}

CreateThread(function()
    while true do
        Wait(700)

        local coords = GetEntityCoords(PlayerPedId())

        for i, v in pairs(Config.RadiusSpots) do
            if #(coords - v.pos) <= (v.radius) then
                v.inrange = true
            else
                v.inrange = false
            end
        end
    end
end)

CreateThread(function()
    while true do
        local Sleep = 1000

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for i, v in pairs(Config.RadiusSpots) do
            if v.inrange then
                Sleep = 0
                if v.showradius == true and v.showedradius == false then
                    v.radiusbllip = AddBlipForRadius(v.pos.x, v.pos.y, v.pos.z, v.radius)
                    SetBlipHighDetail(v.radiusbllip, true)
                    SetBlipColour(v.radiusbllip, v.blipcolor)
                    SetBlipAlpha(v.radiusbllip, 128)
                    v.showedradius = true
                end

                if v.inrange and IsPedOnFoot(playerPed) then
                    if not IsPickingUp then
                        ShowHelpNotificaiton(v.farmlabel)
                    end

                    if IsControlJustReleased(0, 38) and not IsPickingUp then
                        FarmType = "Radius"
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
