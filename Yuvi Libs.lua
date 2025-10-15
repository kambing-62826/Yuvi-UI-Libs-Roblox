-- YUVI Libs

task.defer(function()
    local LS = game:GetService("LocalizationService")
    if LS then
        pcall(function()
            LS.RobloxForceTranslated = false
            LS.SystemLocaleId = "en-us"
            LS.RobloxLocaleId = "en-us"
        end)
    end
end)

-- === THEME CONFIGURATION ===
local CurrentTheme = {}

local Themes = {
    
        ['Sunset Ember'] = {
        MainBG = Color3.fromRGB(30, 20, 15),
        HeaderBG = Color3.fromRGB(45, 25, 15),
        Accent = Color3.fromRGB(255, 100, 0),
        AccentDark = Color3.fromRGB(200, 60, 0),
        ButtonBG = Color3.fromRGB(60, 40, 30),
        ButtonHover = Color3.fromRGB(80, 50, 35),
        ToggleOffKnob = Color3.fromRGB(0, 0, 0),
        ToggleGlow = Color3.fromRGB(255, 130, 50),
        TabBGInactive = Color3.fromRGB(60, 45, 35),
        DropdownBG = Color3.fromRGB(50, 35, 25),
        DropdownListBG = Color3.fromRGB(40, 30, 20),
        DropdownOptionBG = Color3.fromRGB(55, 40, 30),
        DropdownOptionActive = Color3.fromRGB(90, 50, 35),
        TextColor = Color3.fromRGB(255, 220, 200),
        TextColorSecondary = Color3.fromRGB(210, 180, 160),
        GradientStart = Color3.fromRGB(255, 140, 60),
        GradientEnd = Color3.fromRGB(150, 60, 20),
        KeybindGlow = Color3.fromRGB(255, 160, 100),
        StrokeDark = Color3.fromRGB(20, 10, 5),
        StrokeAccent = Color3.fromRGB(180, 70, 30),
    },

    ['Blue Steel'] = {
        MainBG = Color3.fromRGB(30, 35, 45),
        HeaderBG = Color3.fromRGB(40, 50, 60),
        Accent = Color3.fromRGB(0, 120, 255),
        AccentDark = Color3.fromRGB(0, 70, 180),
        ButtonBG = Color3.fromRGB(55, 65, 75),
        ButtonHover = Color3.fromRGB(70, 85, 95),
        ToggleOffKnob = Color3.fromRGB(0, 0, 0),
        ToggleGlow = Color3.fromRGB(0, 180, 255),
        TabBGInactive = Color3.fromRGB(55, 65, 75),
        DropdownBG = Color3.fromRGB(45, 55, 65),
        DropdownListBG = Color3.fromRGB(35, 45, 55),
        DropdownOptionBG = Color3.fromRGB(45, 55, 65),
        DropdownOptionActive = Color3.fromRGB(30, 60, 90),
        TextColor = Color3.fromRGB(255, 255, 255),
        TextColorSecondary = Color3.fromRGB(200, 200, 200),
        GradientStart = Color3.fromRGB(0, 100, 200),
        GradientEnd = Color3.fromRGB(0, 50, 150),
        KeybindGlow = Color3.fromRGB(255, 180, 0),
        StrokeDark = Color3.fromRGB(10, 15, 20),
        StrokeAccent = Color3.fromRGB(0, 80, 180),
    },

    ['Green Army'] = {
        MainBG = Color3.fromRGB(35, 40, 30),
        HeaderBG = Color3.fromRGB(45, 55, 40),
        Accent = Color3.fromRGB(0, 200, 0),
        AccentDark = Color3.fromRGB(0, 150, 0),
        ButtonBG = Color3.fromRGB(60, 70, 50),
        ButtonHover = Color3.fromRGB(75, 85, 65),
        ToggleOffKnob = Color3.fromRGB(0, 0, 0),
        ToggleGlow = Color3.fromRGB(50, 255, 50),
        TabBGInactive = Color3.fromRGB(60, 70, 50),
        DropdownBG = Color3.fromRGB(50, 60, 40),
        DropdownListBG = Color3.fromRGB(40, 50, 35),
        DropdownOptionBG = Color3.fromRGB(50, 60, 45),
        DropdownOptionActive = Color3.fromRGB(40, 80, 40),
        TextColor = Color3.fromRGB(255, 255, 255),
        TextColorSecondary = Color3.fromRGB(200, 200, 200),
        GradientStart = Color3.fromRGB(0, 150, 0),
        GradientEnd = Color3.fromRGB(0, 80, 0),
        KeybindGlow = Color3.fromRGB(255, 200, 0),
        StrokeDark = Color3.fromRGB(20, 25, 15),
        StrokeAccent = Color3.fromRGB(0, 120, 0),
    },

    ['Purple Night'] = {
        MainBG = Color3.fromRGB(30, 25, 45),
        HeaderBG = Color3.fromRGB(40, 35, 60),
        Accent = Color3.fromRGB(180, 0, 255),
        AccentDark = Color3.fromRGB(100, 0, 160),
        ButtonBG = Color3.fromRGB(55, 45, 70),
        ButtonHover = Color3.fromRGB(75, 65, 90),
        ToggleOffKnob = Color3.fromRGB(0, 0, 0),
        ToggleGlow = Color3.fromRGB(200, 100, 255),
        TabBGInactive = Color3.fromRGB(60, 50, 70),
        DropdownBG = Color3.fromRGB(50, 40, 60),
        DropdownListBG = Color3.fromRGB(40, 30, 50),
        DropdownOptionBG = Color3.fromRGB(55, 45, 65),
        DropdownOptionActive = Color3.fromRGB(90, 50, 130),
        TextColor = Color3.fromRGB(255, 255, 255),
        TextColorSecondary = Color3.fromRGB(210, 200, 220),
        GradientStart = Color3.fromRGB(140, 0, 200),
        GradientEnd = Color3.fromRGB(80, 0, 120),
        KeybindGlow = Color3.fromRGB(255, 100, 255),
        StrokeDark = Color3.fromRGB(25, 20, 35),
        StrokeAccent = Color3.fromRGB(120, 0, 180),
    },

    ['Gold Noir'] = {
        MainBG = Color3.fromRGB(25, 20, 10),
        HeaderBG = Color3.fromRGB(40, 30, 15),
        Accent = Color3.fromRGB(255, 200, 0),
        AccentDark = Color3.fromRGB(200, 140, 0),
        ButtonBG = Color3.fromRGB(55, 45, 25),
        ButtonHover = Color3.fromRGB(75, 60, 30),
        ToggleOffKnob = Color3.fromRGB(0, 0, 0),
        ToggleGlow = Color3.fromRGB(255, 220, 100),
        TabBGInactive = Color3.fromRGB(55, 45, 25),
        DropdownBG = Color3.fromRGB(50, 40, 20),
        DropdownListBG = Color3.fromRGB(35, 25, 15),
        DropdownOptionBG = Color3.fromRGB(55, 45, 25),
        DropdownOptionActive = Color3.fromRGB(90, 70, 25),
        TextColor = Color3.fromRGB(255, 235, 180),
        TextColorSecondary = Color3.fromRGB(210, 200, 180),
        GradientStart = Color3.fromRGB(255, 190, 50),
        GradientEnd = Color3.fromRGB(160, 110, 20),
        KeybindGlow = Color3.fromRGB(255, 240, 120),
        StrokeDark = Color3.fromRGB(25, 20, 10),
        StrokeAccent = Color3.fromRGB(160, 110, 0),
    },

    ['Silver Tech'] = {
        MainBG = Color3.fromRGB(35, 35, 40),
        HeaderBG = Color3.fromRGB(45, 45, 55),
        Accent = Color3.fromRGB(200, 200, 200),
        AccentDark = Color3.fromRGB(120, 120, 130),
        ButtonBG = Color3.fromRGB(70, 70, 80),
        ButtonHover = Color3.fromRGB(90, 90, 100),
        ToggleOffKnob = Color3.fromRGB(0, 0, 0),
        ToggleGlow = Color3.fromRGB(255, 255, 255),
        TabBGInactive = Color3.fromRGB(70, 70, 80),
        DropdownBG = Color3.fromRGB(55, 55, 65),
        DropdownListBG = Color3.fromRGB(45, 45, 55),
        DropdownOptionBG = Color3.fromRGB(60, 60, 70),
        DropdownOptionActive = Color3.fromRGB(90, 90, 100),
        TextColor = Color3.fromRGB(255, 255, 255),
        TextColorSecondary = Color3.fromRGB(210, 210, 210),
        GradientStart = Color3.fromRGB(180, 180, 190),
        GradientEnd = Color3.fromRGB(100, 100, 110),
        KeybindGlow = Color3.fromRGB(0, 150, 255),
        StrokeDark = Color3.fromRGB(20, 20, 25),
        StrokeAccent = Color3.fromRGB(160, 160, 160),
    },

    ['Dark Red'] = {
        MainBG = Color3.fromRGB(25, 25, 25),
        HeaderBG = Color3.fromRGB(35, 35, 35),
        Accent = Color3.fromRGB(255, 0, 0),
        AccentDark = Color3.fromRGB(180, 0, 0),
        ButtonBG = Color3.fromRGB(60, 60, 60),
        ButtonHover = Color3.fromRGB(80, 80, 80),
        ToggleOffKnob = Color3.fromRGB(0, 0, 0),
        ToggleGlow = Color3.fromRGB(255, 50, 50),
        TabBGInactive = Color3.fromRGB(60, 60, 60),
        DropdownBG = Color3.fromRGB(50, 50, 50),
        DropdownListBG = Color3.fromRGB(45, 45, 45),
        DropdownOptionBG = Color3.fromRGB(55, 55, 55),
        DropdownOptionActive = Color3.fromRGB(90, 30, 30),
        TextColor = Color3.fromRGB(255, 255, 255),
        TextColorSecondary = Color3.fromRGB(200, 200, 200),
        GradientStart = Color3.fromRGB(180, 0, 0),
        GradientEnd = Color3.fromRGB(90, 0, 0),
        KeybindGlow = Color3.fromRGB(0, 150, 255),
        StrokeDark = Color3.fromRGB(20, 20, 20),
        StrokeAccent = Color3.fromRGB(120, 0, 0),
    },
}

