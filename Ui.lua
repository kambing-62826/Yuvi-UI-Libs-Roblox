local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local LP = Players.LocalPlayer
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local MIN_SIZE = Vector2.new(300, 200)

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 3
        })
    end)
end

local function makeDraggable(frame, dragHandle)
    dragHandle = dragHandle or frame
    local dragging = false
    local startPos, framePos

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
            
            dragging = true
            startPos = input.Position
            framePos = frame.Position
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

local function makeResizable(frame, resizeHandle)
    local resizing = false
    local startPos, frameSize

    local inputChangedConnection = UserInputService.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - startPos
            
            local newWidth = frameSize.X.Offset + delta.X
            local newHeight = frameSize.Y.Offset + delta.Y
            
            newWidth = math.max(newWidth, MIN_SIZE.X)
            newHeight = math.max(newHeight, MIN_SIZE.Y)
            frame.Size = UDim2.new(frameSize.X.Scale, newWidth, frameSize.Y.Scale, newHeight)
            frame.Position = UDim2.new(0.5, -newWidth / 2, 0.5, -newHeight / 2) 
        end
    end)

    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            startPos = input.Position
            frameSize = frame.Size
            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        end
    end

    local function onInputEnded(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and resizing then
            resizing = false
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
    end

    resizeHandle.InputBegan:Connect(onInputBegan)
    UserInputService.InputEnded:Connect(onInputEnded)
    
    frame.Destroying:Connect(function()
        inputChangedConnection:Disconnect()
    end)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YuviHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false 
MainFrame.Parent = ScreenGui

local stroke = Instance.new("UIStroke")
stroke.Thickness = 1
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Parent = MainFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = MainFrame

local ResizeHandle = Instance.new("TextButton")
ResizeHandle.Name = "ResizeHandle"
ResizeHandle.Size = UDim2.new(0, 15, 0, 15)
ResizeHandle.AnchorPoint = Vector2.new(1, 1)
ResizeHandle.Position = UDim2.new(1, 0, 1, 0)
ResizeHandle.BackgroundTransparency = 1
ResizeHandle.Text = ""
ResizeHandle.Parent = MainFrame

ResizeHandle.MouseEnter:Connect(function()
    UserInputService.MouseIcon = "rbxassetid://4733364274"
end)
ResizeHandle.MouseLeave:Connect(function()
    if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
        UserInputService.MouseIcon = ""
    end
end)

local TabHolder = Instance.new("Frame")
TabHolder.Size = UDim2.new(1, 0, 0, 35)
TabHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabHolder.Parent = MainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 15)
headerCorner.Parent = TabHolder

local LeftContainer = Instance.new("Frame")
LeftContainer.Size = UDim2.new(1, -100, 1, 0)
LeftContainer.BackgroundTransparency = 1
LeftContainer.Parent = TabHolder

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 120, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Yuvi Hub"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
local LeftLayout = Instance.new("UIListLayout", LeftContainer)
LeftLayout.FillDirection = Enum.FillDirection.Horizontal
LeftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
LeftLayout.VerticalAlignment = Enum.VerticalAlignment.Center
LeftLayout.Padding = UDim.new(0, 5)

TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = LeftContainer

local padding = Instance.new("UIPadding")
padding.PaddingLeft = UDim.new(0, 10)
padding.Parent = TitleLabel

local textGradient = Instance.new("UIGradient")
textGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180,0,0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(90,0,0))
}
textGradient.Rotation = 90
textGradient.Parent = TitleLabel

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
MinimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(100,100,100)
MinimizeBtn.Parent = RightContainer
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 13)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 1, 0)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
CloseBtn.Parent = RightContainer
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 13)

makeDraggable(MainFrame, TabHolder)
makeResizable(MainFrame, ResizeHandle)

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
PopupBtn.TextColor3 = Color3.fromRGB(255,255,255)
PopupBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
PopupBtn.Visible = false
PopupBtn.Parent = ScreenGui
Instance.new("UICorner", PopupBtn).CornerRadius = UDim.new(0, 6)
makeDraggable(PopupBtn)

