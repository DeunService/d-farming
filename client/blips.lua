local npcspotss = {}
function setupBlips()
    for _, v in pairs(Config.MarkerSpots) do
        if v.showblip == true then
            local blip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)

            SetBlipSprite(blip, v.blip)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, v.blipscale)
            SetBlipColour(blip, v.blipcolor)

            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.blipname)
            EndTextCommandSetBlipName(blip)

            table.insert(npcspotss, blip)
        end
        v.showedradius = false
    end

    for _, v in pairs(Config.RadiusSpots) do
        if v.showblip == true then
            local blip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)

            SetBlipSprite(blip, v.blip)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, v.blipscale)
            SetBlipColour(blip, v.blipcolor)

            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.blipname)
            EndTextCommandSetBlipName(blip)

            table.insert(npcspotss, blip)
        end
        v.showedradius = false
    end

    for _, v in pairs(Config.PropSpots) do
        if v.showblip == true then
            local blip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)

            SetBlipSprite(blip, v.blip)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, v.blipscale)
            SetBlipColour(blip, v.blipcolor)

            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.blipname)
            EndTextCommandSetBlipName(blip)

            table.insert(npcspotss, blip)
        end
        v.showedradius = false
        v.spawnedprops = {}
    end

    for _, v in pairs(Config.ObjectSpots) do
        if v.showblip == true then
            local blip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)

            SetBlipSprite(blip, v.blip)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, v.blipscale)
            SetBlipColour(blip, v.blipcolor)

            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.blipname)
            EndTextCommandSetBlipName(blip)

            table.insert(npcspotss, blip)
        end
        v.showedradius = false
    end
end

Citizen.CreateThread(function()
    setupBlips()
end)