local function applyTheme(themeName)
    local theme = Themes[themeName]
    if theme then
        CurrentTheme = theme
        print("Applied theme:", themeName)
    else
        warn("Theme not found:", themeName)
    end
end

local ThemeNames = {}
for name in pairs(Themes) do
    table.insert(ThemeNames, name)
end

applyTheme(ThemeNames[1])

-- === SERVICE ===
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", { Title = title, Text = text, Duration = duration or 3 })
    end)
end

-- DRAG FUNCTION
local function makeDraggable(frame, dragHandle)
    dragHandle = dragHandle or frame
    local dragging = false
    local dragInput, startPos, framePos
    
    local inputChangedConnection = UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - startPos
            frame.Position = UDim2.new(
                framePos.X.Scale, framePos.X.Offset + delta.X,
                framePos.Y.Scale, framePos.Y.Offset + delta.Y
            )
        end
    end)

    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragHandle:IsA("TextButton") and not dragHandle.Active then return end
            local x = input.Position.X
            local y = input.Position.Y
            local absX, absY = dragHandle.AbsolutePosition.X, dragHandle.AbsolutePosition.Y
            local absSizeX, absSizeY = dragHandle.AbsoluteSize.X, dragHandle.AbsoluteSize.Y

            if x >= absX and x <= absX + absSizeX and y >= absY and y <= absY + absSizeY then
                dragging = true
                startPos = input.Position
                framePos = frame.Position
            end
        end
    end

    local function onInputEnded(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and dragging then
            dragging = false
        end
    end

    dragHandle.InputBegan:Connect(onInputBegan)
    UserInputService.InputEnded:Connect(onInputEnded)

    frame.Destroying:Connect(function()
        inputChangedConnection:Disconnect()
    end)
end

local function makeResizable(frame)
    local resizeHandle = Instance.new("Frame")
    resizeHandle.Name = "ResizeHandle"
    resizeHandle.Size = UDim2.new(0, 16, 0, 16)
    resizeHandle.AnchorPoint = Vector2.new(1, 1)
    resizeHandle.Position = UDim2.new(1, -4, 1, -4)
    resizeHandle.BackgroundColor3 = CurrentTheme.AccentDark or Color3.fromRGB(180, 0, 0) 
    resizeHandle.BorderSizePixel = 0
    resizeHandle.ZIndex = 200
    resizeHandle.Parent = frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = resizeHandle

    local resizing = false
    local startPos, startSize

    resizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            startPos = input.Position
            startSize = frame.Size
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and resizing then
            resizing = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - startPos
            local newWidth = math.clamp(startSize.X.Offset + delta.X, 400, 1000)
            local newHeight = math.clamp(startSize.Y.Offset + delta.Y, 250, 800)
            frame.Size = UDim2.new(0, newWidth, 0, newHeight)
        end
    end)
    
    return resizeHandle
end

-- UI MODULE OBJECT
local UI = {}
UI._tabs = {}
UI._tabFrames = {}
UI._keybinds = {}
UI._keybindCallbacks = {}
UI._editing = nil
UI._activeTab = nil
UI._Elements = {
    MainFrame = nil,
    stroke = nil,
    TabHolder = nil,
    TitleLabel = nil,
    textGradient = nil,
    MinimizeBtn = nil,
    CloseBtn = nil,
    PopupBtn = nil,
    TabButtonHolder = nil,
    ResizeHandle = nil,
}

local ToggleStates = {}

