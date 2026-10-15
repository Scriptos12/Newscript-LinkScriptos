-- ═══════════════════════════════════════════════════════════
--        DELTA MENU v2 - MODERN EDITION
--        t.me/linkscriptos
-- ═══════════════════════════════════════════════════════════

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

-- Обход anti-cheat (защита от логов Delta)
if getgenv then
    getgenv().Delta = getgenv().Delta or {}
    getgenv().Delta.Enabled = true
end
pcall(function()
    if syn and syn.protect_gui then
        syn.protect_gui(game:GetService("CoreGui"))
    end
end)
pcall(function()
    if gethui then
        return gethui()
    end
end)

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Уничтожаем старое меню
for _, v in ipairs(CoreGui:GetChildren()) do
    if v.Name == "LinkscriptosMenu" then v:Destroy() end
end

-- ═══════════════════════════════════════════════════════════
--                ROOT GUI
-- ═══════════════════════════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LinkscriptosMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = CoreGui

-- ═══════════════════════════════════════════════════════════
--                FLOATING OPEN BUTTON
-- ═══════════════════════════════════════════════════════════
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenBtn"
OpenBtn.Size = UDim2.new(0, 52, 0, 52)
OpenBtn.Position = UDim2.new(0, 15, 0.45, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
OpenBtn.Text = "⚡"
OpenBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
OpenBtn.TextSize = 26
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.AutoButtonColor = false
OpenBtn.Active = true
OpenBtn.Draggable = true
OpenBtn.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner", OpenBtn)
OpenCorner.CornerRadius = UDim.new(1, 0)
local OpenStroke = Instance.new("UIStroke", OpenBtn)
OpenStroke.Color = Color3.fromRGB(0, 200, 255)
OpenStroke.Thickness = 2
OpenStroke.Transparency = 0.3
local OpenGrad = Instance.new("UIGradient", OpenBtn)
OpenGrad.Color = ColorSequence.new(Color3.fromRGB(35, 35, 55), Color3.fromRGB(15, 15, 25))
OpenGrad.Rotation = 45

-- ═══════════════════════════════════════════════════════════
--                MAIN WINDOW
-- ═══════════════════════════════════════════════════════════
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 480, 0, 320)
Main.Position = UDim2.new(0.5, -240, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(0, 200, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.4
local MainGrad = Instance.new("UIGradient", Main)
MainGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 32)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 18))
})
MainGrad.Rotation = 90

-- ═══════════════════════════════════════════════════════════
--                TOP BAR (с ссылкой)
-- ═══════════════════════════════════════════════════════════
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 32)
TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
TopBar.BackgroundTransparency = 0.2
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local TopCorner = Instance.new("UICorner", TopBar)
TopCorner.CornerRadius = UDim.new(0, 12)
local TopFix = Instance.new("Frame")
TopFix.Size = UDim2.new(1, 0, 0, 12)
TopFix.Position = UDim2.new(0, 0, 1, -12)
TopFix.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
TopFix.BackgroundTransparency = 0.2
TopFix.BorderSizePixel = 0
TopFix.Parent = TopBar

local TopLink = Instance.new("TextLabel")
TopLink.Size = UDim2.new(1, -100, 1, 0)
TopLink.Position = UDim2.new(0, 12, 0, 0)
TopLink.BackgroundTransparency = 1
TopLink.Text = "📡 t.me/linkscriptos"
TopLink.TextColor3 = Color3.fromRGB(0, 200, 255)
TopLink.TextSize = 13
TopLink.Font = Enum.Font.GothamBold
TopLink.TextXAlignment = Enum.TextXAlignment.Left
TopLink.Parent = TopBar

-- Minimize / Close
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 22, 0, 22)
MinBtn.Position = UDim2.new(1, -52, 0.5, -11)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
MinBtn.Text = "—"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 14
MinBtn.Font = Enum.Font.GothamBold
MinBtn.AutoButtonColor = false
MinBtn.Parent = TopBar
local MinCorner = Instance.new("UICorner", MinBtn)
MinCorner.CornerRadius = UDim.new(1, 0)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Position = UDim2.new(1, -26, 0.5, -11)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = TopBar
local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(1, 0)

