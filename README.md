# 🧪 Still in the trial stage
I actually made this out of boredom, haha 😆  
This project stages, so please understand that there are still many things that need to be fixed.

---

# ⚠️ Description
This script contains exploit code, so use it at your own risk.
If your account gets **Banned**, blame no one but yourself, becaues you chose to run this exploit code.

---

## 🚀 How to use?
Copy the code below and paste it into your editor or executor:

```lua
local Yv = loadstring(game:HttpGet("https://raw.githubusercontent.com/kambing-62826/Yuvi-UI-Libs-Roblox/refs/heads/roblox/Yuvi%20Libs.lua"))()
```
## 💡 Note:
Loadstring already has a Notify feature, so the following section is just an additional example-it's not mandatory.
```lua
local StarterGui = game:GetService("StarterGui")
local featureRunning = false
local pgThread

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", { Title = title, Text = text, Duration = duration or 3 })
    end)
end
```

## ⚙️ Tabs
- Create main tab in UI:
```lua
local MainTab = Yv:createTab("Main")
```

## 🗂️ Section
- Create content goups within tabs with titles:
```lua
MainTab:createSection({
    Name = "Example Section",
    Column = 1 -- ubah sesuai kolom (1-2)
})
```

## TextBox
```lua
MainTab:createTextbox({
    Placeholder = "Search...",
    Callback = function(value)
        print("User typed:", value)
    end,
    Column = 1
})

```

## Label
- no background
```lua
MainTab:createLabel({
    Text = "This is a plain label text.",
    TextSize = 14,
    Column = 1
})
```
- this one uses a background
```lua
MainTab:createLabel({
    Text = "Remember to save your settings after editing!",
    TextSize = 14,
    Background = true,
    BackgroundColor = Color3.fromRGB(0, 0, 0),
    Column = 1
})
```

## Line
```lua
MainTab:createLine({
    Orientation = "Horizontal",
    Color = Color3.fromRGB(80, 80, 80),
    Thickness = 1,
    Length = 1,
    Column = 1
})
```

## Color Picker
- pc only
```lua
MainTab:createColorPicker({
    Name = "Accent",
    Default = Color3.fromRGB(255,0,0),
    Callback = function(c) print("picked:", c) end,
    Column = 1
})

-- set color later:
picker:SetColor(Color3.fromRGB(0,255,0))
print(picker:GetColor())
```

## 🔘 Toggle
- Example of making a simple toggle:
```lua
MainTab:createToggle({
    Name = "Example Toggle",
    CurrentValue = false,
    Flag = "Examplee",
    Column = 1,
    Callback = function(state)
        print("Selected Toggle:", state)
    end
})
```

## 🖱️ Button
- Button exmplae:
```lua
MainTab:createButton({
    Name = "Example Button",
    Column = 1,
    Callback = function()
        print("Selected Button")
    end
})
```

## 🎚️ Slider
- Slider example:
```lua
MainTab:createSlider({
    Name = "Example Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Column = 1,
    Callback = function(value)
        print("Slider value:", value)
    end
})
```

## 🧾 Dropdown
- Simple Dropdown example:
```lua
MainTab:createDropdown({
    Name = "Example Dropdown",
    Options = {"Option 1", "Option 2", "Option 3"},
    CurrentOption = "Option 1",
    Column = 1,
    Callback = function(selectedOption)
        print("Selected option:", selectedOption)
    end
})
```

## 🎨 Additional features: Theme
- You can also add a custom Dropdown to change the theme:
```lua
-- 🎨 UI Theme
local ThemeNames = {}
for name in pairs(Yv.Themes or {}) do
    table.insert(ThemeNames, name)
end

MainTab:createDropdown({
    Name = "Select Theme",
    Options = ThemeNames,
    CurrentOption = "Dark Red",
    Column = 1,
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
```

## ⌨️ Keybind
- Keybind example (Runs a function when a key is pressed):
```lua
MainTab:createKeybind({
    Name = "Example Keybind",
    Default = Enum.KeyCode.F, -- default: F
    Column = 1,
    Callback = function()
        print("Pressed Feature Key")
    end
})
```

## 📘 Last Note
This project is for personal study and experimentation only.

Do not use the main account.

If you are interested in combining it further, you can change, modify, and add your own features 😄.

- Dibuat oleh: Yuvi
- Library: Yuvi UI Libs
- Status: 🔧 Uji coba / experimental