local function applyTheme(themeName)
    local theme = Themes[themeName]
    if not theme then warn("Theme not found:", themeName); return end
    
    CurrentTheme = theme
    
    local E = UI._Elements
    if not E.MainFrame then return end

    -- Main Frame
    E.MainFrame.BackgroundColor3 = CurrentTheme.MainBG
    E.stroke.Color = CurrentTheme.Accent
    
    -- Header
    E.TabHolder.BackgroundColor3 = CurrentTheme.HeaderBG
    E.TitleLabel.TextColor3 = CurrentTheme.TextColor
    E.textGradient.Color = ColorSequence.new{ 
        ColorSequenceKeypoint.new(0, CurrentTheme.GradientStart), 
        ColorSequenceKeypoint.new(1, CurrentTheme.GradientEnd) 
    }
    E.MinimizeBtn.BackgroundColor3 = CurrentTheme.ButtonBG
    E.MinimizeBtn.TextColor3 = CurrentTheme.TextColor
    E.CloseBtn.BackgroundColor3 = CurrentTheme.Accent
    E.CloseBtn.TextColor3 = CurrentTheme.TextColor

    -- Popup Button
    E.PopupBtn.BackgroundColor3 = CurrentTheme.Accent
    E.PopupBtn.TextColor3 = CurrentTheme.TextColor
    
    -- Resize Handle
    if E.ResizeHandle then
        E.ResizeHandle.BackgroundColor3 = CurrentTheme.AccentDark
    end

    -- Tab Buttons
    for _, obj in ipairs(E.TabButtonHolder:GetChildren()) do
        if obj:IsA("TextButton") and obj.Name:find("TabButton_") then
            obj.TextColor3 = CurrentTheme.TextColor
            local isActive = (UI._activeTab and obj.Name == "TabButton_" .. UI._activeTab)
            obj.BackgroundColor3 = isActive and CurrentTheme.ButtonBG or CurrentTheme.TabBGInactive
            
            local gradient = obj:FindFirstChildOfClass("UIGradient")
            if gradient then
                gradient.Color = ColorSequence.new{ 
                    ColorSequenceKeypoint.new(0, CurrentTheme.ButtonHover), 
                    ColorSequenceKeypoint.new(0.5, CurrentTheme.ButtonBG), 
                    ColorSequenceKeypoint.new(1, CurrentTheme.MainBG) 
                }
            end
            local strokeBtn = obj:FindFirstChildOfClass("UIStroke")
            if strokeBtn then strokeBtn.Color = CurrentTheme.StrokeDark end
        end
    end
    
    -- Content Elements
    for _, tabFrame in pairs(UI._tabFrames) do
        local columns = {tabFrame.LeftColumn, tabFrame.RightColumn}
        for _, column in ipairs(columns) do
            for _, child in ipairs(column:GetChildren()) do
                -- Section Header
                if child.Name == "SectionContainer" then
                    local titleLabel = child:FindFirstChildOfClass("TextLabel")
                    if titleLabel then titleLabel.TextColor3 = CurrentTheme.TextColor end
                    local topStroke = child:FindFirstChild("topStroke")
                    if topStroke then topStroke.BackgroundColor3 = CurrentTheme.Accent end
                end
                
                -- Toggle
                if child.Name == "ToggleContainer" then
                    local label = child:FindFirstChildOfClass("TextLabel")
                    if label then label.TextColor3 = CurrentTheme.TextColor end
                    local holder = child:FindFirstChild("ToggleHolder")
                    if holder then 
                        holder.BackgroundColor3 = CurrentTheme.ButtonBG 
                        local gradient = holder:FindFirstChildOfClass("UIGradient")
                        if gradient then
                            gradient.Color = ColorSequence.new{ 
                                ColorSequenceKeypoint.new(0, CurrentTheme.ButtonHover), 
                                ColorSequenceKeypoint.new(0.5, CurrentTheme.ButtonBG), 
                                ColorSequenceKeypoint.new(1, CurrentTheme.MainBG) 
                            }
                        end
                        local knob = holder:FindFirstChild("Knob")
                        if knob then 
                             -- Ambil status dari tabel ToggleStates yang sudah dibuat
                             local isToggled = ToggleStates[child] or false 
                             knob.BackgroundColor3 = isToggled and CurrentTheme.AccentDark or CurrentTheme.ToggleOffKnob
                             local glow = knob:FindFirstChildOfClass("UIStroke")
                             if glow then glow.Color = CurrentTheme.ToggleGlow end
                        end
                    end
                end
                
                -- Button
                if child:IsA("TextButton") and child.Name == "Button" then
                    child.TextColor3 = CurrentTheme.TextColor
                    child.BackgroundColor3 = CurrentTheme.ButtonBG
                    local gradient = child:FindFirstChildOfClass("UIGradient")
                    if gradient then
                        gradient.Color = ColorSequence.new{ 
                            ColorSequenceKeypoint.new(0, CurrentTheme.ButtonHover), 
                            ColorSequenceKeypoint.new(0.5, CurrentTheme.ButtonBG), 
                            ColorSequenceKeypoint.new(1, CurrentTheme.MainBG) 
                        }
                    end
                end
                
                -- Slider
                if child.Name == "SliderContainer" then
                    local header = child:FindFirstChild("Header")
                    if header then
                         header:FindFirstChild("Label").TextColor3 = CurrentTheme.TextColorSecondary
                         header:FindFirstChild("ValueLabel").TextColor3 = CurrentTheme.TextColorSecondary
                    end
                    local track = child:FindFirstChild("Track")
                    if track then
                        track.BackgroundColor3 = CurrentTheme.ButtonBG
                        local fill = track:FindFirstChild("Fill")
                        if fill then fill.BackgroundColor3 = CurrentTheme.Accent end
                        local knob = track:FindFirstChild("Knob")
                        if knob then knob.BackgroundColor3 = CurrentTheme.AccentDark end
                    end
                end

                -- Dropdown
                if child.Name == "DropdownContainer" then
                    local label = child:FindFirstChildOfClass("TextLabel")
                    if label then label.TextColor3 = CurrentTheme.TextColorSecondary end
                    
                    local dropdownBtn = child:FindFirstChild("DropdownButton")
                    if dropdownBtn then 
                        dropdownBtn.BackgroundColor3 = CurrentTheme.DropdownBG
                        dropdownBtn.TextColor3 = CurrentTheme.TextColorSecondary
                        local stroke = dropdownBtn:FindFirstChild("Stroke")
                        if stroke then stroke.Color = CurrentTheme.StrokeAccent end
                        local glow = dropdownBtn:FindFirstChild("Glow")
                        if glow then 
                            glow.Color = CurrentTheme.AccentDark 
                        end

                        local listFrame = dropdownBtn:FindFirstChild("ListFrame") 
                        if listFrame then
                            listFrame.BackgroundColor3 = CurrentTheme.DropdownListBG
                            local listStroke = listFrame:FindFirstChildOfClass("UIStroke")
                            if listStroke then listStroke.Color = CurrentTheme.StrokeAccent end
                            
                            local scroll = listFrame:FindFirstChildOfClass("ScrollingFrame")
                            
                            local selectedOption = child:GetAttribute("SelectedOption")
                            
                            for _,optBtn in ipairs(scroll:GetChildren()) do
                                if optBtn:IsA("TextButton") and optBtn.Name == "DropdownOption" then
                                    local isSelected = optBtn.Text == selectedOption
                                    
                                    -- Update warna Opsi
                                    optBtn.BackgroundColor3 = isSelected and CurrentTheme.DropdownOptionActive or CurrentTheme.DropdownOptionBG
                                    optBtn.TextColor3 = isSelected and CurrentTheme.TextColor or CurrentTheme.TextColorSecondary
                                    
                                    local checkMark = optBtn:FindFirstChild("CheckMark")
                                    if checkMark then 
                                        checkMark.TextColor3 = CurrentTheme.ToggleGlow
                                    end
                                end
                            end
                        end
                    end
                end

                if child.Name == "KeybindContainer" then
                    local label = child:FindFirstChildOfClass("TextLabel")
                    if label then label.TextColor3 = CurrentTheme.TextColor end
                    local keybindButton = child:FindFirstChild("KeybindButton")
                    if keybindButton then
                        keybindButton.BackgroundColor3 = CurrentTheme.DropdownBG
                        keybindButton.TextColor3 = CurrentTheme.TextColorSecondary
                        local glow = keybindButton:FindFirstChildOfClass("UIStroke")
                        if glow then glow.Color = CurrentTheme.KeybindGlow end
                    end
                end
                
            end
        end
    end
end

-- === BUILD UI & MODULES ===
local TargetGui = player:WaitForChild("PlayerGui")
local existingGui = TargetGui:FindFirstChild("YuviHub")
if existingGui then
    existingGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YuviHub"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.DisplayOrder = 9999
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = TargetGui

local function setHighZIndex(obj)
    if obj:IsA("GuiObject") then
        obj.ZIndex = 100
    end
    for _, child in ipairs(obj:GetChildren()) do
        setHighZIndex(child)
    end
end

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = CurrentTheme.MainBG
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
UI._Elements.MainFrame = MainFrame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 1
stroke.Color = CurrentTheme.Accent 
stroke.Parent = MainFrame
UI._Elements.stroke = stroke

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = MainFrame

-- HEADER / TAB HOLDER
local TabHolder = Instance.new("Frame")
TabHolder.Size = UDim2.new(1, 0, 0, 35)
TabHolder.BackgroundColor3 = CurrentTheme.HeaderBG
TabHolder.Parent = MainFrame
UI._Elements.TabHolder = TabHolder

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 15)
headerCorner.Parent = TabHolder

local LeftContainer = Instance.new("Frame")
LeftContainer.Size = UDim2.new(1, -100, 1, 0)
LeftContainer.BackgroundTransparency = 1
LeftContainer.Parent = TabHolder

local LeftLayout = Instance.new("UIListLayout", LeftContainer)
LeftLayout.FillDirection = Enum.FillDirection.Horizontal
LeftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
LeftLayout.VerticalAlignment = Enum.VerticalAlignment.Center
LeftLayout.Padding = UDim.new(0, 5)

-- Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 120, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Yuvi Hub"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
TitleLabel.TextColor3 = CurrentTheme.TextColor
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = LeftContainer
UI._Elements.TitleLabel = TitleLabel

local padding = Instance.new("UIPadding")
padding.PaddingLeft = UDim.new(0, 10)
padding.Parent = TitleLabel

local textGradient = Instance.new("UIGradient")
textGradient.Color = ColorSequence.new{ 
    ColorSequenceKeypoint.new(0, CurrentTheme.GradientStart),
    ColorSequenceKeypoint.new(1, CurrentTheme.GradientEnd)
}
textGradient.Rotation = 90
textGradient.Parent = TitleLabel
UI._Elements.textGradient = textGradient

-- Header logo
local HeaderLogo = Instance.new("ImageLabel")
HeaderLogo.Size = UDim2.new(0, 40, 0, 30)
HeaderLogo.BackgroundTransparency = 1
HeaderLogo.Image = "rbxassetid://81450116624685"
HeaderLogo.Parent = LeftContainer

local spacing = Instance.new("UIPadding")
spacing.PaddingRight = UDim.new(0, 5)
spacing.Parent = HeaderLogo

local RightContainer = Instance.new("Frame")
RightContainer.Size = UDim2.new(0, 80, 1, 0)
RightContainer.AnchorPoint = Vector2.new(1, 0)
RightContainer.Position = UDim2.new(1, 0, 0, 0)
RightContainer.BackgroundTransparency = 1
RightContainer.Parent = TabHolder

local RightLayout = Instance.new("UIListLayout", RightContainer)
RightLayout.FillDirection = Enum.FillDirection.Horizontal
RightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
RightLayout.VerticalAlignment = Enum.VerticalAlignment.Center
RightLayout.Padding = UDim.new(0, 2)

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 35, 1, 0)
MinimizeBtn.Text = "-"
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 18
MinimizeBtn.TextColor3 = CurrentTheme.TextColor
MinimizeBtn.BackgroundColor3 = CurrentTheme.ButtonBG
MinimizeBtn.Parent = RightContainer
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 13)
UI._Elements.MinimizeBtn = MinimizeBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 1, 0)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.TextColor3 = CurrentTheme.TextColor
CloseBtn.BackgroundColor3 = CurrentTheme.Accent
CloseBtn.Parent = RightContainer
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 13)
UI._Elements.CloseBtn = CloseBtn

UI._Elements.ResizeHandle = makeResizable(MainFrame)
makeDraggable(MainFrame, TabHolder)

