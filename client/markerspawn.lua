local InMarker = false
FarmType = nil
Marker = {

}

CreateThread(function()
    while true do
        Wait(700)
        local coords = GetEntityCoords(PlayerPedId())

        for i, v in pairs(Config.MarkerSpots) do
            if #(coords - v.pos) <= (v.radius * 1.1) then
                v.inrange = true

                Marker.Create(v, i)
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
        for i, v in pairs(Config.MarkerSpots) do
            if v.inrange then
                Sleep = 0
                if v.showradius == true and v.showedradius == false then
                    v.radiusbllip = AddBlipForRadius(v.pos.x, v.pos.y, v.pos.z, v.radius)
                    SetBlipHighDetail(v.radiusbllip, true)
                    SetBlipColour(v.radiusbllip, v.blipcolor)
                    SetBlipAlpha(v.radiusbllip, 128)
                    v.showedradius = true
                end

                if v.markercoords then

                    DrawMarker(27, v.markercoords.x, v.markercoords.y, v.markercoords.z + 0.1, 0, 0, 0, 0, 0, 0,
                        v.markersize,
                        v.markersize, 2.0, 0,
                        v.markercolor.red, v.markercolor.blue, v.markercolor.green, 0, 0, 2, 0, 0, 0, 0)

                    if #(coords - v.markercoords) < v.markersize then
                        InMarker = true
                    else
                        InMarker = false
                    end
                end




                if InMarker and IsPedOnFoot(playerPed) then
                    if not IsPickingUp then
                        ShowHelpNotificaiton(v.farmlabel)
                    else
                        ShowHelpNotificaiton("Cooldown")
                    end

                    if IsControlJustReleased(0, 38) and not IsPickingUp then
                        FarmType = "Marker"
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

Marker.Create = function(v, i)
    if v.markercoords == nil then
        Wait(0)
        local Coords = v.pos
        if v.static == nil or v.static == false then
            Coords = Marker.GenerateCoords(v)
        else
            CoordsZ = GetCoordZ(v.pos.x, v.pos.y, v.pos.z)
            CoordsX = v.pos.x
            CoordsY = v.pos.y

            Coords = vector3(CoordsX, CoordsY, CoordsZ)
        end
        v.markercoords = Coords
        v.markercoordsi = i
    end
end

Marker.GenerateCoords = function(v)
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

        if Marker.ValidateCoord(v, coord) then
            return coord
        end
    end
end

Marker.ValidateCoord = function(v, plantCoord)
    local validate = true

    if #(plantCoord - v.pos) > v.radius then
        validate = false
    end

    return validate
end