-- MINIMIZE / CLOSE HANDLERS
local minimized = false
local function toggleMinimize()
    if MainFrame.Parent and PopupBtn.Parent then
        minimized = not minimized
        MainFrame.Visible = not minimized
        PopupBtn.Visible = minimized
    end
end

MinimizeBtn.MouseButton1Click:Connect(toggleMinimize)
PopupBtn.MouseButton1Click:Connect(toggleMinimize)

CloseBtn.MouseButton1Click:Connect(function()
    if MainFrame.Parent then
        MainFrame.Visible = false
    end
    if PopupBtn.Parent then
        PopupBtn.Visible = false
    end
    minimized = true
end)

local TabButtonHolder = Instance.new("Frame")
TabButtonHolder.Size = UDim2.new(1, -10, 0, 35)
TabButtonHolder.Position = UDim2.new(0, 5, 0, 35)
TabButtonHolder.BackgroundTransparency = 1
TabButtonHolder.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout", TabButtonHolder)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabLayout.Padding = UDim.new(0, 5)

local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 350, 0, 180) 
KeyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeyFrame.BorderSizePixel = 0
KeyFrame.Visible = false 
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", KeyFrame).Color = Color3.fromRGB(255, 0, 0)

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0.2, 0)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "Masukkan Yuvi Hub Key"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 20
KeyTitle.Font = Enum.Font.GothamBold

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyInput.Position = UDim2.new(0.5, 0, 0.35, 0)
KeyInput.AnchorPoint = Vector2.new(0.5, 0)
KeyInput.PlaceholderText = "TOKEN/KEY"
KeyInput.TextSize = 16
KeyInput.TextColor3 = Color3.fromRGB(0, 0, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
KeyInput.ClearTextOnFocus = true 

local SubmitBtn = Instance.new("TextButton", KeyFrame)
SubmitBtn.Name = "SubmitBtn"
SubmitBtn.Size = UDim2.new(0.5, 0, 0.2, 0)
SubmitBtn.Position = UDim2.new(0.5, 0, 0.65, 0)
SubmitBtn.AnchorPoint = Vector2.new(0.5, 0)
SubmitBtn.Text = "VALIDASI"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 18
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.6, 0, 0.18, 0)
GetKeyBtn.Position = UDim2.new(0.5, 0, 0.82, 0)
GetKeyBtn.AnchorPoint = Vector2.new(0.5, 0)
GetKeyBtn.Text = "DAPATKAN KEY"
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 14
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 4)
GetKeyBtn.Parent = KeyFrame