-- CONTENT FRAME
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -70)
ContentFrame.Position = UDim2.new(0, 0, 0, 70)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local PopupBtn = Instance.new("TextButton")
PopupBtn.Size = UDim2.new(0, 100, 0, 30)
PopupBtn.Position = UDim2.new(0, 20, 1, -50)
PopupBtn.Text = "Yuvi Hub"
PopupBtn.Font = Enum.Font.GothamBold
PopupBtn.TextSize = 14
PopupBtn.TextColor3 = CurrentTheme.TextColor
PopupBtn.BackgroundColor3 = CurrentTheme.Accent
PopupBtn.Visible = false
PopupBtn.Parent = ScreenGui
Instance.new("UICorner", PopupBtn).CornerRadius = UDim.new(0, 6)
makeDraggable(PopupBtn)
UI._Elements.PopupBtn = PopupBtn

-- MINIMIZE / CLOSE
local minimized = false
local function toggleGUI()
    minimized = not minimized
    MainFrame.Visible = not minimized
    PopupBtn.Visible = minimized
end
MinimizeBtn.MouseButton1Click:Connect(toggleGUI)
PopupBtn.MouseButton1Click:Connect(toggleGUI)
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- TAB BUTTON HOLDER
local TabButtonHolder = Instance.new("Frame")
TabButtonHolder.Size = UDim2.new(1, -10, 0, 35)
TabButtonHolder.Position = UDim2.new(0, 5, 0, 35)
TabButtonHolder.BackgroundTransparency = 1
TabButtonHolder.Parent = MainFrame
UI._Elements.TabButtonHolder = TabButtonHolder

local TabLayout = Instance.new("UIListLayout", TabButtonHolder)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabLayout.Padding = UDim.new(0, 5)

function UI:createTab(name)
    if UI._tabs[name] then
        warn("Tab with name '" .. name .. "' already exists.")
        return UI._tabs[name]
    end

    local TabButton = Instance.new("TextButton")
    TabButton.Name = "TabButton_" .. name
    TabButton.Size = UDim2.new(0, 100, 1, 0)
    TabButton.Text = name
    TabButton.TextSize = 14
    TabButton.Font = Enum.Font.GothamBold
    TabButton.TextColor3 = CurrentTheme.TextColor
    TabButton.BackgroundColor3 = CurrentTheme.TabBGInactive
    TabButton.Parent = TabButtonHolder

    local cornerBtn = Instance.new("UICorner", TabButton)
    cornerBtn.CornerRadius = UDim.new(0, 13)

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{ 
        ColorSequenceKeypoint.new(0, CurrentTheme.ButtonHover), 
        ColorSequenceKeypoint.new(0.5, CurrentTheme.ButtonBG), 
        ColorSequenceKeypoint.new(1, CurrentTheme.MainBG) 
    }
    gradient.Rotation = 90
    gradient.Parent = TabButton

    local strokeBtn = Instance.new("UIStroke")
    strokeBtn.Thickness = 1.5
    strokeBtn.Color = CurrentTheme.StrokeDark
    strokeBtn.Transparency = 0.3
    strokeBtn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    strokeBtn.Parent = TabButton

    local scale = TabButton:FindFirstChild("ClickScale") or Instance.new("UIScale", TabButton)
    scale.Name = "ClickScale"
    scale.Scale = 1

    -- === TAB FRAME ===
    local TabFrame = Instance.new("Frame")
    TabFrame.Name = "TabFrame_" .. name
    TabFrame.Size = UDim2.new(1, -10, 1, -10)
    TabFrame.Position = UDim2.new(0, 5, 0, 5)
    TabFrame.BackgroundTransparency = 1
    TabFrame.Parent = ContentFrame
    TabFrame.Visible = false

    local LeftColumn = Instance.new("ScrollingFrame")
    LeftColumn.Name = "LeftColumn"
    LeftColumn.Size = UDim2.new(0.5, -7, 1, 0)
    LeftColumn.Position = UDim2.new(0, 0, 0, 0)
    LeftColumn.AutomaticCanvasSize = Enum.AutomaticSize.Y
    LeftColumn.ScrollBarThickness = 6
    LeftColumn.ScrollingDirection = Enum.ScrollingDirection.Y
    LeftColumn.BackgroundTransparency = 1
    LeftColumn.Parent = TabFrame
    
    local LeftLayout = Instance.new("UIListLayout", LeftColumn)
    LeftLayout.FillDirection = Enum.FillDirection.Vertical
    LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
    LeftLayout.Padding = UDim.new(0, 6)
    
    local LeftPadding = Instance.new("UIPadding", LeftColumn)
    LeftPadding.PaddingLeft = UDim.new(0, 5)
    LeftPadding.PaddingRight = UDim.new(0, 5)
    LeftPadding.PaddingTop = UDim.new(0, 5)
    LeftPadding.PaddingBottom = UDim.new(0, 5)

    local RightColumn = Instance.new("ScrollingFrame")
    RightColumn.Name = "RightColumn"
    RightColumn.Size = UDim2.new(0.5, -7, 1, 0)
    RightColumn.Position = UDim2.new(0.5, 7, 0, 0)
    RightColumn.AutomaticCanvasSize = Enum.AutomaticSize.Y
    RightColumn.ScrollBarThickness = 6
    RightColumn.ScrollingDirection = Enum.ScrollingDirection.Y
    RightColumn.BackgroundTransparency = 1
    RightColumn.Parent = TabFrame
    
    local RightLayout = Instance.new("UIListLayout", RightColumn)
    RightLayout.FillDirection = Enum.FillDirection.Vertical
    RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
    RightLayout.Padding = UDim.new(0, 6)
    
    local RightPadding = Instance.new("UIPadding", RightColumn)
    RightPadding.PaddingLeft = UDim.new(0, 5)
    RightPadding.PaddingRight = UDim.new(0, 5)
    RightPadding.PaddingTop = UDim.new(0, 5)
    RightPadding.PaddingBottom = UDim.new(0, 5)

    TabButton.MouseButton1Click:Connect(function()
        for _, frame in pairs(UI._tabFrames) do
            frame.Visible = false
        end
        TabFrame.Visible = true
        UI._activeTab = name

        for _, obj in ipairs(TabButtonHolder:GetChildren()) do
            if obj:IsA("TextButton") and obj.Name:find("TabButton_") then
                obj.BackgroundColor3 = CurrentTheme.TabBGInactive
            end
        end
        TabButton.BackgroundColor3 = CurrentTheme.ButtonBG 
        
        local shrink = TweenService:Create(scale, TweenInfo.new(0.08), {Scale = 0.92})
        local restore = TweenService:Create(scale, TweenInfo.new(0.08), {Scale = 1})
        shrink:Play()
        shrink.Completed:Connect(function() restore:Play() end)
    end)

    local TabAPI = {}
    TabAPI._frame = TabFrame
    TabAPI._name = name
    
    if not UI._activeTab then
    UI._activeTab = name
    TabFrame.Visible = true
    TabButton.BackgroundColor3 = CurrentTheme.ButtonBG
end

    local function getParent(self, column)
        column = column or 1
        return (column == 1 and LeftColumn or RightColumn)
    end

    -- createSection
    function TabAPI:createSection(config)
        local title = config.Name or "Section"
        local column = config.Column or 1
        
        local parent = getParent(self, column)
        local container = Instance.new("Frame")
        container.Name = "SectionContainer"
        container.Size = UDim2.new(1, 0, 0, 30)
        container.BackgroundTransparency = 1
        container.Parent = parent

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, 0, 1, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 16
        titleLabel.TextColor3 = CurrentTheme.TextColor
        titleLabel.Text = title
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = container

        local padding = Instance.new("UIPadding")
        padding.PaddingLeft = UDim.new(0, 5)
        padding.Parent = titleLabel

        local topStroke = Instance.new("Frame")
        topStroke.Name = "topStroke"
        topStroke.Size = UDim2.new(1, 0, 0, 1)
        topStroke.Position = UDim2.new(0, 0, 0, 0)
        topStroke.BackgroundColor3 = CurrentTheme.Accent 
        topStroke.BorderSizePixel = 0
        topStroke.Parent = container

        return container
    end

    -- createToggle
