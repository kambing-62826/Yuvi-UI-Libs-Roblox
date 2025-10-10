-- INI MASIH TAHAP UJI COBA, AKU HANYA BOSAN DAN MEMBUAT SCRIPT INI HAHAHA

-- Contoh pembuatan Tabs
local MyTab:createTab("Example")

-- Ini berfungsi untuk membuka Tabs pertama (ubah bagian nama example dengan Tabs yang ingin kamu buat)
if ExampleTab then
    ExampleTab._frame.Visible = true
    UI._activeTab = "Example"
end

-- EXAMPLE SECTION KIRI KANAN
MyTab:createSection("Example", 1)-- Contoh penggunaan section kolom kiri
MyTab:createSection("Example", 2)-- Contoh penggunaan section kolom kanan

-- EXAMPLE TOGGLE
MyTab:createToggle("Example", true, function(s)
    print("Feature enabled:", s)
    UI:Notify("Example", "Example is now " .. (s and "ON" or "OFF"), 1)
end, 1) -- Kolom kiri , jika ingin kolom kanan ubah angka menjadi 2, sesuaikan dengan section

-- EXAMPLE BUTTON
MyTab:createButton("Example", function()
    print("Example")
    UI:Notify("Example", "Example!", 1.5)
end, 1) -- Kolom kiri

-- EXAMPLE SLIDER
MyTab:createSlider("Example", 0, 10, 5, function(v)
    print("Example:", v)
end, 1) -- Kolom kiri

-- EXAMPLE DROPDOWN
MyTab:createDropdown("Example", {"Example", "Example", "Example"}, "Example", function(v)
    print("Example set to", v)
    UI:Notify("Example", "Example set to: " .. v, 1)
end, 1) -- Kolom kiri

-- EXAMPLE KEYBIND
MyTab:createKeybind("Example", Enum.KeyCode.H, function()
    local ExampleToggle = MyTab:createToggle("Example", false) -- Ini akan mengembalikan objek toggle yang sudah ada
    ExampleToggle:Set(not ExampleToggle:Get())
end, 1) -- kolom kiri

-- Fungsi ini untuk membuat logo opening, ubah ID dan ganti dengan ID kamu 
-- NOTE : ( JIKA INGIN MEMAKAI LOGO OPENING, TARUH KODE INI DI PALING AKHIR SETELAH KAMU MEMBUAT SEMUA CONTENT DAN FITUR TABS )
local Logo = Instance.new("ImageLabel", ScreenGui)
Logo.Size = UDim2.new(0, 200, 0, 200)
Logo.Position = UDim2.new(0.5, -100, 0.5, -100)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://81450116624685" -- ubah ID ini dengan ID kamu
Logo.ImageTransparency = 1

local tweenInfoFade = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
TweenService:Create(Logo, tweenInfoFade, {ImageTransparency = 0}):Play()
Logo.Size = UDim2.new(0, 50, 0, 50)
TweenService:Create(Logo, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, 200)}):Play()

task.delay(3, function()
    Logo:Destroy() 
    MainFrame.Visible = true
    if UI._activeTab then
        local activeTabButton = TabButtonHolder:FindFirstChild("TabButton_" .. UI._activeTab)
        if activeTabButton then
            local scale = activeTabButton:FindFirstChild("ClickScale")
            if scale then
                scale.Scale = 1
            end
        end
    end
end)

-- Ini wajib kamu taruh di bagian paling bawah setelah semua kode di buat
_G.YuviHubUI = UI
