Config = {}
Config.Locale = 'en'

Config.ESXLegacy = true
Config.GetSharedObjectfunction = true

Config.RadiusSpots = {
    {
        -- Blipname
        showblip = true,
        blipname = "Radius Test",
        blip = 130,
        blipcolor = 7,
        blipscale = 0.7,
        -- show radius on the map while in range
        showradius = true,
        -- Coords
        pos = vector3(1959.666, 5676.962, 208.4608),
        radius = 25.0, -- Radius where you can mine / props spawn .  Dont forget the .0 after the number
        cooldown = 1000, -- in Miniliseconds
        -- Marker
        markertype = 25,
        markercolor = {
            red = 255,
            blue = 255,
            green = 255,
        },
        markersize = 3.0, -- dont forget there .0 here aswell :)
        showmarkerdistance = 50,
        -- Animation
        anim = {
            animDict = "random@mugging4",
            anim = "struggle_loop_b_thief",
            flags = 49,
            task = nil,
        },
        -- Job
        job = nil,
        joblabel = nil,
        rang = 1,

        farmlabel = "Press ~INPUT_CONTEXT~ to start mining",
        -- Items
        requireditem = nil,
        farmtime = 5000,
        barlabel = "Example Barlabel",
        items = {
            {
                id = 1,
                item = "bread",
                minamount = 1,
                maxamount = 10,
            },
            {
                id = 1,
                item = "water",
                minamount = 1,
                maxamount = 10,
            },
        },
    },
}

Config.MarkerSpots = {
    {
        -- Blipname
        showblip = true,
        blipname = "Marker Test",
        blip = 130,
        blipcolor = 7,
        blipscale = 0.7,
        -- show radius on the map while in range
        showradius = true,
        -- Coords
        pos = vector3(2220.72, 5582.52, 53.81),
        radius = 25.0, -- Radius where you can mine / props spawn .  Dont forget the .0 after the number

        -- Marker
        markertype = 25,
        markercolor = {
            red = 255,
            blue = 255,
            green = 255,
        },
        markersize = 3.0, -- dont forget there .0 here aswell :)
        showmarkerdistance = 50,
        -- Animation
        anim = {
            animDict = "random@mugging4",
            anim = "struggle_loop_b_thief",
            flags = 49,
            task = nil,
        },
        -- Job
        job = nil,
        joblabel = nil,
        rang = 1,
        --
        farmlabel = "Press ~INPUT_CONTEXT~ to start mining",
        -- Items
        requireditem = nil,
        farmtime = 5000,
        barlabel = "Example Barlabel",
        items = {
            {
                id = 1,
                item = "bread",
                minamount = 1,
                maxamount = 10,
            },
            {
                id = 1,
                item = "water",
                minamount = 1,
                maxamount = 10,
            },
        },
    },
    {
        -- Blipname
        showblip = true,
        blipname = "Static Marker Test",
        blip = 130,
        blipcolor = 7,
        blipscale = 0.7,
        -- show radius on the map while in range
        showradius = false,
        -- Coords
        pos = vector3(99.73188, 6535.226, 31.65564),
        radius = 25.0, -- Radius where you can mine / props spawn .  Dont forget the .0 after the number

        -- Marker
        markertype = 25,
        markercolor = {
            red = 255,
            blue = 255,
            green = 255,
        },
        static = true,
        cooldown = 1000, -- in Miniliseconds
        markersize = 3.0, -- dont forget there .0 here aswell :)
        showmarkerdistance = 50,
        -- Animation
        anim = {
            animDict = "random@mugging4",
            anim = "struggle_loop_b_thief",
            flags = 49,
            task = nil,
        },
        -- Job
        job = nil,
        joblabel = nil,
        rang = 1,
        --
        farmlabel = "Press ~INPUT_CONTEXT~ to start mining",
        -- Items
        requireditem = nil,
        farmtime = 5000,
        barlabel = "Example Barlabel",
        items = {
            {
                id = 1,
                item = "bread",
                minamount = 1,
                maxamount = 10,
            },
            {
                id = 1,
                item = "water",
                minamount = 1,
                maxamount = 10,
            },
        },
    },
}