function TabAPI:createToggle(config)
    local labelText = config.Name or "Toggle"
    local defaultState = config.CurrentValue or false
    local callback = config.Callback or function() end
    local column = config.Column or 1
    local flag = config.Flag or labelText
    
    local parent = getParent(self, column)
    local container = Instance.new("Frame")
    container.Name = "ToggleContainer"
    container.Size = UDim2.new(1, 0, 0, 50)
    container.BackgroundTransparency = 1
    container.Parent = parent

    local vLayout = Instance.new("UIListLayout", container)
    vLayout.FillDirection = Enum.FillDirection.Vertical
    vLayout.Padding = UDim.new(0, 5) 
    vLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    vLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    vLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 15)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextColor3 = CurrentTheme.TextColorSecondary
    label.Text = labelText
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = 1
    label.Parent = container

    local holder = Instance.new("Frame")
    holder.Name = "ToggleHolder"
    holder.Size = UDim2.new(0, 80, 0, 30)
    holder.BackgroundColor3 = CurrentTheme.ButtonBG
    holder.BorderSizePixel = 0
    holder.LayoutOrder = 2
    holder.Parent = container
    Instance.new("UICorner", holder).CornerRadius = UDim.new(0, 12)

    local g = Instance.new("UIGradient", holder)
    g.Color = ColorSequence.new{ 
        ColorSequenceKeypoint.new(0, CurrentTheme.ButtonHover), 
        ColorSequenceKeypoint.new(0.5, CurrentTheme.ButtonBG), 
        ColorSequenceKeypoint.new(1, CurrentTheme.MainBG) 
    }
    g.Rotation = 90

    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 15, 0, 15)
    knob.Position = UDim2.new(0, 5, 0.5, -7.5)
    knob.BackgroundColor3 = CurrentTheme.ToggleOffKnob
    knob.BorderSizePixel = 0
    knob.Parent = holder
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local glow = Instance.new("UIStroke")
    glow.Thickness = 2
    glow.Color = CurrentTheme.ToggleGlow
    glow.Transparency = 1
    glow.Parent = knob

    local state = defaultState or false
    ToggleStates[container] = state
    
    local function updateVisual()
        if state then
            TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 60, 0.5, -7.5), BackgroundColor3 = CurrentTheme.AccentDark}):Play()
            glow.Transparency = 0
            label.TextColor3 = CurrentTheme.TextColor
        else
            TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 5, 0.5, -7.5), BackgroundColor3 = CurrentTheme.ToggleOffKnob}):Play()
            glow.Transparency = 1
            label.TextColor3 = CurrentTheme.TextColorSecondary
        end
    end
    updateVisual()

    holder.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            state = not state
            ToggleStates[container] = state
            updateVisual()
            if callback then
                local ok,err = pcall(function() callback(state) end)
                if not ok then warn("Toggle callback error:", err) end
            end
        end
    end)

 local api = {}
    api.Frame = container
    api.Flag = flag

    function api:Set(v)
        state = v
        ToggleStates[container] = v
        updateVisual()
        callback(v)
    end

    function api:Get()
        return state
    end

    return api
end

    -- createButton
    function TabAPI:createButton(config)
        local buttonText = config.Name or "Button"
        local callback = config.Callback or function() end
        local column = config.Column or 1
        
        local parent = getParent(self, column)
        local button = Instance.new("TextButton")
        button.Name = "Button"
        button.Size = UDim2.new(0, 270, 0, 35)
        button.BackgroundColor3 = CurrentTheme.ButtonBG
        button.BackgroundTransparency = 0
        button.BorderSizePixel = 0
        button.Text = buttonText
        button.Font = Enum.Font.GothamBold
        button.TextSize = 14
        button.TextColor3 = CurrentTheme.TextColor
        button.AutoButtonColor = false
        button.Parent = parent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = button

        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new{ 
            ColorSequenceKeypoint.new(0, CurrentTheme.ButtonHover), 
            ColorSequenceKeypoint.new(0.5, CurrentTheme.ButtonBG), 
            ColorSequenceKeypoint.new(1, CurrentTheme.MainBG) 
        }
        gradient.Rotation = 90
        gradient.Parent = button

        local scale = Instance.new("UIScale")
        scale.Scale = 1
        scale.Parent = button

        local function animateButton(targetScale, targetColor)
            TweenService:Create(
                scale, 
                TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
                {Scale = targetScale}
            ):Play()
            TweenService:Create(
                button, 
                TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
                {BackgroundColor3 = targetColor}
            ):Play()
        end

        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = CurrentTheme.ButtonHover}):Play()
        end)
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = CurrentTheme.ButtonBG}):Play()
        end)

        button.MouseButton1Click:Connect(function()
            local shrink = TweenService:Create( 
                scale, 
                TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
                {Scale = 0.92} 
            )
            local restore = TweenService:Create( 
                scale, 
                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
                {Scale = 1.05} 
            )
            shrink:Play()
            shrink.Completed:Connect(function() restore:Play() end)

            if callback then task.spawn(callback) end
        end)

        return button
    end

    -- createSlider
    function TabAPI:createSlider(config)
        local name = config.Name or "Slider"
        local minValue = config.Min or 0
        local maxValue = config.Max or 100
        local default = config.Default or minValue
        local callback = config.Callback or function() end
        local column = config.Column or 1
        
        local parent = getParent(self, column)
        local container = Instance.new("Frame")
        container.Name = "SliderContainer" 
        container.Size = UDim2.new(1 , 0, 0, 60)
        container.BackgroundTransparency = 1
        container.Parent = parent

        local header = Instance.new("Frame")
        header.Name = "Header"
        header.Size = UDim2.new(1, 0, 0, 20)
        header.BackgroundTransparency = 1
        header.Parent = container

        local label = Instance.new("TextLabel")
        label.Name = "Label"
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.TextSize = 14
        label.TextColor3 = CurrentTheme.TextColorSecondary
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Text = name
        label.Parent = header

        local valueLabel = Instance.new("TextLabel")
        valueLabel.Name = "ValueLabel"
        valueLabel.Size = UDim2.new(0.3, 0, 1, 0)
        valueLabel.Position = UDim2.new(0.7, 0, 0, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Font = Enum.Font.GothamBold
        valueLabel.TextSize = 14
        valueLabel.TextColor3 = CurrentTheme.TextColorSecondary
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right
        valueLabel.Text = tostring(default or min)
        valueLabel.Parent = header

        local track = Instance.new("Frame")
        track.Name = "Track"
        track.Size = UDim2.new(1, -10, 0, 9)
        track.Position = UDim2.new(0.5, 0, 0, 30)
        track.AnchorPoint = Vector2.new(0.5, 0)
        track.BackgroundColor3 = CurrentTheme.ButtonBG
        track.BorderSizePixel = 0
        track.Parent = container
        Instance.new("UICorner", track).CornerRadius = UDim.new(0, 4)

        local fill = Instance.new("Frame")
        fill.Name = "Fill"
        fill.Size = UDim2.new(0, 0, 1, 0)
        fill.BackgroundColor3 = CurrentTheme.Accent
        fill.BorderSizePixel = 0
        fill.Parent = track
        Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 4)

        local knob = Instance.new("Frame")
        knob.Name = "Knob"
        knob.Size = UDim2.new(0, 14, 0, 14)
        knob.Position = UDim2.new(0, -7, 0.5, -7)
        knob.BackgroundColor3 = CurrentTheme.AccentDark
        knob.BorderSizePixel = 0
        knob.Parent = track
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

        local value = default
        local dragging = false
        
local function updateVisual()
    local percent = (value - minValue) / (maxValue - minValue)
    fill.Size = UDim2.new(percent, 0, 1, 0)
    knob.Position = UDim2.new(percent, -7, 0.5, -7)
    valueLabel.Text = tostring(math.floor(value))
end