-- ═══════════════════════════════════════════════════════════
--                SIDEBAR (вкладки)
-- ═══════════════════════════════════════════════════════════
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 110, 1, -64)
Sidebar.Position = UDim2.new(0, 6, 0, 38)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 32)
Sidebar.BackgroundTransparency = 0.3
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SideCorner = Instance.new("UICorner", Sidebar)
SideCorner.CornerRadius = UDim.new(0, 10)
local SideLayout = Instance.new("UIListLayout", Sidebar)
SideLayout.Padding = UDim.new(0, 4)
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
local SidePad = Instance.new("UIPadding", Sidebar)
SidePad.PaddingTop = UDim.new(0, 6)

-- User info at sidebar bottom
local UserInfo = Instance.new("TextLabel")
UserInfo.Name = "UserInfo"
UserInfo.Size = UDim2.new(1, -8, 0, 40)
UserInfo.Position = UDim2.new(0, 4, 1, -44)
UserInfo.BackgroundColor3 = Color3.fromRGB(28, 28, 45)
UserInfo.BackgroundTransparency = 0.2
UserInfo.Text = "👤 " .. LocalPlayer.Name .. "\n⚡ Delta"
UserInfo.TextColor3 = Color3.fromRGB(180, 200, 230)
UserInfo.TextSize = 10
UserInfo.Font = Enum.Font.GothamMedium
UserInfo.Parent = Sidebar
local UIC = Instance.new("UICorner", UserInfo)
UIC.CornerRadius = UDim.new(0, 8)

-- ═══════════════════════════════════════════════════════════
--                CONTENT AREA
-- ═══════════════════════════════════════════════════════════
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -124, 1, -64)
Content.Position = UDim2.new(0, 118, 0, 38)
Content.BackgroundColor3 = Color3.fromRGB(20, 20, 32)
Content.BackgroundTransparency = 0.3
Content.BorderSizePixel = 0
Content.Parent = Main

local ContCorner = Instance.new("UICorner", Content)
ContCorner.CornerRadius = UDim.new(0, 10)

-- Bottom bar со ссылкой
local BottomBar = Instance.new("Frame")
BottomBar.Name = "BottomBar"
BottomBar.Size = UDim2.new(1, 0, 0, 26)
BottomBar.Position = UDim2.new(0, 0, 1, -26)
BottomBar.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
BottomBar.BackgroundTransparency = 0.2
BottomBar.BorderSizePixel = 0
BottomBar.Parent = Main

local BotCorner = Instance.new("UICorner", BottomBar)
BotCorner.CornerRadius = UDim.new(0, 12)
local BotFix = Instance.new("Frame")
BotFix.Size = UDim2.new(1, 0, 0, 12)
BotFix.Position = UDim2.new(0, 0, 0, 0)
BotFix.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
BotFix.BackgroundTransparency = 0.2
BotFix.BorderSizePixel = 0
BotFix.Parent = BottomBar

local BottomLink = Instance.new("TextLabel")
BottomLink.Size = UDim2.new(1, 0, 1, 0)
BottomLink.BackgroundTransparency = 1
BottomLink.Text = "📡 t.me/linkscriptos"
BottomLink.TextColor3 = Color3.fromRGB(0, 200, 255)
BottomLink.TextSize = 12
BottomLink.Font = Enum.Font.GothamBold
BottomLink.Parent = BottomBar

-- ═══════════════════════════════════════════════════════════
--                TAB SYSTEM
-- ═══════════════════════════════════════════════════════════
local Tabs = {}
local ActiveTab = nil

