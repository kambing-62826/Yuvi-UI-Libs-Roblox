# 🧪 Masih Tahap Uji Coba
Sebenarnya aku membuat ini karena sedang **bosan saja**, hihi 😆  
Proyek ini masih dalam tahap **eksperimen**, jadi harap maklum kalau masih banyak yang perlu diperbaiki.

---

# ⚠️ Deskripsi
Script ini termasuk **kode exploit**, jadi **gunakan dengan risiko sendiri**.  
Jika akun kamu terkena banned, **jangan salahkan siapa pun selain dirimu sendiri**, karena kamu memilih untuk menjalankan kode exploit ini.

---

## 🚀 Cara Pakai
Salin kode di bawah ini dan tempel ke editor executor kamu:

```lua
local Yv = loadstring(game:HttpGet("https://raw.githubusercontent.com/kambing-62826/Yuvi-UI-Libs/refs/heads/main/Yuvi%20Libs.lua"))()
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
Proyek ini hanya untuk belajar dan eksperimen pribadi.

Jangan gunakan di akun utama.

Jika kamu tertarik mengembangkan lebih jauh, kamu bisa ubah, modifikasi, dan tambahkan fiturnya sendiri 😄

- Dibuat oleh: Yuvi
- Library: Yuvi UI Libs
- Status: 🔧 Uji coba / experimental