local UI = {}
UI._tabs = {}
UI._tabFrames = {}
UI._keybinds = {}
UI._keybindCallbacks = {}
UI._editing = nil
UI._activeTab = nil

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
    TabButton.TextColor3 = Color3.fromRGB(255,255,255)
    TabButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
    TabButton.Parent = TabButtonHolder

    local cornerBtn = Instance.new("UICorner", TabButton)
    cornerBtn.CornerRadius = UDim.new(0,13)

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80,80,80)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60,60,60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40,40,40))
    }
    gradient.Rotation = 90
    gradient.Parent = TabButton

    local strokeBtn = Instance.new("UIStroke")
    strokeBtn.Thickness = 1.5
    strokeBtn.Color = Color3.fromRGB(20,20,20)
    strokeBtn.Transparency = 0.3
    strokeBtn.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    strokeBtn.Parent = TabButton

    local scale = TabButton:FindFirstChild("ClickScale") or Instance.new("UIScale", TabButton)
    scale.Name = "ClickScale"
    scale.Scale = 1

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

        local shrink = TweenService:Create(scale, TweenInfo.new(0.08), {Scale = 0.92})
        local restore = TweenService:Create(scale, TweenInfo.new(0.08), {Scale = 1})
        shrink:Play()
        shrink.Completed:Connect(function() restore:Play() end)
    end)

    local TabAPI = {}
    TabAPI._frame = TabFrame
    TabAPI._name = name

    local function getParent(self, column)
        column = column or 1
        return (column == 1 and LeftColumn or RightColumn)
    end
    
    function TabAPI:createSection(title, column)
        local parent = getParent(self, column)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, 0, 0, 30)
        container.BackgroundTransparency = 1
        container.Parent = parent

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, 0, 1, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 16
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLabel.Text = title
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = container

        local padding = Instance.new("UIPadding")
        padding.PaddingLeft = UDim.new(0, 5)
        padding.Parent = titleLabel

        local topStroke = Instance.new("Frame")
        topStroke.Size = UDim2.new(1, 0, 0, 1)
        topStroke.Position = UDim2.new(0, 0, 0, 0)
        topStroke.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        topStroke.BorderSizePixel = 0
        topStroke.Parent = container

        return container
    end

    function TabAPI:createToggle(labelText, defaultState, callback, column)
        local parent = getParent(self, column)
        local container = Instance.new("Frame")
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
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.Text = labelText
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container

        local holder = Instance.new("Frame")
        holder.Size = UDim2.new(0, 40, 0, 20)
        holder.BackgroundColor3 = Color3.fromRGB(60,60,60)
        holder.BorderSizePixel = 0
        holder.Parent = container
        Instance.new("UICorner", holder).CornerRadius = UDim.new(0, 10)

        local g = Instance.new("UIGradient", holder)
        g.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(80,80,80)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60,60,60)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(40,40,40))
        }
        g.Rotation = 90

        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 18, 0, 18)
        knob.Position = UDim2.new(0, 1, 0, 1)
        knob.BackgroundColor3 = Color3.fromRGB(0,0,0)
        knob.BorderSizePixel = 0
        knob.Parent = holder
        Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 9)

        local glow = Instance.new("UIStroke")
        glow.Thickness = 2
        glow.Color = Color3.fromRGB(255,50,50)
        glow.Transparency = 1
        glow.Parent = knob

        local state = defaultState or false
        local function updateVisual()
            if state then
                TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -19, 0, 1), BackgroundColor3 = Color3.fromRGB(180,0,0)}):Play()
                glow.Transparency = 0
            else
                TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 1, 0, 1), BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
                glow.Transparency = 1
            end
        end
        updateVisual()

        holder.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                state = not state
                updateVisual()
                if callback then
                    local ok,err = pcall(function() callback(state) end)
                    if not ok then warn("Toggle callback error:", err) end
                end
            end
        end)

        return {
            Frame = container,
            Get = function() return state end,
            Set = function(v) state = v; updateVisual() end
        }
    end

function TabAPI:createButton(text, callback, column)
    local parent = getParent(self, column)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 120, 0, 35)
    
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.BackgroundTransparency = 0 
    
    button.BorderSizePixel = 0
    button.Text = text
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.AutoButtonColor = false
    button.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80,80,80)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60,60,60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40,40,40))
    }
    gradient.Rotation = 90
    gradient.Parent = button

    local scale = Instance.new("UIScale")
    scale.Scale = 1
    scale.Parent = button
    
    local DEFAULT_BG = Color3.fromRGB(60, 60, 60)
    local HOVER_BG = Color3.fromRGB(80, 80, 80) 

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
        animateButton(1.05, HOVER_BG)
    end)

    button.MouseLeave:Connect(function()
        animateButton(1, DEFAULT_BG)
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
        shrink.Completed:Connect(function()
            restore:Play()
        end)

        if callback then
            task.spawn(callback)
        end
    end)
    return button
