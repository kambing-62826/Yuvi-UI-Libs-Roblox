local Yv = loadstring(game:HttpGet("https://raw.githubusercontent.com/kambing-62826/Yuvi-UI-Libs/refs/heads/main/test.lua"))()

local StarterGui = game:GetService("StarterGui")
local featureRunning = false
local pgThread

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", { Title = title, Text = text, Duration = duration or 3 })
    end)
end

local MainTab = Yv:createTab("Main")
local InfoTab = Yv:createTab("Info")
local SgTab = Yv:createTab("Settings")

MainTab:createSection({
    Name = "Player Control",
    Column = 1
})

MainTab:createToggle({
    Name = "Fly Mode",
    CurrentValue = false,
    Flag = "FlyToggle",
    Column = 1,
    Callback = function(state)
        print("Fly Mode:", state)
    end
})

MainTab:createSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Column = 1,
    Callback = function(speed)
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = speed
        end
    end
})

MainTab:createButton({
    Name = "Respawn",
    Column = 1,
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:BreakJoints()
            print("Respawn !")
        end
    end
})

MainTab:createToggle({
    Name = "Free Private Server",
    CurrentValue = false,
    Flag = "Private Server",
    Column = 1,
    Callback = function(state)
        if state then
            if not featureRunning then
                featureRunning = true
                Yv:Notify("Feature Toggle", "Feature is now ON", 2)
                pgThread = task.spawn(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/veil0x14/LocalScripts/refs/heads/main/pg.lua"))()
                end)
            end
        else
            if featureRunning then
                featureRunning = false
                Yv:Notify("Feature Toggle", "Feature is now OFF", 2)
                if pgThread then
                    task.cancel(pgThread)
                    pgThread = nil
                end
            end
        end
    end
})

SgTab:createSection({
    Name = "Keybind",
    Column = 1
})

SgTab:createKeybind({
    Name = "Toggle Fly",
    Default = Enum.KeyCode.F,
    Column = 1,
    Callback = function()
        print("Pressed Fly Key")
    end
})

-- 🎨 UI Theme
local ThemeNames = {}
for name in pairs(Yv.Themes or {}) do
    table.insert(ThemeNames, name)
end

SgTab:createSection({
    Name = "UI Theme",
    Column = 2
})

SgTab:createDropdown({
    Name = "Select Theme",
    Options = ThemeNames,
    CurrentOption = "Dark Red",
    Column = 2,
    Callback = function(selectedThemeName)
        if selectedThemeName then
            Yv:ApplyTheme(selectedThemeName)
            if Yv.Notify then
                Yv:Notify("Theme Changed", "UI theme set to: " .. selectedThemeName, 1.5)
            else
                notify("Theme Changed", "UI theme set to: " .. selectedThemeName, 1.5)
            end
        end
    end
})