Config.PropSpots = {
    {
        -- Blipname
        showblip = true,
        blipname = "Prop Test Mit Prop delete",
        blip = 130,
        blipcolor = 7,
        blipscale = 0.7,
        -- show radius on the map while in range
        showradius = true,
        -- Coords
        pos = vector3(427, 6531, 27),
        radius = 25.0, -- Radius where you can mine / props spawn .  Dont forget the .0 after the number

        -- Prop
        prop = 'prop_weed_02',
        -- How many props should spawn to mine
        propamount = 10,
        distancebetweenprops = 5.0,
        delete = {
            delay = 3000,
        },
        -- Animation
        anim = {
            animDict = "random@mugging4",
            anim = "struggle_loop_b_thief",
            flags = 49,
            task = nil,
        },
        -- Job
        job = 'police',
        joblabel = "Police",
        rang = 1,
        --
        farmlabel = "Press ~INPUT_CONTEXT~ to start mining",
        -- Items
        -- Set this to nil if you dont want to have an item
        requireditem = nil,
        farmtime = 5000,
        barlabel = "Example Barlabel",
        items = {
            {
                id = 1,
                item = "bread",
                minamount = 1,
                maxamount = 10,
            },
            {
                id = 1,
                item = "water",
                minamount = 1,
                maxamount = 10,
            },
        },
    },
    {
        -- Blipname
        showblip = true,
        blipname = "Prop Test Mit Cooldown",
        blip = 130,
        blipcolor = 7,
        blipscale = 0.7,
        -- show radius on the map while in range
        showradius = true,
        -- Coords
        pos = vector3(1409.196, 6523.516, 18.24316),
        radius = 25.0, -- Radius where you can mine / props spawn .  Dont forget the .0 after the number

        -- Prop
        prop = 'prop_weed_02',
        -- How many props should spawn to mine
        propamount = 10,
        distancebetweenprops = 5.0,
        cooldown = 5000, -- in Miniliseconds
        -- Animation
        anim = {
            animDict = "random@mugging4",
            anim = "struggle_loop_b_thief",
            flags = 49,
            task = nil,
        },
        -- Job
        job = nil,
        joblabel = nil,
        rang = 1,
        --
        farmlabel = "Press ~INPUT_CONTEXT~ to start mining",
        -- Items
        requireditem = nil,
        farmtime = 5000,
        barlabel = "Example Barlabel",
        items = {
            {
                id = 1,
                item = "bread",
                minamount = 1,
                maxamount = 10,
            },
            {
                id = 1,
                item = "water",
                minamount = 1,
                maxamount = 10,
            },
        },
    },
}

Config.ObjectSpots = {
    {
        -- Blipname
        showblip = true,
        blipname = "Object Test",
        blip = 130,
        blipcolor = 7,
        blipscale = 0.7,
        -- show radius on the map while in range
        showradius = true,
        -- Coords
        pos = vector3(147.745, -1035, 29.3),
        radius = 10.0, -- Radius where you can mine / props spawn .  Dont forget the .0 after the number

        -- Prop
        -- This doenst work with every prop, i dont know why.
        obj = {
            models = { 'prop_atm_01', 'prop_atm_02', 'prop_fleeca_atm', 'prop_atm_03' },
            interactRadius = 3.0
        },
        cooldown = 5000, -- in Miniliseconds
        -- Animation
        anim = {
            animDict = "random@mugging4",
            anim = "struggle_loop_b_thief",
            flags = 49,
            task = nil,
        },
        -- Job
        job = nil,
        joblabel = nil,
        rang = 1,
        --
        farmlabel = "Press ~INPUT_CONTEXT~ to start the process",
        -- Items
        requireditem = nil,
        farmtime = 5000,
        barlabel = "Example Barlabel",
        items = {
            {
                id = 1,
                item = "bread",
                minamount = 1,
                maxamount = 10,
            },
            {
                id = 1,
                item = "water",
                minamount = 1,
                maxamount = 10,
            },
        },
    },
}