end

    function TabAPI:createSlider(labelText, min, max, default, callback, column)
        local parent = getParent(self, column)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0.90 , 0, 0, 60)
        container.BackgroundTransparency = 1
        container.Parent = parent
        
        local header = Instance.new("Frame")
        header.Size = UDim2.new(1, 0, 0, 20)
        header.BackgroundTransparency = 1
        header.Parent = container
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.TextSize = 14
        label.TextColor3 = Color3.fromRGB(240, 240, 240)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Text = labelText
        label.Parent = header
        
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(0.3, 0, 1, 0)
        valueLabel.Position = UDim2.new(0.7, 0, 0, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Font = Enum.Font.GothamBold
        valueLabel.TextSize = 14
        valueLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right
        valueLabel.Text = tostring(default or min)
        valueLabel.Parent = header
        
        local track = Instance.new("Frame")
        track.Size = UDim2.new(0.85, 0, 0, 8)
        track.Position = UDim2.new(0.075, 0, 0, 30)
        track.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        track.BorderSizePixel = 0
        track.Parent = container
        Instance.new("UICorner", track).CornerRadius = UDim.new(0, 4)
        
        local fill = Instance.new("Frame")
        fill.Size = UDim2.new(0, 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        fill.BorderSizePixel = 0
        fill.Parent = track
        Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 4)
        
        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 14, 0, 14)
        knob.Position = UDim2.new(0, -7, 0.5, -7)
        knob.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        knob.BorderSizePixel = 0
        knob.Parent = track
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

        local value = default or min
        local dragging = false
        local function updateVisual()
        local percent = (value - min) / (max - min)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        knob.Position = UDim2.new(percent, -7, 0.5, -7)
        valueLabel.Text = tostring(math.floor(value))
        end
        updateVisual()
        
        local function onInputChanged(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local relative = (input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X
            value = math.clamp(min + relative * (max - min), min, max)
            updateVisual()
            if callback then
            pcall(callback, value)
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
        value = math.clamp(v, min, max)
        updateVisual()
        if callback then
            pcall(callback, value)
        end
    end
    }
end

function TabAPI:createDropdown(labelText, options, default, callback, column)
    local parent = getParent(self, column)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 35)
    container.BackgroundTransparency = 1
    container.Parent = parent

    local hLayout = Instance.new("UIListLayout", container)
    hLayout.FillDirection = Enum.FillDirection.Horizontal
    hLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    hLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    hLayout.Padding = UDim.new(0, 8)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 80, 1, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextColor3 = Color3.fromRGB(240,240,240)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = labelText
    label.Parent = container

    local dropdownBtn = Instance.new("TextButton")
    dropdownBtn.Size = UDim2.new(0, 120, 1, 0)
    dropdownBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    dropdownBtn.Text = default or "Select"
    dropdownBtn.Font = Enum.Font.GothamBold
    dropdownBtn.TextSize = 14
    dropdownBtn.TextColor3 = Color3.fromRGB(240,240,240)
    dropdownBtn.AutoButtonColor = false
    dropdownBtn.Parent = container

    local corner = Instance.new("UICorner", dropdownBtn)
    corner.CornerRadius = UDim.new(1, 0)

    local stroke = Instance.new("UIStroke", dropdownBtn)
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(120,0,0)
    stroke.Transparency = 0.2

    local glow = Instance.new("UIStroke", dropdownBtn)
    glow.Thickness = 4
    glow.Color = Color3.fromRGB(180,0,0)
    glow.Transparency = 0.8

    local listFrame = Instance.new("Frame")
    listFrame.Size = UDim2.new(0, 200, 0, 0)
    listFrame.Position = UDim2.new(0.5, -100, 0, 35)
    listFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    listFrame.BorderSizePixel = 0
    listFrame.ClipsDescendants = true
    listFrame.Visible = false
    listFrame.Parent = container
    Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 8)

    local listStroke = Instance.new("UIStroke", listFrame)
    listStroke.Thickness = 2
    listStroke.Color = Color3.fromRGB(120, 0, 0)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -10, 1, -40)
    scroll.Position = UDim2.new(0, 5, 0, 35)
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.ScrollBarThickness = 6
    scroll.BackgroundTransparency = 1
    scroll.Parent = listFrame

    local listLayout = Instance.new("UIListLayout", scroll)
    listLayout.Padding = UDim.new(0, 2)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
    end)

    local DROPDOWN_CLOSED_HEIGHT = 35
    local DROPDOWN_OPEN_HEIGHT = 185
    local LIST_FRAME_OPEN_HEIGHT = 150

    local function toggleList(show)
        if show then
            listFrame.Visible = true
            TweenService:Create(container, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, DROPDOWN_OPEN_HEIGHT)}):Play()
            TweenService:Create(listFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 200, 0, LIST_FRAME_OPEN_HEIGHT)}):Play()
        else
            TweenService:Create(container, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, DROPDOWN_CLOSED_HEIGHT)}):Play()
            TweenService:Create(listFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 200, 0, 0)}):Play()
            task.delay(0.2, function() listFrame.Visible = false end)
        end
    end

    local listOpen = false
    dropdownBtn.MouseButton1Click:Connect(function()
        listOpen = not listOpen
        toggleList(listOpen)
    end)

    local function refreshOptions(filter)
        for _,child in ipairs(scroll:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        for _,opt in ipairs(options) do
            if (not filter) or string.find(opt:lower(), filter:lower()) then
                local optBtn = Instance.new("TextButton")
                optBtn.Size = UDim2.new(1, -4, 0, 25)
                optBtn.BackgroundColor3 = Color3.fromRGB(55,55,55)
                optBtn.Text = opt
                optBtn.Font = Enum.Font.GothamBold
                optBtn.TextSize = 14
                optBtn.TextColor3 = Color3.fromRGB(220,220,220)
                optBtn.AutoButtonColor = false
                optBtn.Parent = scroll
                Instance.new("UICorner", optBtn).CornerRadius = UDim.new(0, 6)

                local glowOpt = Instance.new("UIStroke", optBtn)
                glowOpt.Thickness = 2
                glowOpt.Color = Color3.fromRGB(180,0,0)
                glowOpt.Transparency = 1

                optBtn.MouseEnter:Connect(function()
                    TweenService:Create(optBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
                        BackgroundColor3 = Color3.fromRGB(70,70,70),
                        TextColor3 = Color3.fromRGB(255,255,255)
                    }):Play()
                    TweenService:Create(glowOpt, TweenInfo.new(0.15), {Transparency = 0}):Play()
                end)

                optBtn.MouseLeave:Connect(function()
                    TweenService:Create(optBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
                        BackgroundColor3 = Color3.fromRGB(55,55,55),
                        TextColor3 = Color3.fromRGB(220,220,220)
                    }):Play()
                    TweenService:Create(glowOpt, TweenInfo.new(0.15), {Transparency = 1}):Play()
                end)

                optBtn.MouseButton1Click:Connect(function()
                    dropdownBtn.Text = opt
                    if callback then
                        pcall(callback, opt)
                    end
                    listOpen = false
                    toggleList(false)
                end)
            end
        end
    end
    refreshOptions()
    
    UserInputService.InputBegan:Connect(function(input)
        if listOpen and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mouse = game.Players.LocalPlayer:GetMouse()
            local isClickInsideList = (mouse.X >= listFrame.AbsolutePosition.X and mouse.X <= listFrame.AbsolutePosition.X + listFrame.AbsoluteSize.X and
                                         mouse.Y >= listFrame.AbsolutePosition.Y and mouse.Y <= listFrame.AbsolutePosition.Y + listFrame.AbsoluteSize.Y)
            local isClickInsideButton = (mouse.X >= dropdownBtn.AbsolutePosition.X and mouse.X <= dropdownBtn.AbsolutePosition.X + dropdownBtn.AbsoluteSize.X and
                                             mouse.Y >= dropdownBtn.AbsolutePosition.Y and mouse.Y <= dropdownBtn.AbsolutePosition.Y + dropdownBtn.AbsoluteSize.Y)
            
            if not isClickInsideList and not isClickInsideButton then
                 listOpen = false
                 toggleList(false)
            end
        end
    end)
    
    return {
        Frame = container,
        SetOptions = function(newOptions) options = newOptions; refreshOptions() end,
        Set = function(value) 
            dropdownBtn.Text = value
            if callback then
                pcall(callback, value)
            end
        end
    }
