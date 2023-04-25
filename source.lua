local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()

if game.PlaceId == 5989426850 then
    --// Functions
    local function getPlayerByPlayerName(name)
        if name then
            name = name:lower()
            for i, v in ipairs(players:GetPlayers()) do
                if string.lower(string.sub(v.Name, 1, #name)) == name then
                    return v
                end
                if string.lower(string.sub(v.DisplayName, 1, #name)) == name then
                    return v
                end
            end
            for i, v in ipairs(players:GetPlayers()) do
                if string.match(v.Name:lower(), name) then
                    return v
                end
                if string.match(v.DisplayName:lower(), name) then
                    return v
                end
            end
        end
    end

    local function getTargetPlayer(name) -- try to get a target player from the name
        local target
        if name == " " or name == "" then
            -- if target player isn't specified, use the localplayer
            target = localPlayer
            return target
        end
        local matchingPlayer = getPlayerByPlayerName(name)
        if name:lower() == "me" then
            target = localPlayer
            return target
        elseif name:lower() == "random" then
            local playerTable = players:GetPlayers()
            target = playerTable[math.random(#playerTable)]
            return target
        elseif matchingPlayer then
            target = matchingPlayer
            return target
        end
        target = localPlayer
        return target
    end
    local random = Random.new()
    local letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

    local function getRandomLetter()
        return letters[random:NextInteger(1,#letters)]
    end

    local function getRandomString(length, includeCapitals)
        local length = length or 10
        local str = ''
        for i=1,length do
            local randomLetter = getRandomLetter()
            if includeCapitals and random:NextNumber() > .5 then
                randomLetter = string.upper(randomLetter)
            end
            str = str .. randomLetter
        end
        return str
    end

    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
    local win = library.new("Transfur Infection 2 Version 0.0.1 ALPHA", 5013109572)

    --// Themes
    local themes = {
        Background = Color3.fromRGB(24, 24, 24),
        Glow = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(10, 10, 10),
        LightContrast = Color3.fromRGB(20, 20, 20),
        DarkContrast = Color3.fromRGB(14, 14, 14),
        TextColor = Color3.fromRGB(255, 255, 255)
    }

    --// Main
    local main = win:addPage("Main", 5012544693)
    local ms1 = main:addSection("Main")
    ms1:addButton("Walk Through Kill Borders", function()
        local map = game.Workspace.Map
        local forcefields = map:GetChildren()

        for i = 1, #forcefields do
            if forcefields[i].Name == "Forcefield" then
                local ggBois = forcefields[i]:Clone()
                ggBois.Name = getRandomString(7, true)
                ggBois.Parent = map
                forcefields[i]:Destroy()
            end
        end
        Notification.new("success", "OMG",  "IT WORKS!?!?")
    end)


    --Load
    win:SelectPage(win.pages[1], true)

    --// Copy Discord Invite
    Notification.new("success", "Noice 🥶",  "Discord Copied!")
    setclipboard("https://discord.io/Dev1fyfanclub")
else
    Notification.new("error", "Wrong Game",  "Transfur Infection 2")
    setclipboard("https://discord.io/Dev1fyfanclub")
end
