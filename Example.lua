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

