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
## 💡 Catatan:
Di dalam loadstring sebenarnya sudah ada fitur Notify, jadi bagian berikut ini hanya contoh tambahan — tidak wajib digunakan.
- Salin kode
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
- Membuat tab utama di UI:
- Salin kode
```lua
local MainTab = Yv:createTab("Main")
```

## 🗂️ Section
- Membuat grup konten di dalam tab dengan judul section:
```lua
Salin kode
MainTab:createSection({
    Name = "Example Section",
    Column = 1 -- ubah sesuai kolom (1-2)
})
```

## TextBox
```lua
ainTab:createTextbox({
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
- Contoh pembuatan toggle sederhana:
```lua
Salin kode
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
Contoh tombol (button):
```lua
Salin kode
MainTab:createButton({
    Name = "Example Button",
    Column = 1,
    Callback = function()
        print("Selected Button")
    end
})
```

## 🎚️ Slider
- Contoh slider:
```lua
Salin kode
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
- Contoh dropdown sederhana:
```lua
Salin kode
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

## 🎨 Fitur Tambahan: Theme
- Kamu juga bisa menambahkan dropdown khusus untuk mengganti tema:
```lua
Salin kode
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
- Contoh keybind (menjalankan fungsi saat tombol ditekan):
```lua
Salin kode
MainTab:createKeybind({
    Name = "Example Keybind",
    Default = Enum.KeyCode.F, -- default: F
    Column = 1,
    Callback = function()
        print("Pressed Feature Key")
    end
})
```

## 📘 Catatan Akhir
This project is for personal study and experimentation only.

Do not use the main account.

If you are interested in combining it further, you can change, modify, and add your own features 😄.

- Dibuat oleh: Yuvi
- Library: Yuvi UI Libs
- Status: 🔧 Uji coba / experimental