local function CreateTab(name, icon)
    -- Кнопка вкладки
    local Btn = Instance.new("TextButton")
    Btn.Name = name
    Btn.Size = UDim2.new(1, -8, 0, 34)
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 45)
    Btn.BackgroundTransparency = 1
    Btn.Text = ""
    Btn.AutoButtonColor = false
    Btn.Parent = Sidebar

    local BtnCorner = Instance.new("UICorner", Btn)
    BtnCorner.CornerRadius = UDim.new(0, 8)

    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.new(0, 24, 1, 0)
    Icon.Position = UDim2.new(0, 6, 0, 0)
    Icon.BackgroundTransparency = 1
    Icon.Text = icon
    Icon.TextColor3 = Color3.fromRGB(150, 170, 200)
    Icon.TextSize = 15
    Icon.Font = Enum.Font.GothamBold
    Icon.Parent = Btn

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -34, 1, 0)
    Label.Position = UDim2.new(0, 32, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(150, 170, 200)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Btn

    -- Страница
    local Page = Instance.new("ScrollingFrame")
    Page.Name = name .. "Page"
    Page.Size = UDim2.new(1, -12, 1, -12)
    Page.Position = UDim2.new(0, 6, 0, 6)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.ScrollBarThickness = 3
    Page.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.Visible = false
    Page.Parent = Content

    local PageLayout = Instance.new("UIListLayout", Page)
    PageLayout.Padding = UDim.new(0, 5)
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
    end)

    local Tab = {Name = name, Button = Btn, Page = Page, Icon = Icon, Label = Label}

    local function Activate()
        if ActiveTab == Tab then return end
        if ActiveTab then
            TweenService:Create(ActiveTab.Button, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(ActiveTab.Icon, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 170, 200)}):Play()
            TweenService:Create(ActiveTab.Label, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 170, 200)}):Play()
            ActiveTab.Page.Visible = false
        end
        ActiveTab = Tab
        TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
        Btn.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        TweenService:Create(Icon, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 200, 255)}):Play()
        TweenService:Create(Label, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 200, 255)}):Play()
        Page.Visible = true
    end

    Btn.MouseButton1Click:Connect(Activate)
    Tab.Activate = Activate
    Tabs[name] = Tab
    return Tab
end

-- ═══════════════════════════════════════════════════════════
--                UI ELEMENTS
-- ═══════════════════════════════════════════════════════════

-- Section
local function Section(parent, text)
    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1, -4, 0, 22)
    L.BackgroundTransparency = 1
    L.Text = "▸ " .. text
    L.TextColor3 = Color3.fromRGB(0, 200, 255)
    L.TextSize = 12
    L.Font = Enum.Font.GothamBold
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = parent
    return L
end

-- Button
local function Button(parent, text, callback)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1, -4, 0, 32)
    B.BackgroundColor3 = Color3.fromRGB(32, 32, 50)
    B.Text = text
    B.TextColor3 = Color3.fromRGB(220, 225, 240)
    B.TextSize = 12
    B.Font = Enum.Font.GothamMedium
    B.AutoButtonColor = false
    B.Parent = parent
    local C = Instance.new("UICorner", B)
    C.CornerRadius = UDim.new(0, 6)
    local S = Instance.new("UIStroke", B)
    S.Color = Color3.fromRGB(0, 200, 255)
    S.Thickness = 1
    S.Transparency = 0.8

    B.MouseEnter:Connect(function()
        TweenService:Create(B, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(45, 45, 70)}):Play()
    end)
    B.MouseLeave:Connect(function()
        TweenService:Create(B, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(32, 32, 50)}):Play()
    end)
    B.MouseButton1Click:Connect(function()
        TweenService:Create(B, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 180, 230)}):Play()
        task.wait(0.1)
        TweenService:Create(B, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(32, 32, 50)}):Play()
        if callback then pcall(callback) end
    end)
    return B
end