end

    function TabAPI:createKeybind(labelText, defaultKey, callback, column)
        local parent = getParent(self, column)
        local container = Instance.new("Frame")
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
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.Text = labelText
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container

        local keybindButton = Instance.new("TextButton")
        keybindButton.Size = UDim2.new(0, 80, 0, 25)
        keybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        keybindButton.Text = defaultKey.Name
        keybindButton.Font = Enum.Font.GothamBold
        keybindButton.TextSize = 14
        keybindButton.TextColor3 = Color3.fromRGB(240,240,240)
        keybindButton.AutoButtonColor = false
        keybindButton.Parent = container
        Instance.new("UICorner", keybindButton).CornerRadius = UDim.new(0, 6)

        local glow = Instance.new("UIStroke", keybindButton)
        glow.Thickness = 2
        glow.Color = Color3.fromRGB(0, 150, 255)
        glow.Transparency = 1

        local keybindName = labelText:gsub(" ", "")
        UI._keybinds[keybindName] = defaultKey
        if callback then
            UI._keybindCallbacks[keybindName] = callback
        end

        keybindButton.MouseButton1Click:Connect(function()
            if UI._editing then
                UI._editing.Glow.Transparency = 1
            end
            UI._editing = {
                KeyName = keybindName,
                Label = keybindButton,
                Glow = glow
            }
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
                    toggleGUI()
                end
            end
        end
    end
end)