local function onInputChanged(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local relative = (input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X
        relative = math.clamp(relative, 0, 1)

        local newValue = minValue + (maxValue - minValue) * relative
        value = newValue
        updateVisual()
        if callback then
            local ok, err = pcall(function()
                callback(value)
            end)
            if not ok then
                warn("Slider callback error:", err)
            end
        end
    end
end

        track.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                onInputChanged(input)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)

        UserInputService.InputChanged:Connect(onInputChanged)

        return {
            Frame = container,
            Get = function() return value end,
            Set = function(v)
                value = math.clamp(v, minValue, maxValue)
                updateVisual()
                if callback then pcall(callback, value) end
            end
        }
    end

    -- createDropdown
function TabAPI:createDropdown(config)
    local labelText = config.Name or "Dropdown"
    local options = config.Options or {}
    local default = config.CurrentOption or options[1]
    local callback = config.Callback or function() end
    local column = config.Column or 1 
    
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")

    local parent = getParent(self, column)

    local container = Instance.new("Frame")
    container.Name = "DropdownContainer"
    container.Size = UDim2.new(1, 0, 0, 70)
    container.BackgroundTransparency = 1
    container.Parent = parent
    container.ClipsDescendants = false

    local vLayout = Instance.new("UIListLayout")
    vLayout.FillDirection = Enum.FillDirection.Vertical
    vLayout.SortOrder = Enum.SortOrder.LayoutOrder
    vLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    vLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    vLayout.Padding = UDim.new(0, 5)
    vLayout.Parent = container

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextColor3 = CurrentTheme.TextColorSecondary
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = labelText
    label.LayoutOrder = 1
    label.Parent = container

    local dropdownBtn = Instance.new("TextButton")
    dropdownBtn.Name = "DropdownButton"
    dropdownBtn.Size = UDim2.new(0.99, -10, 0, 35)
    dropdownBtn.Position = UDim2.new(0, 5, 0, 0)
    dropdownBtn.BackgroundColor3 = CurrentTheme.DropdownBG
    dropdownBtn.Text = default or "Select"
    dropdownBtn.Font = Enum.Font.GothamBold
    dropdownBtn.TextSize = 14
    dropdownBtn.TextColor3 = CurrentTheme.TextColorSecondary
    dropdownBtn.AutoButtonColor = false
    dropdownBtn.LayoutOrder = 2
    dropdownBtn.Parent = container

    Instance.new("UICorner", dropdownBtn).CornerRadius = UDim.new(0, 6)

    local strokeBtn = Instance.new("UIStroke")
    strokeBtn.Name = "Stroke"
    strokeBtn.Thickness = 1
    strokeBtn.Color = CurrentTheme.StrokeAccent
    strokeBtn.Parent = dropdownBtn

    local glowBtn = Instance.new("UIStroke")
    glowBtn.Name = "Glow"
    glowBtn.Thickness = 2
    glowBtn.Color = CurrentTheme.AccentDark
    glowBtn.Transparency = 1
    glowBtn.Parent = dropdownBtn

    local LIST_FRAME_WIDTH = 265
    local listFrame = Instance.new("Frame")
    listFrame.Name = "ListFrame"
    listFrame.Size = UDim2.new(0, LIST_FRAME_WIDTH, 0, 0)
    listFrame.Position = UDim2.new(0, 0, 1, 5)
    listFrame.BackgroundColor3 = CurrentTheme.DropdownListBG
    listFrame.BorderSizePixel = 0
    listFrame.ClipsDescendants = true
    listFrame.Visible = false
    listFrame.ZIndex = 10
    listFrame.Parent = dropdownBtn
    Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 6)

    local listStroke = Instance.new("UIStroke")
    listStroke.Name = "ListStroke"
    listStroke.Thickness = 1.5
    listStroke.Color = CurrentTheme.StrokeAccent
    listStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    listStroke.Parent = listFrame

    local scroll = Instance.new("ScrollingFrame")
    scroll.Name = "Scroll"
    scroll.Size = UDim2.new(1, -6, 1, -6)
    scroll.Position = UDim2.new(0, 3, 0, 3)
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.ScrollBarThickness = 4
    scroll.BackgroundTransparency = 1
    scroll.ZIndex = 11
    scroll.Parent = listFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 2)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = scroll

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
    end)

    local listOpen = false
    local LIST_FRAME_OPEN_HEIGHT = 160

    local function updateOptionVisuals(optBtn)
        local optText = optBtn.Text
        local isSelected = container:GetAttribute("SelectedOption") == optText
        optBtn.BackgroundColor3 = isSelected and CurrentTheme.DropdownOptionActive or CurrentTheme.DropdownOptionBG
        optBtn.TextColor3 = isSelected and CurrentTheme.TextColor or CurrentTheme.TextColorSecondary
        local check = optBtn:FindFirstChild("CheckMark")
        if check then
            check.Text = isSelected and "✔" or ""
            check.TextColor3 = CurrentTheme.ToggleGlow
        end
    end

    local function toggleList(show)
        if show then
            listFrame.Visible = true
            TweenService:Create(listFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad),
                {Size = UDim2.new(0, LIST_FRAME_WIDTH, 0, LIST_FRAME_OPEN_HEIGHT)}):Play()
        else
            TweenService:Create(listFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                {Size = UDim2.new(0, LIST_FRAME_WIDTH, 0, 0)}):Play()
            task.delay(0.2, function()
                listFrame.Visible = false
            end)
        end
    end

    dropdownBtn.MouseButton1Click:Connect(function()
        listOpen = not listOpen
        toggleList(listOpen)
        glowBtn.Transparency = listOpen and 0 or 1
    end)

    local selected = default or options[1] or ""
    container:SetAttribute("SelectedOption", selected)
    dropdownBtn.Text = selected

    for _, opt in ipairs(options) do
        local optBtn = Instance.new("TextButton")
        optBtn.Size = UDim2.new(1, 0, 0, 30)
        optBtn.BackgroundColor3 = CurrentTheme.DropdownOptionBG 
        optBtn.Font = Enum.Font.GothamBold
        optBtn.TextSize = 14
        optBtn.Text = opt
        optBtn.AutoButtonColor = false
        optBtn.ZIndex = 12
        optBtn.Parent = scroll
        optBtn.Name = "DropdownOption"

        Instance.new("UICorner", optBtn).CornerRadius = UDim.new(0, 4)

        local checkMark = Instance.new("TextLabel")
        checkMark.Name = "CheckMark"
        checkMark.Size = UDim2.new(0, 20, 1, 0)
        checkMark.Position = UDim2.new(1, -25, 0, 0)
        checkMark.BackgroundTransparency = 1
        checkMark.Font = Enum.Font.GothamBold
        checkMark.TextSize = 16
        checkMark.ZIndex = 13
        checkMark.Text = ""
        checkMark.Parent = optBtn

        updateOptionVisuals(optBtn)

        optBtn.MouseEnter:Connect(function()
            TweenService:Create(optBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                BackgroundColor3 = CurrentTheme.ButtonHover,
                TextColor3 = CurrentTheme.TextColor
            }):Play()
        end)

        optBtn.MouseLeave:Connect(function()
            updateOptionVisuals(optBtn)
        end)

        optBtn.MouseButton1Click:Connect(function()
            container:SetAttribute("SelectedOption", opt)
            dropdownBtn.Text = opt
            for _,v in pairs(scroll:GetChildren()) do
                if v:IsA("TextButton") then
                    updateOptionVisuals(v)
                end
            end
            toggleList(false)
            listOpen = false
            glowBtn.Transparency = 1
            if callback then pcall(callback, opt) end
        end)
    end

    UserInputService.InputBegan:Connect(function(input)
        if listOpen and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mouse = game.Players.LocalPlayer:GetMouse()
            local inList = (
                mouse.X >= listFrame.AbsolutePosition.X and
                mouse.X <= listFrame.AbsolutePosition.X + listFrame.AbsoluteSize.X and
                mouse.Y >= listFrame.AbsolutePosition.Y and
                mouse.Y <= listFrame.AbsolutePosition.Y + listFrame.AbsoluteSize.Y
            )
            local inBtn = (
                mouse.X >= dropdownBtn.AbsolutePosition.X and
                mouse.X <= dropdownBtn.AbsolutePosition.X + dropdownBtn.AbsoluteSize.X and
                mouse.Y >= dropdownBtn.AbsolutePosition.Y and
                mouse.Y <= dropdownBtn.AbsolutePosition.Y + dropdownBtn.AbsoluteSize.Y
            )
            if not inList and not inBtn then
                toggleList(false)
                listOpen = false
                glowBtn.Transparency = 1
            end
        end
    end)

    return {
        Frame = container,
        Get = function()
            return container:GetAttribute("SelectedOption")
        end,
        Set = function(value)
            container:SetAttribute("SelectedOption", value)
            dropdownBtn.Text = value or "Select"
            for _,v in pairs(scroll:GetChildren()) do
                if v:IsA("TextButton") then
                    updateOptionVisuals(v)
                end
            end
            if callback then pcall(callback, value) end
        end
    }
end

-- createTextbox
function TabAPI:createTextbox(config)
    local placeholder = config.Placeholder or "Enter text..."
    local defaultText = config.Default or ""
    local callback = config.Callback or function() end
    local column = config.Column
    local parent = getParent(self, column)

    --== Container ==--
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 200, 0, 30) -- fixed width: 200px
    container.BackgroundTransparency = 1
    container.Parent = parent

    --== Textbox ==--
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, 0, 1, 0)
    box.Position = UDim2.new(0, 0, 0, 0)
    box.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- pure black
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.PlaceholderText = placeholder
    box.PlaceholderColor3 = Color3.fromRGB(130, 130, 130)
    box.Text = defaultText
    box.TextSize = 14
    box.Font = Enum.Font.Gotham
    box.ClearTextOnFocus = false
    box.ClipsDescendants = true
    box.Parent = container

    --== Corner ==--
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = box

    --== Behavior ==--
    box.FocusLost:Connect(function(enterPressed)
        callback(box.Text)
    end)

    --== Return API ==--
    local api = {}
    function api:SetText(text)
        box.Text = text
    end
    function api:GetText()
        return box.Text
    end
    return api
end