-- Toggle (полноценный, рабочий)
local function Toggle(parent, text, default, callback)
    local state = default or false

    local F = Instance.new("Frame")
    F.Size = UDim2.new(1, -4, 0, 32)
    F.BackgroundColor3 = Color3.fromRGB(32, 32, 50)
    F.BorderSizePixel = 0
    F.Parent = parent
    local C = Instance.new("UICorner", F)
    C.CornerRadius = UDim.new(0, 6)
    local S = Instance.new("UIStroke", F)
    S.Color = Color3.fromRGB(0, 200, 255)
    S.Thickness = 1
    S.Transparency = 0.8

    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1, -60, 1, 0)
    L.Position = UDim2.new(0, 10, 0, 0)
    L.BackgroundTransparency = 1
    L.Text = text
    L.TextColor3 = Color3.fromRGB(220, 225, 240)
    L.TextSize = 12
    L.Font = Enum.Font.GothamMedium
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = F

    local Track = Instance.new("TextButton")
    Track.Size = UDim2.new(0, 40, 0, 20)
    Track.Position = UDim2.new(1, -48, 0.5, -10)
    Track.BackgroundColor3 = state and Color3.fromRGB(0, 200, 255) or Color3.fromRGB(55, 55, 75)
    Track.Text = ""
    Track.AutoButtonColor = false
    Track.Parent = F
    local TC = Instance.new("UICorner", Track)
    TC.CornerRadius = UDim.new(1, 0)

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 14, 0, 14)
    Knob.Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.Parent = Track
    local KC = Instance.new("UICorner", Knob)
    KC.CornerRadius = UDim.new(1, 0)

    local function Update()
        if state then
            TweenService:Create(Track, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 200, 255)}):Play()
            TweenService:Create(Knob, TweenInfo.new(0.2), {Position = UDim2.new(1, -17, 0.5, -7)}):Play()
        else
            TweenService:Create(Track, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 55, 75)}):Play()
            TweenService:Create(Knob, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -7)}):Play()
        end
    end

    local function Set(v)
        state = v
        Update()
    end

    Track.MouseButton1Click:Connect(function()
        state = not state
        Update()
        if callback then
            local ok, err = pcall(callback, state)
            if not ok then warn("[Menu Toggle Error] " .. tostring(err)) end
        end
    end)

    return F, Set
end

-- Slider
local function Slider(parent, text, min, max, default, callback)
    local value = default or min

    local F = Instance.new("Frame")
    F.Size = UDim2.new(1, -4, 0, 48)
    F.BackgroundColor3 = Color3.fromRGB(32, 32, 50)
    F.BorderSizePixel = 0
    F.Parent = parent
    local C = Instance.new("UICorner", F)
    C.CornerRadius = UDim.new(0, 6)
    local S = Instance.new("UIStroke", F)
    S.Color = Color3.fromRGB(0, 200, 255)
    S.Thickness = 1
    S.Transparency = 0.8

    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1, -20, 0, 18)
    L.Position = UDim2.new(0, 10, 0, 4)
    L.BackgroundTransparency = 1
    L.Text = text .. ": " .. tostring(value)
    L.TextColor3 = Color3.fromRGB(220, 225, 240)
    L.TextSize = 11
    L.Font = Enum.Font.GothamMedium
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = F

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1, -20, 0, 8)
    Bar.Position = UDim2.new(0, 10, 1, -16)
    Bar.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
    Bar.BorderSizePixel = 0
    Bar.Parent = F
    local BC = Instance.new("UICorner", Bar)
    BC.CornerRadius = UDim.new(1, 0)

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
    Fill.BorderSizePixel = 0
    Fill.Parent = Bar
    local FC = Instance.new("UICorner", Fill)
    FC.CornerRadius = UDim.new(1, 0)

    local dragging = false

    local function Update(input)
        local pos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
        value = math.floor(min + (max - min) * pos + 0.5)
        Fill.Size = UDim2.new(pos, 0, 1, 0)
        L.Text = text .. ": " .. tostring(value)
        if callback then
            local ok, err = pcall(callback, value)
            if not ok then warn("[Menu Slider Error] " .. tostring(err)) end
        end
    end

    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            Update(input)
        end
    end)
    Bar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            Update(input)
        end
    end)

    return F