function UI:createTabs(...)
    local names = {...}local Players = game:GetService("Players")
    for _,n in ipairs(names) do
        self:createTab(n)
    end
end

local Logo = Instance.new("ImageLabel", ScreenGui)
Logo.Size = UDim2.new(0, 200, 0, 200)
Logo.Position = UDim2.new(0.5, -100, 0.5, -100)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://81450116624685"
Logo.ImageTransparency = 1

local tweenInfoFade = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
TweenService:Create(Logo, tweenInfoFade, {ImageTransparency = 0}):Play()
Logo.Size = UDim2.new(0, 50, 0, 50)
TweenService:Create(Logo, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, 200)}):Play()

task.delay(3, function()
    if Logo.Parent then
        Logo:Destroy() 
    end

    if ScreenGui.Parent then
        MainFrame.Visible = true
    end

    if next(UI._tabFrames) then
        local firstName = next(UI._tabs)
        local firstFrame = UI._tabFrames[firstName]
        if firstFrame and not UI._activeTab then
             firstFrame.Visible = true
             UI._activeTab = firstName
        end

        local activeTabButton = TabButtonHolder:FindFirstChild("TabButton_" .. UI._activeTab)
        if activeTabButton then
            local scale = activeTabButton:FindFirstChild("ClickScale")
            if scale then
                scale.Scale = 1
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            end
        
        local mouse = game.Players.LocalPlayer:GetMouse()
        local isOverHandle = (mouse.Target == ResizeHandle)
        
        if not isOverHandle and UserInputService.MouseIcon == "rbxassetid://4733364274" then
            UserInputService.MouseIcon = ""
        end
        
        local activeTabButton = TabButtonHolder:FindFirstChild("TabButton_" .. UI._activeTab)
        if activeTabButton then
            local scale = activeTabButton:FindFirstChild("ClickScale")
            if scale then
                scale.Scale = 1
            end
        end
    end
end)

_G.YuviHubUI