-- createLabel
function TabAPI:createLabel(config)
    local text = config.Text or "Label"
    local textSize = config.TextSize or 14
    local textColor = config.TextColor or Color3.fromRGB(255, 255, 255)
    local bgEnabled = config.Background or false
    local bgColor = config.BackgroundColor or Color3.fromRGB(20, 20, 20)
    local column = config.Column
    local parent = getParent(self, column)

    --== Container ==--
    local container = Instance.new("Frame")
    container.BackgroundTransparency = bgEnabled and 0 or 1
    container.BackgroundColor3 = bgEnabled and bgColor or Color3.new(0, 0, 0)
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.Parent = parent

    --== Optional rounded corner ==--
    if bgEnabled then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = container

        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 6)
        padding.PaddingBottom = UDim.new(0, 6)
        padding.PaddingLeft = UDim.new(0, 8)
        padding.PaddingRight = UDim.new(0, 8)
        padding.Parent = container
    end

    --== Text ==--
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, -10, 0, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.Font = Enum.Font.Gotham
    label.TextColor3 = textColor
    label.TextSize = textSize
    label.TextWrapped = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.Text = text
    label.AutomaticSize = Enum.AutomaticSize.Y
    label.Parent = container

    --== Return API ==--
    local api = {}
    function api:SetText(newText)
        label.Text = newText
    end
    function api:GetText()
        return label.Text
    end
    function api:SetColor(color)
        label.TextColor3 = color
    end
    function api:SetBackground(enable, color)
        if enable then
            container.BackgroundTransparency = 0
            container.BackgroundColor3 = color or bgColor
        else
            container.BackgroundTransparency = 1
        end
    end
    return api
end

-- createline
function TabAPI:createLine(config)
    local orientation = config.Orientation or "Horizontal" -- "Horizontal" or "Vertical"
    local color = config.Color or Color3.fromRGB(100, 100, 100)
    local thickness = config.Thickness or 1
    local length = config.Length or 1 -- kalau Horizontal: 1 = full width, kalau Vertical: tinggi relatif
    local column = config.Column
    local parent = getParent(self, column)

    --== Container ==--
    local container = Instance.new("Frame")
    container.BackgroundTransparency = 1
    container.Size = UDim2.new(1, 0, 0, 10)
    container.Parent = parent

    --== Line ==--
    local line = Instance.new("Frame")
    line.BackgroundColor3 = color
    line.BorderSizePixel = 0
    line.Parent = container

    if orientation:lower() == "horizontal" then
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.Position = UDim2.new(0.5, 0, 0.5, 0)
        line.Size = UDim2.new(length, 0, 0, thickness)
    else
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.Position = UDim2.new(0.5, 0, 0.5, 0)
        line.Size = UDim2.new(0, thickness, length, 0)
    end

    --== Rounded edges (optional aesthetic) ==--
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, thickness / 2)
    corner.Parent = line

    --== Return API ==--
    local api = {}
    function api:SetColor(newColor)
        line.BackgroundColor3 = newColor
    end
    function api:SetThickness(newThickness)
        if orientation:lower() == "horizontal" then
            line.Size = UDim2.new(length, 0, 0, newThickness)
        else
            line.Size = UDim2.new(0, newThickness, length, 0)
        end
    end
    return api
end

--createcolorpicker
function TabAPI:createColorPicker(config)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Mouse = Players.LocalPlayer:GetMouse()

    local text = config.Name or "Color Picker"
    local preset = config.Default or Color3.fromRGB(255, 0, 0)
    local callback = config.Callback or function() end
    local column = config.Column

    local ColorPickerToggled = false
    local OldToggleColor = preset
    local OldColor = preset
    local OldColorSelectionPosition
    local OldHueSelectionPosition
    local ColorH, ColorS, ColorV = Color3.toHSV(preset)
    local RainbowColorPicker = false
    local ColorInput, HueInput

    local parent = getParent(self, column) or self.Container or self.Holder
    assert(parent, "[ColorPicker] parent (column) is nil!")

    local FRAME_HEIGHT_COLLAPSED = 30
    local FRAME_HEIGHT_EXPANDED = 175
    local COLOR_AREA_HEIGHT = 80

    local Frame = Instance.new("Frame")
    Frame.Name = "Colorpicker"
    Frame.Size = UDim2.new(1, 0, 0, FRAME_HEIGHT_COLLAPSED)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.ClipsDescendants = true
    Frame.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Frame

    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, FRAME_HEIGHT_COLLAPSED)
    Header.BackgroundTransparency = 1
    Header.Parent = Frame

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextTransparency = 0.3
    Title.Font = Enum.Font.Gotham
    Title.TextSize = 15
    Title.Size = UDim2.new(0.6, 0, 1, 0)
    Title.Position = UDim2.new(0.05, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextYAlignment = Enum.TextYAlignment.Center
    Title.Parent = Header

    local ColorpickerBtn = Instance.new("TextButton")
    ColorpickerBtn.Name = "ColorpickerBtn"
    ColorpickerBtn.Size = UDim2.new(1, 0, 1, 0)
    ColorpickerBtn.BackgroundTransparency = 1
    ColorpickerBtn.Text = ""
    ColorpickerBtn.Parent = Header

    local BoxColor = Instance.new("Frame")
    BoxColor.Name = "BoxColor"
    BoxColor.Size = UDim2.new(0, 30, 0, 18)
    BoxColor.AnchorPoint = Vector2.new(1, 0.5)
    BoxColor.Position = UDim2.new(1, -5, 0.5, 0)
    BoxColor.BackgroundColor3 = preset
    BoxColor.Parent = Header

    local BoxColorCorner = Instance.new("UICorner")
    BoxColorCorner.CornerRadius = UDim.new(0, 4)
    BoxColorCorner.Parent = BoxColor

    local Color = Instance.new("ImageLabel")
    Color.Name = "Color"
    Color.Size = UDim2.new(0.8, -10, 0, COLOR_AREA_HEIGHT)
    Color.Position = UDim2.new(0.05, 0, 0, 46)
    Color.Image = "rbxassetid://4155801252"
    Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
    Color.Parent = Frame
    local ColorCorner = Instance.new("UICorner")
    ColorCorner.CornerRadius = UDim.new(0, 3)
    ColorCorner.Parent = Color

    local ColorSelection = Instance.new("ImageLabel")
    ColorSelection.Name = "ColorSelection"
    ColorSelection.Size = UDim2.new(0, 18, 0, 18)
    ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
    ColorSelection.BackgroundTransparency = 1
    ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
    ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
    ColorSelection.Visible = false
    ColorSelection.Parent = Color

    local Hue = Instance.new("ImageLabel")
    Hue.Name = "Hue"
    Hue.Size = UDim2.new(0.15, -10, 0, COLOR_AREA_HEIGHT)
    Hue.AnchorPoint = Vector2.new(1, 0)
    Hue.Position = UDim2.new(0.95, 0, 0, 46)
    Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hue.Parent = Frame
    local HueCorner = Instance.new("UICorner")
    HueCorner.CornerRadius = UDim.new(0, 3)
    HueCorner.Parent = Hue

    local HueGradient = Instance.new("UIGradient")
    HueGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,4)),
        ColorSequenceKeypoint.new(0.2, Color3.fromRGB(234,255,0)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(21,255,0)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0,255,255)),
        ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0,17,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,251))
    }
    HueGradient.Rotation = 270
    HueGradient.Parent = Hue

    local HueSelection = Instance.new("ImageLabel")
    HueSelection.Name = "HueSelection"
    HueSelection.Size = UDim2.new(0, 18, 0, 18)
    HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
    HueSelection.BackgroundTransparency = 1
    HueSelection.Position = UDim2.new(0.48, 0, ColorH, 0)
    HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
    HueSelection.Visible = false
    HueSelection.Parent = Hue

    -- Rainbow Toggle
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = "RainbowToggleFrame"
    ToggleFrame.Size = UDim2.new(0.9, 0, 0, 22)
    ToggleFrame.Position = UDim2.new(0.05, 0, 0, 46 + COLOR_AREA_HEIGHT + 10)
    ToggleFrame.BackgroundTransparency = 1
    ToggleFrame.Parent = Frame

    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Text = "Rainbow"
    ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.TextSize = 14
    ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleLabel.TextTransparency = 0.3
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    ToggleLabel.Parent = ToggleFrame

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0.3, 0, 1, 0)
    ToggleButton.Position = UDim2.new(0.7, 0, 0, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    ToggleButton.Text = ""
    ToggleButton.AutoButtonColor = false
    ToggleButton.Parent = ToggleFrame

    local ToggleButtonCorner = Instance.new("UICorner")
    ToggleButtonCorner.CornerRadius = UDim.new(1, 0)
    ToggleButtonCorner.Parent = ToggleButton

    local ToggleCircle = Instance.new("Frame")
    ToggleCircle.Size = UDim2.new(0, 18, 0, 18)
    ToggleCircle.Position = UDim2.new(0, 2, 0.5, -9)
    ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleCircle.Parent = ToggleButton

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = ToggleCircle

    local function UpdateToggleState(animated)
        if RainbowColorPicker then
            TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {Position = UDim2.new(1, -20, 0.5, -9)}):Play()
            ToggleLabel.TextTransparency = 0
        else
            TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -9)}):Play()
            ToggleLabel.TextTransparency = 0.4
        end
    end

    ToggleButton.MouseButton1Click:Connect(function()
        RainbowColorPicker = not RainbowColorPicker
        UpdateToggleState(true)
        if RainbowColorPicker then
            task.spawn(function()
                while RainbowColorPicker do
                    local hue = tick() % 5 / 5
                    local newColor = Color3.fromHSV(hue, 1, 1)
                    BoxColor.BackgroundColor3 = newColor
                    pcall(callback, newColor)
                    RunService.RenderStepped:Wait()
                end
            end)
        end
    end)

    ColorpickerBtn.MouseButton1Click:Connect(function()
        ColorPickerToggled = not ColorPickerToggled
        ColorSelection.Visible = ColorPickerToggled
        HueSelection.Visible = ColorPickerToggled
        Frame:TweenSize(
            UDim2.new(1, 0, 0, ColorPickerToggled and FRAME_HEIGHT_EXPANDED or FRAME_HEIGHT_COLLAPSED),
            "Out", "Quart", 0.25, true
        )
    end)

    -- drag color/hue
    local draggingColor, draggingHue = false, false
    local function UpdateColorFromInput(x, y)
        local rx = math.clamp((x - Color.AbsolutePosition.X) / Color.AbsoluteSize.X, 0, 1)
        local ry = math.clamp((y - Color.AbsolutePosition.Y) / Color.AbsoluteSize.Y, 0, 1)
        ColorS, ColorV = rx, 1 - ry
        local newColor = Color3.fromHSV(ColorH, ColorS, ColorV)
        BoxColor.BackgroundColor3 = newColor
        ColorSelection.Position = UDim2.new(rx, 0, 1 - ColorV, 0)
        pcall(callback, newColor)
    end

    local function UpdateHueFromInput(y)
        local ry = math.clamp((y - Hue.AbsolutePosition.Y) / Hue.AbsoluteSize.Y, 0, 1)
        ColorH = ry
        HueSelection.Position = UDim2.new(0.48, 0, ry, 0)
        local newColor = Color3.fromHSV(ColorH, ColorS, ColorV)
        Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
        BoxColor.BackgroundColor3 = newColor
        pcall(callback, newColor)
    end

    Color.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingColor = true
            UpdateColorFromInput(i.Position.X, i.Position.Y)
        end
    end)
    Hue.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingHue = true
            UpdateHueFromInput(i.Position.Y)
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if draggingColor then
            UpdateColorFromInput(i.Position.X, i.Position.Y)
        elseif draggingHue then
            UpdateHueFromInput(i.Position.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingColor = false
            draggingHue = false
        end
    end)

    return {
        SetColor = function(newColor)
            if typeof(newColor) == "Color3" then
                BoxColor.BackgroundColor3 = newColor
                Color.BackgroundColor3 = newColor
                ColorH, ColorS, ColorV = Color3.toHSV(newColor)
                ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
                HueSelection.Position = UDim2.new(0.48, 0, 1 - ColorH, 0)
                pcall(callback, newColor)
            end
        end,
        GetColor = function()
            return BoxColor.BackgroundColor3
        end,
        SetRainbow = function(state)
            RainbowColorPicker = state
            UpdateToggleState(true)
        end
    }