end

-- TextBox
local function TextBox(parent, placeholder, callback)
    local F = Instance.new("Frame")
    F.Size = UDim2.new(1, -4, 0, 32)
    F.BackgroundColor3 = Color3.fromRGB(32, 32, 50)
    F.BorderSizePixel = 0
    F.Parent = parent
    local C = Instance.new("UICorner", F)
    C.CornerRadius = UDim.new(0, 6)
    local S = Instance.new("UIStroke", F)
    S.Color = Color3.fromRGB(0, 200, 255)
    S.Thickness = 1
    S.Transparency = 0.8

    local TB = Instance.new("TextBox")
    TB.Size = UDim2.new(1, -16, 1, 0)
    TB.Position = UDim2.new(0, 8, 0, 0)
    TB.BackgroundTransparency = 1
    TB.Text = ""
    TB.PlaceholderText = placeholder
    TB.PlaceholderColor3 = Color3.fromRGB(120, 130, 160)
    TB.TextColor3 = Color3.fromRGB(220, 225, 240)
    TB.TextSize = 12
    TB.Font = Enum.Font.GothamMedium
    TB.TextXAlignment = Enum.TextXAlignment.Left
    TB.ClearTextOnFocus = false
    TB.Parent = F

    TB.FocusLost:Connect(function(enter)
        if enter and callback then
            pcall(callback, TB.Text)
        end
    end)
    return F
end

