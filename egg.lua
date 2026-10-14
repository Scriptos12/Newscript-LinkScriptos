-- Break Eggs | t.me.linkscriptos
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Состояния
local AutoBreak = false
local WalkSpeed = 16
local InfJump = true
local ClickRate = 50

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaEggHub"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Кнопка открытия
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Position = UDim2.new(0.05, 0, 0.1, 0)
ToggleButton.Size = UDim2.new(0, 90, 0, 32)
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "Скрыть"
ToggleButton.Active = true
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 6)

-- Главное меню
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 320)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Egg Hub | t.me.linkscriptos"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.TextSize = 12
Title.Font = Enum.Font.SourceSansBold

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Position = UDim2.new(1, -26, 0, 4)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Active = true
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

-- Кнопки
local function makeBtn(txt, y)
    local b = Instance.new("TextButton")
    b.Parent = MainFrame
    b.Position = UDim2.new(0.05, 0, 0, y)
    b.Size = UDim2.new(0, 210, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Text = txt
    b.TextSize = 12
    b.Font = Enum.Font.SourceSans
    b.Active = true
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local FarmBtn = makeBtn("Быстрый клик: ВЫКЛ", 34)
local SpeedBtn = makeBtn("Быстрый бег: ВЫКЛ", 68)
local JumpBtn = makeBtn("Бесконечный прыжок: ВКЛ", 102)

-- Ползунки
local function makeSlider(lblText, init, min, max, callback, yPos)
    local sl = Instance.new("Frame")
    sl.Parent = MainFrame
    sl.Size = UDim2.new(0, 210, 0, 22)
    sl.Position = UDim2.new(0.05, 0, 0, yPos)
    sl.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    sl.Active = true
    Instance.new("UICorner", sl).CornerRadius = UDim.new(0, 6)

    local fill = Instance.new("Frame")
    fill.Parent = sl
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
    fill.Active = false
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 6)

    local knob = Instance.new("TextButton")
    knob.Parent = sl
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = UDim2.new(0, 0, 0.5, -9)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Text = ""
    knob.Active = true
    knob.AutoButtonColor = false
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local lbl = Instance.new("TextLabel")
    lbl.Parent = sl
    lbl.Size = UDim2.new(1, -10, 1, 0)
    lbl.Position = UDim2.new(0, 5, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = lblText .. ": " .. init
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 10
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Active = false

    local dragging = false
    local function upd(x)
        local ap, asz = sl.AbsolutePosition, sl.AbsoluteSize
        if asz.X <= 0 then return end
        local rel = math.clamp((x - ap.X) / asz.X, 0, 1)
        knob.Position = UDim2.new(rel, -9, 0.5, -9)
        fill.Size = UDim2.new(rel, 0, 1, 0)
        local v = math.floor(min + (max - min) * rel)
        lbl.Text = lblText .. ": " .. v
        callback(v)
    end

    knob.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    sl.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            upd(i.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
            upd(i.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- ==== СКОРОСТЬ (BodyVelocity) ====
local speedConn = nil
local speedBV = nil

local function stopSpeed()
    if speedConn then speedConn:Disconnect() speedConn = nil end
    if speedBV then speedBV:Destroy() speedBV = nil end
end

local function startSpeed()
    stopSpeed()
    if WalkSpeed <= 16 then return end
    speedConn = RunService.Heartbeat:Connect(function()
        if not LocalPlayer.Character then return end
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end

        if hum.MoveDirection.Magnitude > 0.1 then
            if not speedBV or not speedBV.Parent then
                speedBV = Instance.new("BodyVelocity")
                speedBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                speedBV.P = 1250
                speedBV.Parent = hrp
            end
            speedBV.Velocity = Vector3.new(
                hum.MoveDirection.X * WalkSpeed,
                hrp.Velocity.Y,
                hum.MoveDirection.Z * WalkSpeed
            )
        else
            if speedBV and speedBV.Parent then
                speedBV.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end)
end

-- Ползунки
makeSlider("Скорость клика", ClickRate, 1, 100, function(v)
    ClickRate = v
end, 138)

makeSlider("Скорость бега", WalkSpeed, 16, 300, function(v)
    WalkSpeed = v
    if v > 16 then
        startSpeed()
    else
        stopSpeed()
    end
end, 166)

-- Подпись внизу
local Footer = Instance.new("TextLabel")
Footer.Parent = MainFrame
Footer.Size = UDim2.new(1, 0, 0, 18)
Footer.Position = UDim2.new(0, 0, 1, -18)
Footer.BackgroundTransparency = 1
Footer.Text = "t.me.linkscriptos"
Footer.TextColor3 = Color3.fromRGB(0, 200, 255)
Footer.TextSize = 11
Footer.Font = Enum.Font.GothamBold

-- Открытие/закрытие
ToggleButton.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        MainFrame.Visible = false
        ToggleButton.Text = "Открыть"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    else
        MainFrame.Visible = true
        ToggleButton.Text = "Скрыть"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

-- Кнопки
FarmBtn.MouseButton1Click:Connect(function()
    AutoBreak = not AutoBreak
    FarmBtn.Text = "Быстрый клик: " .. (AutoBreak and "ВКЛ" or "ВЫКЛ")
    FarmBtn.BackgroundColor3 = AutoBreak and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(45, 45, 45)
end)

SpeedBtn.MouseButton1Click:Connect(function()
    if WalkSpeed == 16 then
        WalkSpeed = 60
        SpeedBtn.Text = "Быстрый бег: ВКЛ"
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
        startSpeed()
    else
        WalkSpeed = 16
        SpeedBtn.Text = "Быстрый бег: ВЫКЛ"
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        stopSpeed()
    end
end)

JumpBtn.MouseButton1Click:Connect(function()
    InfJump = not InfJump
    JumpBtn.Text = "Бесконечный прыжок: " .. (InfJump and "ВКЛ" or "ВЫКЛ")
    JumpBtn.BackgroundColor3 = InfJump and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(45, 45, 45)
end)

-- Авто-клик
task.spawn(function()
    while true do
        if AutoBreak and ClickRate > 0 then
            pcall(function()
                if LocalPlayer.Character then
                    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                    end
                end
            end)
            task.wait(1 / ClickRate)
        else
            task.wait(0.1)
        end
    end
end)

-- Бесконечный прыжок
UserInputService.JumpRequest:Connect(function()
    if InfJump then
        pcall(function()
            if LocalPlayer.Character then
                local h = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end
        end)
    end
end)

-- После смерти
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if WalkSpeed > 16 then startSpeed() end
end)

-- Полное выключение
CloseBtn.MouseButton1Click:Connect(function()
    AutoBreak = false
    InfJump = false
    stopSpeed()
    ScreenGui:Destroy()
end)
