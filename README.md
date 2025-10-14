# Masih tahap uji coba, dan sebenarnya aku membuat ini karena sedang bosan saja hihi
# Deskripsi
Ini adalah termasuk kode Exploit, dan bisa membuat akun kamu terkena Banned. Apabila akun kamu terkena Banned, salahkan diri kamu, kenapa memakai kode Exploit

## 🚀 Copy kode di bawah ini dan Paste di Editor kamu
```lua
local Yv = loadstring(game:HttpGet("https://raw.githubusercontent.com/kambing-62826/Yuvi-UI-Libs/refs/heads/main/test.lua"))()

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
- Contoh pembuatan Tab
```lua
local MainTab = Yv:createTab("Main")
```

## Section
- Membuat grup content Tab dengan judul di section
```lua
MainTab:createSection({
    Name = "Example",
    Column = 1 -- ubah sesuai column (1-2)
})
```
## Toggle
- Contoh pembuatan Toggle
```lua
MainTab:createToggle({
    Name = "Example",
    CurrentValue = false,
    Flag = "Examplee",
    Column = 1, -- Column di sesuaikan dengan section jika ingin menggunakan Section
    Callback = function(state)
        print("...:", state)
    end
})
```
## Button
- Contoh pembuatan Button
```lua
MainTab:createButton({
    Name = "Respawn",
    Column = 1,
    Callback = function()
        local player = game.Players.LocalPlayer -- ini hanya contoh respawn, kamu bisa menghapus/merubahnya
        if player and player.Character then
            player.Character:BreakJoints()
            print("Respawn !")
        end
    end
})
```