-- Dropdown
local function Dropdown(parent, text, options, callback)
    local expanded = false

    local F = Instance.new("Frame")
    F.Size = UDim2.new(1, -4, 0, 32)
    F.BackgroundColor3 = Color3.fromRGB(32, 32, 50)
    F.BorderSizePixel = 0
    F.Parent = parent
    local C = Instance.new("UICorner", F)
    C.CornerRadius = UDim.new(0, 6)
    local S = Instance.new("UIStroke", F)
    S.Color = Color3.fromRGB(0, 200, 255)
    S.Thickness = 1
    S.Transparency = 0.8

    local L = Instance.new("TextButton")
    L.Size = UDim2.new(1, 0, 1, 0)
    L.BackgroundTransparency = 1
    L.Text = text .. "  ▼"
    L.TextColor3 = Color3.fromRGB(220, 225, 240)
    L.TextSize = 12
    L.Font = Enum.Font.GothamMedium
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = F
    local LP = Instance.new("UIPadding", L)
    LP.PaddingLeft = UDim.new(0, 10)

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, 0, 0, 0)
    Holder.Position = UDim2.new(0, 0, 1, 4)
    Holder.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
    Holder.BorderSizePixel = 0
    Holder.ClipsDescendants = true
    Holder.Visible = false
    Holder.ZIndex = 10
    Holder.Parent = F
    local HC = Instance.new("UICorner", Holder)
    HC.CornerRadius = UDim.new(0, 6)
    local HL = Instance.new("UIListLayout", Holder)
    HL.Padding = UDim.new(0, 2)
    local HP = Instance.new("UIPadding", Holder)
    HP.PaddingTop = UDim.new(0, 4)

    L.MouseButton1Click:Connect(function()
        expanded = not expanded
        Holder.Visible = expanded
        if expanded then
            Holder.Size = UDim2.new(1, 0, 0, #options * 26 + 8)
        else
            Holder.Size = UDim2.new(1, 0, 0, 0)
        end
    end)

    for _, opt in ipairs(options) do
        local O = Instance.new("TextButton")
        O.Size = UDim2.new(1, -8, 0, 24)
        O.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
        O.Text = tostring(opt)
        O.TextColor3 = Color3.fromRGB(200, 210, 230)
        O.TextSize = 11
        O.Font = Enum.Font.GothamMedium
        O.AutoButtonColor = false
        O.Parent = Holder
        local OC = Instance.new("UICorner", O)
        OC.CornerRadius = UDim.new(0, 4)
        O.MouseButton1Click:Connect(function()
            L.Text = text .. ": " .. tostring(opt) .. "  ▼"
            expanded = false
            Holder.Visible = false
            Holder.Size = UDim2.new(1, 0, 0, 0)
            if callback then pcall(callback, opt) end
        end)
    end

    return F
end

-- ═══════════════════════════════════════════════════════════
--                ФУНКЦИОНАЛ: PLAYER
-- ═══════════════════════════════════════════════════════════
local PlayerTab = CreateTab("Player", "👤")

Section(PlayerTab.Page, "Движение")
Slider(PlayerTab.Page, "WalkSpeed", 16, 500, 16, function(v)
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
end)
Slider(PlayerTab.Page, "JumpPower", 50, 500, 50, function(v)
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = v end
    end
end)
Slider(PlayerTab.Page, "Gravity", 10, 500, 196, function(v)
    workspace.Gravity = v
end)

Section(PlayerTab.Page, "Тело")
Button(PlayerTab.Page, "🔄 Сброс скорости", function()
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 hum.JumpPower = 50 end
    end
    workspace.Gravity = 196
end)
Button(PlayerTab.Page, "❤️ Полное HP", function()
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = hum.MaxHealth end
    end
end)
Button(PlayerTab.Page, "💀 Убить себя", function()
    if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end
end)

Section(PlayerTab.Page, "Бесконечный прыжок")
Toggle(PlayerTab.Page, "Infinite Jump", false, function(state)
    getgenv().InfJump = state
end)

UserInputService.JumpRequest:Connect(function()
    if getgenv().InfJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

-- ═══════════════════════════════════════════════════════════
--                ФУНКЦИОНАЛ: VISUAL
-- ═══════════════════════════════════════════════════════════
local VisualTab = CreateTab("Visual", "👁")

Section(VisualTab.Page, "Освещение")

local savedLighting = {
    Brightness = Lighting.Brightness,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd
}

Toggle(VisualTab.Page, "Fullbright", false, function(state)
    if state then
        Lighting.Brightness = 3
        Lighting.Ambient = Color3.fromRGB(178, 178, 178)
        Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
        Lighting.ClockTime = 14
        Lighting.FogEnd = 1e6
    else
        Lighting.Brightness = savedLighting.Brightness
        Lighting.Ambient = savedLighting.Ambient
        Lighting.OutdoorAmbient = savedLighting.OutdoorAmbient
        Lighting.ClockTime = savedLighting.ClockTime
        Lighting.FogEnd = savedLighting.FogEnd
    end
end)

Toggle(VisualTab.Page, "Remove Fog", false, function(state)
    Lighting.FogEnd = state and 1e6 or savedLighting.FogEnd
end)

Toggle(VisualTab.Page, "Remove Shadows", false, function(state)
    Lighting.GlobalShadows = not state
end)

Section(VisualTab.Page, "ESP")

local espData = {}
local espEnabled = false

local function CreateESP(plr)
    if plr == LocalPlayer then return end
    if espData[plr] then return end
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESP_" .. plr.Name
    box.Size = Vector3.new(2, 2.4, 1)
    box.Adornee = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    box.AlwaysOnTop = true
    box.ZIndex = 5
    box.Transparency = 0.5
    box.Color3 = Color3.fromRGB(255, 60, 60)
    box.Parent = ScreenGui

    espData[plr] = {Box = box}
end

local function RemoveESP(plr)
    if espData[plr] then
        if espData[plr].Box then espData[plr].Box:Destroy() end
        espData[plr] = nil
    end
end

local function RefreshESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                CreateESP(plr)
            else
                RemoveESP(plr)
            end
        end
    end
end

Toggle(VisualTab.Page, "Player ESP", false, function(state)
    espEnabled = state
    if state then
        RefreshESP()
    else
        for plr, _ in pairs(espData) do RemoveESP(plr) end
        espData = {}
    end
end)

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        if espEnabled then
            task.wait(0.4)
            CreateESP(plr)
        end
    end)
end)
Players.PlayerRemoving:Connect(function(plr) RemoveESP(plr) end)