end

    -- createKeybind
    function TabAPI:createKeybind(config)
        local name = config.Name or "Keybind"
        local defaultKey = config.Default or Enum.KeyCode.T
        local callback = config.Callback or function() end
        local column = config.Column or 1
        
        local parent = getParent(self, column)
        local container = Instance.new("Frame")
        container.Name = "KeybindContainer"
        container.Size = UDim2.new(1, 0, 0, 40)
        container.BackgroundTransparency = 1
        container.Parent = parent

        local hLayout = Instance.new("UIListLayout", container)
        hLayout.FillDirection = Enum.FillDirection.Horizontal
        hLayout.Padding = UDim.new(0, 8)
        hLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        hLayout.VerticalAlignment = Enum.VerticalAlignment.Center

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 150, 1, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.TextSize = 14
        label.TextColor3 = CurrentTheme.TextColor
        label.Text = name
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container

        local keybindButton = Instance.new("TextButton")
        keybindButton.Name = "KeybindButton"
        keybindButton.Size = UDim2.new(0, 80, 0, 25)
        keybindButton.BackgroundColor3 = CurrentTheme.DropdownBG
        keybindButton.Text = defaultKey.Name
        keybindButton.Font = Enum.Font.GothamBold
        keybindButton.TextSize = 14
        keybindButton.TextColor3 = CurrentTheme.TextColorSecondary
        keybindButton.AutoButtonColor = false
        keybindButton.Parent = container
        Instance.new("UICorner", keybindButton).CornerRadius = UDim.new(0, 6)

        local glow = Instance.new("UIStroke", keybindButton)
        glow.Thickness = 2
        glow.Color = CurrentTheme.KeybindGlow 
        glow.Transparency = 1

        local keybindName = name:gsub(" ", "")
        UI._keybinds[name] = defaultKey
        if callback then UI._keybindCallbacks[name] = callback end

        keybindButton.MouseButton1Click:Connect(function()
            if UI._editing and UI._editing.KeyName ~= keybindName then 
                 UI._editing.Glow.Transparency = 1 
                 UI._editing.Label.Text = UI._keybinds[UI._editing.KeyName].Name
            end
            
            UI._editing = { KeyName = keybindName, Label = keybindButton, Glow = glow }
            keybindButton.Text = "..."
            glow.Transparency = 0
            UI:Notify("Keybind", "Press any key to set keybind for '" .. labelText .. "'", 2)
        end)

        return {
            Frame = container,
            Get = function() return UI._keybinds[keybindName] end,
            Set = function(key)
                if typeof(key) == "EnumItem" and key.EnumType == Enum.KeyCode then
                    UI._keybinds[keybindName] = key
                    keybindButton.Text = key.Name
                else
                    warn("Invalid KeyCode provided for keybind:", labelText)
                end
            end
        }
    end

    function UI:Notify(title, text, duration)
        notify(title, text, duration)
    end

    UI._tabs[name] = TabAPI
    UI._tabFrames[name] = TabFrame
    return TabAPI
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if UI._editing and input.UserInputType == Enum.UserInputType.Keyboard then
        local key = input.KeyCode
        local name = UI._editing.KeyName
        UI._keybinds[name] = key
        UI._editing.Label.Text = key.Name
        UI._editing.Glow.Transparency = 1
        UI._editing = nil
        UI:Notify("Keybind Set", "Keybind for '" .. name .. "' set to " .. key.Name, 1.5)
        return
    end

    if gameProcessed then return end
    
    if input.UserInputType == Enum.UserInputType.Keyboard then
        for name, key in pairs(UI._keybinds) do
            if typeof(key) == "EnumItem" and input.KeyCode == key then
                if UI._keybindCallbacks[name] then
                    local ok,err = pcall(function() UI._keybindCallbacks[name]() end)
                    if not ok then warn("Keybind callback error for '" .. name .. "':", err) end
                end

                if name == "OpenGUI" then
                end
            end
        end
    end
end)

function UI:createTabs(...)
    local names = {...}
    for _,n in ipairs(names) do
        self:createTab(n)
    end
end

task.defer(function()
    repeat task.wait() until UI._Elements.MainFrame and UI._Elements.TabButtonHolder

    local firstTabButton = UI._Elements.TabButtonHolder:FindFirstChildWhichIsA("TextButton")
    if not firstTabButton then return end

    local tabName = string.gsub(firstTabButton.Name, "TabButton_", "")
    local tabFrame = UI._tabFrames[tabName]

    if tabFrame then
        tabFrame.Visible = true
        UI._activeTab = tabName
        firstTabButton.BackgroundColor3 = CurrentTheme.ButtonBG
    end
end)

local Logo = Instance.new("ImageLabel")
Logo.Name = "LoadingLogo"
Logo.Size = UDim2.new(0, 200, 0, 200)
Logo.Position = UDim2.new(0.5, -100, 0.5, -100)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://81450116624685"
Logo.ImageTransparency = 1
Logo.Parent = ScreenGui

local tweenInfoFade = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfoScale = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

TweenService:Create(Logo, tweenInfoFade, {ImageTransparency = 0}):Play()
Logo.Size = UDim2.new(0, 50, 0, 50)
TweenService:Create(Logo, tweenInfoScale, {Size = UDim2.new(0, 200, 0, 200)}):Play()

task.delay(3, function()
    if Logo and Logo.Parent then
        Logo:Destroy()
    end
    if MainFrame then
        MainFrame.Visible = true
    end

    local defaultTheme = UI.CurrentThemeName or "Dark Red"
    
    if UI and UI.ApplyTheme then
        UI:ApplyTheme(defaultTheme)
    elseif applyTheme then
        applyTheme(defaultTheme)
    else
        warn("⚠️ Tidak menemukan fungsi ApplyTheme di UI.")
    end

    if themeDropdown and themeDropdown.Set then
        themeDropdown:Set(defaultTheme)
    end
end)

function UI:ApplyTheme(themeName)
    applyTheme(themeName)
end

UI.Themes = Themes
UI.CurrentTheme = CurrentTheme

return UI