Section(VisualTab.Page, "Камера")
Slider(VisualTab.Page, "FOV", 70, 140, 70, function(v)
    Camera.FieldOfView = v
end)
Button(VisualTab.Page, "🔄 Сброс FOV", function()
    Camera.FieldOfView = 70
end)

-- ═══════════════════════════════════════════════════════════
--                ФУНКЦИОНАЛ: COMBAT
-- ═══════════════════════════════════════════════════════════
local CombatTab = CreateTab("Combat", "⚔")

Section(CombatTab.Page, "Атака")
Toggle(CombatTab.Page, "Kill Aura", false, function(state)
    getgenv().KillAura = state
end)
Slider(CombatTab.Page, "Kill Aura Radius", 5, 50, 10, function(v)
    getgenv().KillAuraRadius = v
end)
Toggle(CombatTab.Page, "Touch Fling", false, function(state)
    getgenv().TouchFling = state
end)

task.spawn(function()
    while task.wait(0.25) do
        if getgenv().KillAura and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local radius = getgenv().KillAuraRadius or 10
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local targetHrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                        if targetHrp and hum and (targetHrp.Position - hrp.Position).Magnitude < radius then
                            hum.Health = 0
                        end
                    end
                end
            end
        end
    end
end)

Section(CombatTab.Page, "Телепорт")
Button(CombatTab.Page, "🎯 К ближайшему игроку", function()
    local closest, dist = nil, math.huge
    local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHrp then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local d = (hrp.Position - myHrp.Position).Magnitude
                if d < dist then dist = d closest = plr end
            end
        end
    end
    if closest and closest.Character then
        local hrp = closest.Character:FindFirstChild("HumanoidRootPart")
        if hrp then myHrp.CFrame = hrp.CFrame + Vector3.new(0, 0, 3) end
    end
end)

Button(CombatTab.Page, "🌫️ Убить всех (клиент)", function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = 0 end
        end
    end
end)

-- ═══════════════════════════════════════════════════════════
--                ФУНКЦИОНАЛ: MISC
-- ═══════════════════════════════════════════════════════════
local MiscTab = CreateTab("Misc", "⚙")

Section(MiscTab.Page, "Утилиты")

Toggle(MiscTab.Page, "Anti-AFK", false, function(state)
    getgenv().AntiAFK = state
end)

pcall(function()
    LocalPlayer.Idled:Connect(function()
        if getgenv().AntiAFK then
            local VU = game:GetService("VirtualUser")
            VU:CaptureController()
            VU:ClickButton2(Vector2.new())
        end
    end)
end)

Toggle(MiscTab.Page, "Hide Character (клиент)", false, function(state)
    if LocalPlayer.Character then
        for _, v in ipairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                v.LocalTransparencyModifier = state and 1 or 0
                v.Transparency = state and 1 or 0
            end
        end
    end
end)

Button(MiscTab.Page, "🔄 Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end)

Button(MiscTab.Page, "🗑️ Удалить меню", function()
    ScreenGui:Destroy()
end)

Section(MiscTab.Page, "Server Info")
local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(1, -4, 0, 60)
Info.BackgroundColor3 = Color3.fromRGB(28, 28, 45)
Info.TextColor3 = Color3.fromRGB(180, 200, 230)
Info.TextSize = 11
Info.Font = Enum.Font.GothamMedium
Info.TextWrapped = true
Info.Parent = MiscTab.Page
local IC = Instance.new("UICorner", Info)
IC.CornerRadius = UDim.new(0, 6)

task.spawn(function()
    local frames = 0
    local last = tick()
    RunService.RenderStepped:Connect(function()
        frames = frames + 1
    end)
    while Info.Parent do
        local now = tick()
        local fps = math.floor(frames / (now - last))
        frames = 0 last = now
        local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)
        Info.Text = string.format(
            "👤 Игрок: %s\n📊 FPS: %d\n🌐 Пинг: %d ms\n👥 Игроков: %d",
            LocalPlayer.Name, fps, ping, #Players:GetPlayers()
        )
        task.wait(0.6)
    end
end)

-- ═══════════════════════════════════════════════════════════
--                ФУНКЦИОНАЛ: SETTINGS
-- ═══════════════════════════════════════════════════════════
local SettingsTab = CreateTab("Settings", "🔧")

Section(SettingsTab.Page, "UI")
Slider(SettingsTab.Page, "UI Scale", 50, 150, 100, function(v)
    Main.Size = UDim2.new(0, math.floor(480 * v / 100), 0, math.floor(320 * v / 100))
end)

Dropdown(SettingsTab.Page, "Theme", {"Cyan", "Purple", "Green", "Red"}, function(opt)
    local colors = {
        Cyan = Color3.fromRGB(0, 200, 255),
        Purple = Color3.fromRGB(170, 80, 255),
        Green = Color3.fromRGB(60, 220, 130),
        Red = Color3.fromRGB(255, 80, 80)
    }
    local c = colors[opt] or colors.Cyan
    MainStroke.Color = c
    TopLink.TextColor3 = c
    BottomLink.TextColor3 = c
    OpenStroke.Color = c
    OpenBtn.TextColor3 = c
    for _, tab in pairs(Tabs) do
        if tab == ActiveTab then
            tab.Button.BackgroundColor3 = c
            tab.Icon.TextColor3 = c
            tab.Label.TextColor3 = c
        end
    end
end)

Section(SettingsTab.Page, "О скрипте")
local AboutL = Instance.new("TextLabel")
AboutL.Size = UDim2.new(1, -4, 0, 50)
AboutL.BackgroundColor3 = Color3.fromRGB(28, 28, 45)
AboutL.Text = "📡 t.me/linkscriptos\nDelta Menu v2 • Modern Edition"
AboutL.TextColor3 = Color3.fromRGB(0, 200, 255)
AboutL.TextSize = 12
AboutL.Font = Enum.Font.GothamBold
AboutL.TextWrapped = true
AboutL.Parent = SettingsTab.Page
local AboutC = Instance.new("UICorner", AboutL)
AboutC.CornerRadius = UDim.new(0, 6)

-- ═══════════════════════════════════════════════════════════
--                OPEN / CLOSE ANIMATION
-- ═══════════════════════════════════════════════════════════
local isOpen = false

local function OpenMenu()
    if isOpen then return end
    isOpen = true

    Main.Visible = true
    Main.Size = UDim2.new(0, 0, 0, 0)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)

    TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 480, 0, 320),
        Position = UDim2.new(0.5, -240, 0.5, -160)
    }):Play()

    TweenService:Create(OpenBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()

    if not ActiveTab then PlayerTab.Activate() end
end

local function CloseMenu()
    if not isOpen then return end
    isOpen = false

    TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()

    task.wait(0.25)
    Main.Visible = false

    TweenService:Create(OpenBtn, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 52, 0, 52)
    }):Play()
end

OpenBtn.MouseButton1Click:Connect(OpenMenu)
CloseBtn.MouseButton1Click:Connect(CloseMenu)

-- Свайп от левого края
local swipeStart = nil
UserInputService.TouchStarted:Connect(function(input)
    if input.Position.X < 30 then swipeStart = input.Position end
end)
UserInputService.TouchEnded:Connect(function(input)
    if swipeStart and input.Position.X > swipeStart.X + 80 and not isOpen then
        OpenMenu()
    end
    swipeStart = nil
end)

-- Кнопка minimize (просто открывает/закрывает)
MinBtn.MouseButton1Click:Connect(CloseMenu)

-- Авто-открытие
task.wait(0.5)
OpenMenu()

print("✅ Delta Menu v2 загружено | t.me/linkscriptos")
