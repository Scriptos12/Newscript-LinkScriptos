-- LinkScripts v7 | tg https://t.me/linkscriptos
local p=game.Players.LocalPlayer
local u=game:GetService("UserInputService")
local r=game:GetService("RunService")
local l=game:GetService("Lighting")
local vu=game:GetService("VirtualUser")
local ws=game:GetService("Workspace")
local rs=game:GetService("ReplicatedStorage")
local ts=game:GetService("TweenService")

-- Флаги
local F,S,J,N,I,A,FB,RF,E,NG,CC,AA,XR,GR,INV,SP=false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false
local TP,FL,SK,CB,FM,GH=false,false,false,false,false,false
local BH,LS,HP,NF,NC,IL,WT,IT,MS,FT,WS2,RR=false,false,false,false,false,false,false,false,false,false,false,false
local AF,SB,AD,WH,SG,JB,TG,AR,AN,FP,AP,TR,FR,SI=false,false,false,false,false,false,false,false,false,false,false,false,false,false
local sp,jp,fsp,fa=100,50,80,5
local flyRecreate=false

local g=Instance.new("ScreenGui",p:WaitForChild("PlayerGui"))
g.Name="LSM" g.ResetOnSpawn=false g.IgnoreGuiInset=true

local f=Instance.new("Frame",g)
f.Size=UDim2.new(0,260,0,340) f.Position=UDim2.new(0,15,0.5,-170)
f.BackgroundColor3=Color3.fromRGB(14,14,20) f.Active=true f.Draggable=true
Instance.new("UICorner",f).CornerRadius=UDim.new(0,12)
local st=Instance.new("UIStroke",f) st.Color=Color3.fromRGB(0,200,255) st.Thickness=1.5

local t=Instance.new("TextLabel",f)
t.Size=UDim2.new(1,0,0,32) t.BackgroundColor3=Color3.fromRGB(22,22,32)
t.Text="  LinkScripts v7" t.TextColor3=Color3.fromRGB(0,220,255)
t.Font=Enum.Font.GothamBold t.TextSize=13
t.TextXAlignment=Enum.TextXAlignment.Left
Instance.new("UICorner",t).CornerRadius=UDim.new(0,12)

local hb=Instance.new("TextButton",f)
hb.Size=UDim2.new(0,26,0,26) hb.Position=UDim2.new(1,-60,0,3)
hb.BackgroundColor3=Color3.fromRGB(230,180,40) hb.Text="—"
hb.TextColor3=Color3.fromRGB(255,255,255) hb.Font=Enum.Font.GothamBold hb.TextSize=16
Instance.new("UICorner",hb).CornerRadius=UDim.new(0,6)

local kb=Instance.new("TextButton",f)
kb.Size=UDim2.new(0,26,0,26) kb.Position=UDim2.new(1,-32,0,3)
kb.BackgroundColor3=Color3.fromRGB(220,50,50) kb.Text="X"
kb.TextColor3=Color3.fromRGB(255,255,255) kb.Font=Enum.Font.GothamBold kb.TextSize=14
Instance.new("UICorner",kb).CornerRadius=UDim.new(0,6)

local m=Instance.new("TextButton",g)
m.Size=UDim2.new(0,50,0,50) m.Position=UDim2.new(0,12,0.5,-25)
m.BackgroundColor3=Color3.fromRGB(15,15,25) m.Text="M"
m.TextColor3=Color3.fromRGB(0,220,255) m.Font=Enum.Font.GothamBold
m.TextSize=20 m.Visible=false
Instance.new("UICorner",m).CornerRadius=UDim.new(1,0)
local ms=Instance.new("UIStroke",m) ms.Color=Color3.fromRGB(0,200,255) ms.Thickness=1.5

local tabsFrame=Instance.new("Frame",f)
tabsFrame.Size=UDim2.new(1,-12,0,32) tabsFrame.Position=UDim2.new(0,6,0,38)
tabsFrame.BackgroundTransparency=1

local function mkTab(txt,pos)
    local b=Instance.new("TextButton",tabsFrame)
    b.Size=UDim2.new(0.25,-2,1,0) b.Position=UDim2.new(pos,0,0,0)
    b.BackgroundColor3=Color3.fromRGB(30,30,45) b.Text=txt
    b.TextColor3=Color3.fromRGB(180,180,200) b.Font=Enum.Font.GothamMedium
    b.TextSize=10
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
    return b
end

local tabMove=mkTab("Движение",0)
local tabVis=mkTab("Визуал",0.25)
local tabFun=mkTab("Механики",0.5)
local tabMisc=mkTab("Разное",0.75)

local scroll=Instance.new("ScrollingFrame",f)
scroll.Size=UDim2.new(1,-12,1,-140) scroll.Position=UDim2.new(0,6,0,76)
scroll.BackgroundTransparency=1 scroll.BorderSizePixel=0
scroll.ScrollBarThickness=4 scroll.CanvasSize=UDim2.new(0,0,0,0)
scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y

local lay=Instance.new("UIListLayout",scroll)
lay.Padding=UDim.new(0,6) lay.SortOrder=Enum.SortOrder.LayoutOrder

local sliderBox=Instance.new("Frame",f)
sliderBox.Size=UDim2.new(1,-12,0,60) sliderBox.Position=UDim2.new(0,6,1,-66)
sliderBox.BackgroundTransparency=1

local function mkSlider(lblTxt,init,min,max,cb,pos)
    local sl=Instance.new("Frame",sliderBox)
    sl.Size=UDim2.new(1,0,0,26) sl.Position=UDim2.new(0,0,pos,0)
    sl.BackgroundColor3=Color3.fromRGB(30,30,45)
    Instance.new("UICorner",sl).CornerRadius=UDim.new(0,8)
    local fl=Instance.new("Frame",sl)
    fl.Size=UDim2.new(0,0,1,0) fl.BackgroundColor3=Color3.fromRGB(0,200,255)
    Instance.new("UICorner",fl).CornerRadius=UDim.new(0,8)
    local kn=Instance.new("TextButton",sl)
    kn.Size=UDim2.new(0,22,0,22) kn.Position=UDim2.new(0,0,0.5,-11)
    kn.BackgroundColor3=Color3.fromRGB(255,255,255) kn.Text=""
    Instance.new("UICorner",kn).CornerRadius=UDim.new(1,0)
    local lbl=Instance.new("TextLabel",sl)
    lbl.Size=UDim2.new(1,-10,1,0) lbl.Position=UDim2.new(0,5,0,0)
    lbl.BackgroundTransparency=1 lbl.Text=lblTxt..": "..init
    lbl.TextColor3=Color3.fromRGB(255,255,255) lbl.Font=Enum.Font.GothamBold
    lbl.TextSize=11 lbl.TextXAlignment=Enum.TextXAlignment.Left
    local drag=false
    local function upd(x)
        local ap,asz=sl.AbsolutePosition,sl.AbsoluteSize
        if asz.X<=0 then return end
        local rel=math.clamp((x-ap.X)/asz.X,0,1)
        kn.Position=UDim2.new(rel,-11,0.5,-11)
        fl.Size=UDim2.new(rel,0,1,0)
        local v=math.floor(min+(max-min)*rel)
        lbl.Text=lblTxt..": "..v
        cb(v)
    end
    kn.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true end end)
    sl.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true upd(i.Position.X) end end)
    u.InputChanged:Connect(function(i) if drag and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then upd(i.Position.X) end end)
    u.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end end)
end

mkSlider("Speed",sp,16,300,function(v)
    sp=v
    if S and p.Character then
        local h=p.Character:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed=v end
    end
end,0)

mkSlider("Jump",jp,50,500,function(v)
    jp=v
    if J and p.Character then
        local h=p.Character:FindFirstChildOfClass("Humanoid")
        if h then h.JumpPower=v h.UseJumpPower=true end
    end
end,32)

local function btn(txt)
    local b=Instance.new("TextButton",scroll)
    b.Size=UDim2.new(1,0,0,38)
    b.BackgroundColor3=Color3.fromRGB(28,28,42) b.Text=txt..": ВЫКЛ"
    b.TextColor3=Color3.fromRGB(230,230,240) b.Font=Enum.Font.GothamMedium
    b.TextSize=13
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
    return b
end

-- Движение
local bF=btn("Fly"); local bS=btn("Speed"); local bJ=btn("Jump")
local bN=btn("Noclip"); local bI=btn("Inf Jump"); local bA=btn("Anti-AFK")
local bNG=btn("No Gravity"); local bCC=btn("Click TP"); local bGR=btn("Ghost Trail")
local bSP=btn("Spin Player"); local bTP=btn("Teleport To Player"); local bFL=btn("Float")
local bBH=btn("Bhop"); local bLS=btn("Long Strafe"); local bHP=btn("High Ping TP")
local bNF=btn("No Fall Damage"); local bNC=btn("No Clip Camera")

-- Визуал
local bFB=btn("Fullbright"); local bRF=btn("No Fog"); local bE=btn("ESP")
local bAA=btn("Aim Assist"); local bXR=btn("X-Ray"); local bINV=btn("Invisible")
local bSK=btn("Skeleton ESP"); local bFM=btn("First Person"); local bGH=btn("Ghost Mode")

-- Механики (новое!)
local bAF=btn("Auto Farm"); local bSB=btn("Spin Bot"); local bAD=btn("Auto Dodge")
local bWH=btn("Wall Hop"); local bSG=btn("Speed Glitch"); local bJB=btn("Jump Boost")
local bTG=btn("Truss Glitch"); local bAR=btn("Anti Ragdoll"); local bAN=btn("Anti Noclip")
local bFP=btn("Fling"); local bAP=btn("Auto Parry"); local bTR=btn("Trap Player")
local bFR=btn("Freeze Player"); local bSI=btn("Sit Glitch")

-- Разное
local bIL=btn("Anti-Kick"); local bWT=btn("Walk on Water")
local bIT=btn("Infinite Tools"); local bMS=btn("Auto Click")
local bFT=btn("Fly Trail"); local bWS2=btn("Water Speed"); local bRR=btn("Rainbow Body")
local bCB=btn("Click Sound")

-- == ФУНКЦИИ ДВИЖЕНИЯ ==

-- Fly (улучшенный, стабильный)
local bv,bg,fc
local function startF()
    local c=p.Character if not c then return end
    local h=c:FindFirstChild("HumanoidRootPart") if not h then return end
    -- Убираем старое, если осталось
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
    if fc then fc:Disconnect() end
    bv=Instance.new("BodyVelocity",h)
    bv.MaxForce=Vector3.new(9e9,9e9,9e9)
    bv.Velocity=Vector3.new()
    bv.P=1250
    bg=Instance.new("BodyGyro",h)
    bg.MaxTorque=Vector3.new(9e9,9e9,9e9)
    bg.CFrame=h.CFrame
    bg.P=1000
    fc=r.RenderStepped:Connect(function()
        if not F or not p.Character then return end
        local hrp=p.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        -- Переприкрепляем если BodyVelocity отвалился
        if not bv or not bv.Parent then
            bv=Instance.new("BodyVelocity",hrp)
            bv.MaxForce=Vector3.new(9e9,9e9,9e9)
            bv.P=1250
        end
        if not bg or not bg.Parent then
            bg=Instance.new("BodyGyro",hrp)
            bg.MaxTorque=Vector3.new(9e9,9e9,9e9)
            bg.P=1000
        end
        local d=Vector3.new()
        if u:IsKeyDown(Enum.KeyCode.W) then d=d+workspace.CurrentCamera.CFrame.LookVector end
        if u:IsKeyDown(Enum.KeyCode.S) then d=d-workspace.CurrentCamera.CFrame.LookVector end
        if u:IsKeyDown(Enum.KeyCode.A) then d=d-workspace.CurrentCamera.CFrame.RightVector end
        if u:IsKeyDown(Enum.KeyCode.D) then d=d+workspace.CurrentCamera.CFrame.RightVector end
        if u:IsKeyDown(Enum.KeyCode.Space) then d=d+Vector3.new(0,1,0) end
        if u:IsKeyDown(Enum.KeyCode.LeftShift) then d=d-Vector3.new(0,1,0) end
        bv.Velocity=d*fsp
        bg.CFrame=CFrame.new(hrp.Position,hrp.Position+workspace.CurrentCamera.CFrame.LookVector)
    end)
end

local function stopF()
    if fc then fc:Disconnect() fc=nil end
    if bv then bv:Destroy() bv=nil end
    if bg then bg:Destroy() bg=nil end
end

-- Noclip
r.Stepped:Connect(function()
    if not N or not p.Character then return end
    for _,v in pairs(p.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide then v.CanCollide=false end
    end
end)

-- Speed/Jump
r.Heartbeat:Connect(function()
    if not p.Character then return end
    local h=p.Character:FindFirstChildOfClass("Humanoid")
    if not h then return end
    if S and h.WalkSpeed~=sp then h.WalkSpeed=sp end
    if J and h.JumpPower~=jp then h.JumpPower=jp h.UseJumpPower=true end
end)

-- Inf Jump
local ijc
local function startI()
    if ijc then ijc:Disconnect() end
    ijc=u.JumpRequest:Connect(function()
        if I and p.Character then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end)
end

-- Anti-AFK
local aac
local function startA()
    if aac then aac:Disconnect() end
    aac=p.Idled:Connect(function()
        if A then vu:CaptureController() vu:ClickButton2(Vector2.new()) end
    end)
end

-- No Gravity
local ngf
local function setNG(on)
    if on and p.Character then
        local hrp=p.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            if ngf then ngf:Destroy() end
            ngf=Instance.new("BodyForce",hrp)
            ngf.Force=Vector3.new(0,workspace.Gravity*hrp.AssemblyMass,0)
        end
    else
        if ngf then ngf:Destroy() ngf=nil end
    end
end

-- Click TP
local ctc
local function startCC()
    if ctc then ctc:Disconnect() end
    ctc=u.InputBegan:Connect(function(i)
        if not CC then return end
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            local mouse=u:GetMouseLocation()
            local ray=workspace.CurrentCamera:ViewportPointToRay(mouse.X,mouse.Y)
            local params=RaycastParams.new()
            params.FilterType=Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances={p.Character}
            local res=workspace:Raycast(ray.Origin,ray.Direction*500,params)
            if res and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame=CFrame.new(res.Position+Vector3.new(0,4,0)) end
            end
        end
    end)
end

-- Ghost Trail
local trailParts={}
local gtc
local function setGR(on)
    if on then
        if gtc then gtc:Disconnect() end
        gtc=r.Heartbeat:Connect(function()
            if not GR or not p.Character then return end
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local ghost=Instance.new("Part")
            ghost.Size=Vector3.new(2,3,1) ghost.CanCollide=false
            ghost.Anchored=true ghost.Material=Enum.Material.Neon
            ghost.Color=Color3.fromHSV(tick()%5/5,1,1)
            ghost.CFrame=hrp.CFrame
            ghost.Parent=workspace
            table.insert(trailParts,ghost)
            task.delay(1,function()
                if ghost and ghost.Parent then ghost:Destroy() end
                for i,v in ipairs(trailParts) do if v==ghost then table.remove(trailParts,i) break end end
            end)
        end)
    else
        if gtc then gtc:Disconnect() gtc=nil end
        for _,gr in pairs(trailParts) do if gr and gr.Parent then gr:Destroy() end end
        trailParts={}
    end
end

-- Spin Player
local spc
local function setSP(on)
    if on then
        if spc then spc:Disconnect() end
        spc=r.RenderStepped:Connect(function()
            if not SP or not p.Character then return end
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame=hrp.CFrame*CFrame.Angles(0,math.rad(5),0) end
        end)
    else
        if spc then spc:Disconnect() spc=nil end
    end
end

-- Teleport To Player
local tpc
local function startTP()
    if tpc then tpc:Disconnect() end
    tpc=u.InputBegan:Connect(function(i)
        if not TP then return end
        if i.KeyCode==Enum.KeyCode.E then
            local closest,dist=nil,math.huge
            for _,pl in pairs(game.Players:GetPlayers()) do
                if pl~=p and pl.Character then
                    local hrp=pl.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local d=(hrp.Position-p.Character.HumanoidRootPart.Position).Magnitude
                        if d<dist then dist=d closest=hrp end
                    end
                end
            end
            if closest and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame=CFrame.new(closest.Position+Vector3.new(0,3,0)) end
            end
        end
    end)
end

-- Float
local flc
local function setFL(on)
    if on then
        if flc then flc:Disconnect() end
        flc=r.Heartbeat:Connect(function()
            if not FL or not p.Character then return end
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Velocity=Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z) end
        end)
    else
        if flc then flc:Disconnect() flc=nil end
    end
end

-- Bhop
local bhc
local function startBH()
    if bhc then bhc:Disconnect() end
    bhc=r.Heartbeat:Connect(function()
        if not BH or not p.Character then return end
        local h=p.Character:FindFirstChildOfClass("Humanoid")
        if h and h.MoveDirection.Magnitude>0 and h:GetState()==Enum.HumanoidStateType.Running then
            h:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

-- Long Strafe
local lsc
local function setLS(on)
    if on then
        if lsc then lsc:Disconnect() end
        lsc=r.Heartbeat:Connect(function()
            if not LS or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then
                local md=h.MoveDirection
                if math.abs(md.X)>0.3 and math.abs(md.Z)>0.3 then
                    if h.WalkSpeed<sp*1.3 then h.WalkSpeed=sp*1.3 end
                end
            end
        end)
    else
        if lsc then lsc:Disconnect() lsc=nil end
    end
end

-- High Ping TP
local hpc
local function startHP()
    if hpc then hpc:Disconnect() end
    hpc=r.Heartbeat:Connect(function()
        if not HP or not p.Character then return end
        local hrp=p.Character:FindFirstChild("HumanoidRootPart")
        if hrp and hrp.Velocity.Magnitude>500 then
            hrp.Velocity=hrp.Velocity*0.3
        end
    end)
end

-- No Fall Damage
local function setNF(on)
    if p.Character then
        local h=p.Character:FindFirstChildOfClass("Humanoid")
        if h then h:SetStateEnabled(Enum.HumanoidStateType.FallingDown,not on) end
    end
end

-- No Clip Camera
local ncc2
local function setNC(on)
    if on then
        if ncc2 then ncc2:Disconnect() end
        ncc2=r.RenderStepped:Connect(function()
            if not NC then return end
            local cam=workspace.CurrentCamera
            if cam then cam.CameraSubject=workspace end
        end)
    else
        if ncc2 then ncc2:Disconnect() ncc2=nil end
        if workspace.CurrentCamera and p.Character then
            workspace.CurrentCamera.CameraSubject=p.Character:FindFirstChildOfClass("Humanoid")
        end
    end
end

-- == НОВЫЕ МЕХАНИКИ ==

-- Auto Farm (собирает предметы рядом)
local afc
local function setAF(on)
    if on then
        if afc then afc:Disconnect() end
        afc=r.Heartbeat:Connect(function()
            if not AF or not p.Character then return end
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            for _,obj in pairs(ws:GetChildren()) do
                if obj:IsA("BasePart") and obj.Name~="Baseplate" then
                    local d=(obj.Position-hrp.Position).Magnitude
                    if d<20 and obj.CanCollide then
                        ts:Create(hrp,TweenInfo.new(0.1),{CFrame=CFrame.new(obj.Position+Vector3.new(0,3,0))}):Play()
                        break
                    end
                end
            end
        end)
    else
        if afc then afc:Disconnect() afc=nil end
    end
end

-- Spin Bot (крутит камеру)
local sbc
local function setSB(on)
    if on then
        if sbc then sbc:Disconnect() end
        sbc=r.RenderStepped:Connect(function()
            if not SB then return end
            local cam=workspace.CurrentCamera
            if cam then
                cam.CFrame=cam.CFrame*CFrame.Angles(0,math.rad(15),0)
            end
        end)
    else
        if sbc then sbc:Disconnect() sbc=nil end
    end
end

-- Auto Dodge (уклонение)
local adc
local function setAD(on)
    if on then
        if adc then adc:Disconnect() end
        adc=r.Heartbeat:Connect(function()
            if not AD or not p.Character then return end
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            for _,pl in pairs(game.Players:GetPlayers()) do
                if pl~=p and pl.Character then
                    local thrp=pl.Character:FindFirstChild("HumanoidRootPart")
                    if thrp then
                        local d=(thrp.Position-hrp.Position).Magnitude
                        if d<15 then
                            local dir=(hrp.Position-thrp.Position).Unit
                            hrp.CFrame=hrp.CFrame+dir*2
                        end
                    end
                end
            end
        end)
    else
        if adc then adc:Disconnect() adc=nil end
    end
end

-- Wall Hop
local whc
local function setWH(on)
    if on then
        if whc then whc:Disconnect() end
        whc=u.JumpRequest:Connect(function()
            if not WH or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if h and hrp then
                local ray=workspace:Raycast(hrp.Position,hrp.CFrame.LookVector*3)
                if ray then
                    hrp.Velocity=hrp.Velocity+ray.Normal*30+Vector3.new(0,40,0)
                end
            end
        end)
    else
        if whc then whc:Disconnect() whc=nil end
    end
end

-- Speed Glitch (ускорение через смену состояния)
local sgc
local function setSG(on)
    if on then
        if sgc then sgc:Disconnect() end
        sgc=r.Heartbeat:Connect(function()
            if not SG or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then
                h:ChangeState(Enum.HumanoidStateType.Running)
                if h.WalkSpeed<sp*2 then h.WalkSpeed=sp*2 end
            end
        end)
    else
        if sgc then sgc:Disconnect() sgc=nil end
    end
end

-- Jump Boost (прыжок в воздухе без задержки)
local jbc
local function setJB(on)
    if on then
        if jbc then jbc:Disconnect() end
        jbc=u.JumpRequest:Connect(function()
            if not JB or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    else
        if jbc then jbc:Disconnect() jbc=nil end
    end
end

-- Truss Glitch
local tgc
local function setTG(on)
    if on then
        if tgc then tgc:Disconnect() end
        tgc=r.Heartbeat:Connect(function()
            if not TG or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then
                local state=h:GetState()
                if state==Enum.HumanoidStateType.Climbing then
                    local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then hrp.Velocity=Vector3.new(0,50,0) end
                end
            end
        end)
    else
        if tgc then tgc:Disconnect() tgc=nil end
    end
end

-- Anti Ragdoll
local arc
local function setAR(on)
    if on then
        if arc then arc:Disconnect() end
        arc=r.Heartbeat:Connect(function()
            if not AR or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then
                h:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
                h:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
            end
        end)
    else
        if arc then arc:Disconnect() arc=nil end
        if p.Character then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then
                h:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
                h:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
            end
        end
    end
end

-- Anti Noclip (для тебя — не даёт другим применить noclip к тебе)
local anc
local function setAN(on)
    if on then
        if anc then anc:Disconnect() end
        anc=r.Heartbeat:Connect(function()
            if not AN or not p.Character then return end
            for _,v in pairs(p.Character:GetDescendants()) do
                if v:IsA("BasePart") and not v.CanCollide then
                    v.CanCollide=true
                end
            end
        end)
    else
        if anc then anc:Disconnect() anc=nil end
    end
end

-- Fling (отбрасывает игроков)
local fpc
local function setFP(on)
    if on then
        if fpc then fpc:Disconnect() end
        fpc=r.Heartbeat:Connect(function()
            if not FP or not p.Character then return end
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            for _,pl in pairs(game.Players:GetPlayers()) do
                if pl~=p and pl.Character then
                    local thrp=pl.Character:FindFirstChild("HumanoidRootPart")
                    if thrp then
                        local d=(thrp.Position-hrp.Position).Magnitude
                        if d<10 then
                            local bav=Instance.new("BodyAngularVelocity",thrp)
                            bav.MaxTorque=Vector3.new(9e9,9e9,9e9)
                            bav.AngularVelocity=Vector3.new(9999,9999,9999)
                            task.delay(0.5,function() if bav then bav:Destroy() end end)
                        end
                    end
                end
            end
        end)
    else
        if fpc then fpc:Disconnect() fpc=nil end
    end
end

-- Auto Parry (защита от ударов)
local apc
local function setAP(on)
    if on then
        if apc then apc:Disconnect() end
        apc=r.Heartbeat:Connect(function()
            if not AP or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then
                h:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
                h:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
            end
        end)
    else
        if apc then apc:Disconnect() apc=nil end
    end
end

-- Trap Player
local trc
local function setTR(on)
    if on then
        if trc then trc:Disconnect() end
        trc=u.InputBegan:Connect(function(i)
            if not TR then return end
            if i.KeyCode==Enum.KeyCode.T then
                for _,pl in pairs(game.Players:GetPlayers()) do
                    if pl~=p and pl.Character then
                        local hrp=pl.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local trap=Instance.new("Part")
                            trap.Size=Vector3.new(10,1,10)
                            trap.Anchored=true
                            trap.CanCollide=true
                            trap.CFrame=hrp.CFrame*CFrame.new(0,-3,0)
                            trap.Parent=workspace
                            task.delay(5,function() if trap then trap:Destroy() end end)
                        end
                    end
                end
            end
        end)
    else
        if trc then trc:Disconnect() trc=nil end
    end
end

-- Freeze Player (локально)
local frc
local function setFR(on)
    if on and p.Character then
        local hrp=p.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Anchored=true
        end
    else
        if p.Character then
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Anchored=false end
        end
        if frc then frc:Disconnect() frc=nil end
    end
end

-- Sit Glitch (телепорт через сидение)
local sic
local function setSI(on)
    if on then
        if sic then sic:Disconnect() end
        sic=r.Heartbeat:Connect(function()
            if not SI or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h and h.Sit then
                h.Sit=false
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame=hrp.CFrame+Vector3.new(0,10,0) end
            end
        end)
    else
        if sic then sic:Disconnect() sic=nil end
    end
end

-- == ВИЗУАЛ ==
local oAmb,oBr,oCl,oOut
local function setFB(on)
    if on then
        oAmb=l.Ambient oBr=l.Brightness oCl=l.ClockTime oOut=l.OutdoorAmbient
        l.Ambient=Color3.fromRGB(178,178,178) l.Brightness=3 l.ClockTime=12 l.OutdoorAmbient=Color3.fromRGB(178,178,178)
    else
        if oAmb then l.Ambient=oAmb end
        if oBr then l.Brightness=oBr end
        if oCl then l.ClockTime=oCl end
        if oOut then l.OutdoorAmbient=oOut end
    end
end

local oFc,oFe,oFs
local function setRF(on)
    if on then
        oFc=l.FogColor oFe=l.FogEnd oFs=l.FogStart
        l.FogColor=Color3.fromRGB(255,255,255) l.FogEnd=1e6 l.FogStart=1e6
    else
        if oFc then l.FogColor=oFc end
        if oFe then l.FogEnd=oFe end
        if oFs then l.FogStart=oFs end
    end
end

local ehl={}
local function setESP(on)
    if on then
        for _,pl in pairs(game.Players:GetPlayers()) do
            if pl~=p and pl.Character then
                local hl=Instance.new("Highlight")
                hl.FillColor=Color3.fromRGB(255,50,50)
                hl.OutlineColor=Color3.fromRGB(255,255,255)
                hl.Parent=pl.Character
                ehl[pl]=hl
            end
        end
    else
        for pl,hl in pairs(ehl) do if hl then hl:Destroy() end end
        ehl={}
    end
end

game.Players.PlayerAdded:Connect(function(pl)
    pl.CharacterAdded:Connect(function(c)
        if E and pl~=p then
            local hl=Instance.new("Highlight")
            hl.FillColor=Color3.fromRGB(255,50,50)
            hl.OutlineColor=Color3.fromRGB(255,255,255)
            hl.Parent=c
            ehl[pl]=hl
        end
    end)
end)

local aac2
local function startAA()
    if aac2 then aac2:Disconnect() end
    aac2=r.RenderStepped:Connect(function()
        if not AA or not p.Character then return end
        local cam=workspace.CurrentCamera
        if not cam then return end
        local closest,dist=nil,math.huge
        for _,pl in pairs(game.Players:GetPlayers()) do
            if pl~=p and pl.Character then
                local hrp=pl.Character:FindFirstChild("HumanoidRootPart")
                if hrp and p.Character:FindFirstChild("HumanoidRootPart") then
                    local d=(hrp.Position-p.Character.HumanoidRootPart.Position).Magnitude
                    if d<dist then dist=d closest=hrp end
                end
            end
        end
        if closest and dist<(fa*10) then
            local newCF=CFrame.new(cam.CFrame.Position,closest.Position)
            cam.CFrame=cam.CFrame:Lerp(newCF,0.15)
        end
    end)
end

local xrParts={}
local function setXR(on)
    if on then
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Transparency<1 then
                if not p.Character or not v:IsDescendantOf(p.Character) then
                    xrParts[v]=v.Transparency
                    v.Transparency=0.7
                end
            end
        end
    else
        for v,tr in pairs(xrParts) do
            if v and v.Parent then v.Transparency=tr end
        end
        xrParts={}
    end
end

local invParts={}
local function setINV(on)
    if on and p.Character then
        for _,v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then
                invParts[v]=v.Transparency
                v.Transparency=1
            end
            if v:IsA("Decal") then
                invParts[v]=v.Transparency
                v.Transparency=1
            end
        end
    else
        for v,tr in pairs(invParts) do
            if v and v.Parent then v.Transparency=tr end
        end
        invParts={}
    end
end

local skelParts={}
local skc
local function setSK(on)
    if on then
        if skc then skc:Disconnect() end
        skc=r.Heartbeat:Connect(function()
            if not SK then return end
            for _,pl in pairs(game.Players:GetPlayers()) do
                if pl~=p and pl.Character then
                    local hrp=pl.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and not skelParts[pl] then
                        local box=Instance.new("BoxHandleAdornment")
                        box.Size=Vector3.new(2,5,1)
                        box.Adornee=hrp
                        box.AlwaysOnTop=true
                        box.ZIndex=5
                        box.Transparency=0.5
                        box.Color3=Color3.fromRGB(0,255,0)
                        box.Parent=hrp
                        skelParts[pl]=box
                    end
                end
            end
        end)
    else
        if skc then skc:Disconnect() skc=nil end
        for _,v in pairs(skelParts) do if v and v.Parent then v:Destroy() end end
        skelParts={}
    end
end

local function setFM(on)
    if p.Character then
        local h=p.Character:FindFirstChildOfClass("Humanoid")
        if h then h.CameraMode=on and Enum.CameraMode.LockFirstPerson or Enum.CameraMode.Classic end
    end
end

local ghc
local function setGH(on)
    if on and p.Character then
        for _,v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.Transparency=0.5 end
        end
        if ghc then ghc:Disconnect() end
        ghc=r.Heartbeat:Connect(function()
            if not GH or not p.Character then return end
            for _,v in pairs(p.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.Transparency=0.5 end
            end
        end)
    else
        if ghc then ghc:Disconnect() ghc=nil end
        if p.Character then
            for _,v in pairs(p.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then v.Transparency=0 end
            end
        end
    end
end

-- == РАЗНОЕ ==
local ilc
local function setIL(on)
    if on then
        if ilc then ilc:Disconnect() end
        ilc=r.Heartbeat:Connect(function()
            if not IL then return end
            if p:FindFirstChild("PlayerGui") then p.PlayerGui.Enabled=true end
        end)
    else
        if ilc then ilc:Disconnect() ilc=nil end
    end
end

local wtc
local function setWT(on)
    if on then
        if wtc then wtc:Disconnect() end
        wtc=r.Heartbeat:Connect(function()
            if not WT or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then h:SetStateEnabled(Enum.HumanoidStateType.Swimming,false) end
        end)
    else
        if wtc then wtc:Disconnect() wtc=nil end
        if p.Character then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then h:SetStateEnabled(Enum.HumanoidStateType.Swimming,true) end
        end
    end
end

local itc
local function setIT(on)
    if on then
        if itc then itc:Disconnect() end
        itc=r.Heartbeat:Connect(function()
            if not IT or not p.Character then return end
            local bp=p:FindFirstChild("Backpack")
            if bp then
                for _,tool in pairs(bp:GetChildren()) do
                    if tool:IsA("Tool") then tool.Parent=p.Character end
                end
            end
        end)
    else
        if itc then itc:Disconnect() itc=nil end
    end
end

local msc
local function setMS(on)
    if on then
        if msc then msc:Disconnect() end
        msc=r.Heartbeat:Connect(function()
            if not MS then return end
            pcall(function() vu:CaptureController() vu:ClickButton1(Vector2.new()) end)
        end)
    else
        if msc then msc:Disconnect() msc=nil end
    end
end

local ftc,ftAttach
local function setFT(on)
    if on and p.Character then
        local hrp=p.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            if ftc then ftc:Destroy() end
            if ftAttach then ftAttach:Destroy() end
            ftAttach=Instance.new("Attachment",hrp)
            local trail=Instance.new("Trail",hrp)
            trail.Attachment0=ftAttach
            trail.Lifetime=2
            trail.Color=ColorSequence.new(Color3.fromHSV(tick()%5/5,1,1),Color3.fromHSV((tick()+1)%5/5,1,1))
            ftc=trail
        end
    else
        if ftc then ftc:Destroy() ftc=nil end
        if ftAttach then ftAttach:Destroy() ftAttach=nil end
    end
end

local wsc
local function setWS2(on)
    if on then
        if wsc then wsc:Disconnect() end
        wsc=r.Heartbeat:Connect(function()
            if not WS2 or not p.Character then return end
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h and h:GetState()==Enum.HumanoidStateType.Swimming then
                if h.WalkSpeed~=sp*1.5 then h.WalkSpeed=sp*1.5 end
            end
        end)
    else
        if wsc then wsc:Disconnect() wsc=nil end
    end
end

local rbc
local function setRR(on)
    if on then
        if rbc then rbc:Disconnect() end
        rbc=r.Heartbeat:Connect(function()
            if not RR or not p.Character then return end
            for _,v in pairs(p.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.Color=Color3.fromHSV(tick()%5/5,1,1) end
            end
        end)
    else
        if rbc then rbc:Disconnect() rbc=nil end
    end
end

local csc
local function setCB(on)
    if on then
        if csc then csc:Disconnect() end
        csc=u.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
                local s=Instance.new("Sound")
                s.SoundId="rbxassetid://131237241"
                s.Volume=0.5
                s.Parent=workspace
                s:Play()
                task.delay(2,function() if s then s:Destroy() end end)
            end
        end)
    else
        if csc then csc:Disconnect() csc=nil end
    end
end

-- Respawn (восстанавливаем всё после смерти)
p.CharacterAdded:Connect(function(c)
    task.wait(0.5)
    local h=c:FindFirstChildOfClass("Humanoid")
    if not h then return end
    if N then for _,v in pairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end
    if S then h.WalkSpeed=sp end
    if J then h.JumpPower=jp h.UseJumpPower=true end
    if NG then task.wait(0.1) setNG(true) end
    if FM then h.CameraMode=Enum.CameraMode.LockFirstPerson end
    if F then startF() end
end)

-- == ОБРАБОТЧИКИ ==
bF.MouseButton1Click:Connect(function() F=not F bF.Text="Fly: "..(F and "ВКЛ" or "ВЫКЛ") bF.BackgroundColor3=F and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if F then startF() else stopF() end end)
bS.MouseButton1Click:Connect(function() S=not S bS.Text="Speed: "..(S and "ВКЛ" or "ВЫКЛ") bS.BackgroundColor3=S and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if p.Character then local h=p.Character:FindFirstChildOfClass("Humanoid") if h then h.WalkSpeed=S and sp or 16 end end end)
bJ.MouseButton1Click:Connect(function() J=not J bJ.Text="Jump: "..(J and "ВКЛ" or "ВЫКЛ") bJ.BackgroundColor3=J and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if p.Character then local h=p.Character:FindFirstChildOfClass("Humanoid") if h then h.JumpPower=J and jp or 50 h.UseJumpPower=true end end end)
bN.MouseButton1Click:Connect(function() N=not N bN.Text="Noclip: "..(N and "ВКЛ" or "ВЫКЛ") bN.BackgroundColor3=N and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if p.Character then for _,v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=not N end end end end)
bI.MouseButton1Click:Connect(function() I=not I bI.Text="Inf Jump: "..(I and "ВКЛ" or "ВЫКЛ") bI.BackgroundColor3=I and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if I then startI() end end)
bA.MouseButton1Click:Connect(function() A=not A bA.Text="Anti-AFK: "..(A and "ВКЛ" or "ВЫКЛ") bA.BackgroundColor3=A and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if A then startA() end end)
bNG.MouseButton1Click:Connect(function() NG=not NG bNG.Text="No Gravity: "..(NG and "ВКЛ" or "ВЫКЛ") bNG.BackgroundColor3=NG and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setNG(NG) end)
bCC.MouseButton1Click:Connect(function() CC=not CC bCC.Text="Click TP: "..(CC and "ВКЛ" or "ВЫКЛ") bCC.BackgroundColor3=CC and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if CC then startCC() end end)
bGR.MouseButton1Click:Connect(function() GR=not GR bGR.Text="Ghost Trail: "..(GR and "ВКЛ" or "ВЫКЛ") bGR.BackgroundColor3=GR and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setGR(GR) end)
bSP.MouseButton1Click:Connect(function() SP=not SP bSP.Text="Spin Player: "..(SP and "ВКЛ" or "ВЫКЛ") bSP.BackgroundColor3=SP and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setSP(SP) end)
bTP.MouseButton1Click:Connect(function() TP=not TP bTP.Text="Teleport: "..(TP and "ВКЛ" or "ВЫКЛ") bTP.BackgroundColor3=TP and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if TP then startTP() end end)
bFL.MouseButton1Click:Connect(function() FL=not FL bFL.Text="Float: "..(FL and "ВКЛ" or "ВЫКЛ") bFL.BackgroundColor3=FL and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setFL(FL) end)
bBH.MouseButton1Click:Connect(function() BH=not BH bBH.Text="Bhop: "..(BH and "ВКЛ" or "ВЫКЛ") bBH.BackgroundColor3=BH and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if BH then startBH() end end)
bLS.MouseButton1Click:Connect(function() LS=not LS bLS.Text="Long Strafe: "..(LS and "ВКЛ" or "ВЫКЛ") bLS.BackgroundColor3=LS and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setLS(LS) end)
bHP.MouseButton1Click:Connect(function() HP=not HP bHP.Text="High Ping: "..(HP and "ВКЛ" or "ВЫКЛ") bHP.BackgroundColor3=HP and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if HP then startHP() end end)
bNF.MouseButton1Click:Connect(function() NF=not NF bNF.Text="No Fall Dmg: "..(NF and "ВКЛ" or "ВЫКЛ") bNF.BackgroundColor3=NF and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setNF(NF) end)
bNC.MouseButton1Click:Connect(function() NC=not NC bNC.Text="No Clip Cam: "..(NC and "ВКЛ" or "ВЫКЛ") bNC.BackgroundColor3=NC and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setNC(NC) end)

bFB.MouseButton1Click:Connect(function() FB=not FB bFB.Text="Fullbright: "..(FB and "ВКЛ" or "ВЫКЛ") bFB.BackgroundColor3=FB and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setFB(FB) end)
bRF.MouseButton1Click:Connect(function() RF=not RF bRF.Text="No Fog: "..(RF and "ВКЛ" or "ВЫКЛ") bRF.BackgroundColor3=RF and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setRF(RF) end)
bE.MouseButton1Click:Connect(function() E=not E bE.Text="ESP: "..(E and "ВКЛ" or "ВЫКЛ") bE.BackgroundColor3=E and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setESP(E) end)
bAA.MouseButton1Click:Connect(function() AA=not AA bAA.Text="Aim Assist: "..(AA and "ВКЛ" or "ВЫКЛ") bAA.BackgroundColor3=AA and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if AA then startAA() end end)
bXR.MouseButton1Click:Connect(function() XR=not XR bXR.Text="X-Ray: "..(XR and "ВКЛ" or "ВЫКЛ") bXR.BackgroundColor3=XR and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setXR(XR) end)
bINV.MouseButton1Click:Connect(function() INV=not INV bINV.Text="Invisible: "..(INV and "ВКЛ" or "ВЫКЛ") bINV.BackgroundColor3=INV and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setINV(INV) end)
bSK.MouseButton1Click:Connect(function() SK=not SK bSK.Text="Skeleton ESP: "..(SK and "ВКЛ" or "ВЫКЛ") bSK.BackgroundColor3=SK and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setSK(SK) end)
bFM.MouseButton1Click:Connect(function() FM=not FM bFM.Text="First Person: "..(FM and "ВКЛ" or "ВЫКЛ") bFM.BackgroundColor3=FM and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setFM(FM) end)
bGH.MouseButton1Click:Connect(function() GH=not GH bGH.Text="Ghost Mode: "..(GH and "ВКЛ" or "ВЫКЛ") bGH.BackgroundColor3=GH and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setGH(GH) end)

-- Механики
bAF.MouseButton1Click:Connect(function() AF=not AF bAF.Text="Auto Farm: "..(AF and "ВКЛ" or "ВЫКЛ") bAF.BackgroundColor3=AF and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setAF(AF) end)
bSB.MouseButton1Click:Connect(function() SB=not SB bSB.Text="Spin Bot: "..(SB and "ВКЛ" or "ВЫКЛ") bSB.BackgroundColor3=SB and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setSB(SB) end)
bAD.MouseButton1Click:Connect(function() AD=not AD bAD.Text="Auto Dodge: "..(AD and "ВКЛ" or "ВЫКЛ") bAD.BackgroundColor3=AD and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setAD(AD) end)
bWH.MouseButton1Click:Connect(function() WH=not WH bWH.Text="Wall Hop: "..(WH and "ВКЛ" or "ВЫКЛ") bWH.BackgroundColor3=WH and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setWH(WH) end)
bSG.MouseButton1Click:Connect(function() SG=not SG bSG.Text="Speed Glitch: "..(SG and "ВКЛ" or "ВЫКЛ") bSG.BackgroundColor3=SG and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setSG(SG) end)
bJB.MouseButton1Click:Connect(function() JB=not JB bJB.Text="Jump Boost: "..(JB and "ВКЛ" or "ВЫКЛ") bJB.BackgroundColor3=JB and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setJB(JB) end)
bTG.MouseButton1Click:Connect(function() TG=not TG bTG.Text="Truss Glitch: "..(TG and "ВКЛ" or "ВЫКЛ") bTG.BackgroundColor3=TG and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setTG(TG) end)
bAR.MouseButton1Click:Connect(function() AR=not AR bAR.Text="Anti Ragdoll: "..(AR and "ВКЛ" or "ВЫКЛ") bAR.BackgroundColor3=AR and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setAR(AR) end)
bAN.MouseButton1Click:Connect(function() AN=not AN bAN.Text="Anti Noclip: "..(AN and "ВКЛ" or "ВЫКЛ") bAN.BackgroundColor3=AN and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setAN(AN) end)
bFP.MouseButton1Click:Connect(function() FP=not FP bFP.Text="Fling: "..(FP and "ВКЛ" or "ВЫКЛ") bFP.BackgroundColor3=FP and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setFP(FP) end)
bAP.MouseButton1Click:Connect(function() AP=not AP bAP.Text="Auto Parry: "..(AP and "ВКЛ" or "ВЫКЛ") bAP.BackgroundColor3=AP and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setAP(AP) end)
bTR.MouseButton1Click:Connect(function() TR=not TR bTR.Text="Trap Player: "..(TR and "ВКЛ" or "ВЫКЛ") bTR.BackgroundColor3=TR and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) if TR then setTR(TR) end end)
bFR.MouseButton1Click:Connect(function() FR=not FR bFR.Text="Freeze Player: "..(FR and "ВКЛ" or "ВЫКЛ") bFR.BackgroundColor3=FR and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setFR(FR) end)
bSI.MouseButton1Click:Connect(function() SI=not SI bSI.Text="Sit Glitch: "..(SI and "ВКЛ" or "ВЫКЛ") bSI.BackgroundColor3=SI and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setSI(SI) end)

-- Разное
bIL.MouseButton1Click:Connect(function() IL=not IL bIL.Text="Anti-Kick: "..(IL and "ВКЛ" or "ВЫКЛ") bIL.BackgroundColor3=IL and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setIL(IL) end)
bWT.MouseButton1Click:Connect(function() WT=not WT bWT.Text="Walk on Water: "..(WT and "ВКЛ" or "ВЫКЛ") bWT.BackgroundColor3=WT and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setWT(WT) end)
bIT.MouseButton1Click:Connect(function() IT=not IT bIT.Text="Infinite Tools: "..(IT and "ВКЛ" or "ВЫКЛ") bIT.BackgroundColor3=IT and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setIT(IT) end)
bMS.MouseButton1Click:Connect(function() MS=not MS bMS.Text="Auto Click: "..(MS and "ВКЛ" or "ВЫКЛ") bMS.BackgroundColor3=MS and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setMS(MS) end)
bFT.MouseButton1Click:Connect(function() FT=not FT bFT.Text="Fly Trail: "..(FT and "ВКЛ" or "ВЫКЛ") bFT.BackgroundColor3=FT and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setFT(FT) end)
bWS2.MouseButton1Click:Connect(function() WS2=not WS2 bWS2.Text="Water Speed: "..(WS2 and "ВКЛ" or "ВЫКЛ") bWS2.BackgroundColor3=WS2 and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setWS2(WS2) end)
bRR.MouseButton1Click:Connect(function() RR=not RR bRR.Text="Rainbow Body: "..(RR and "ВКЛ" or "ВЫКЛ") bRR.BackgroundColor3=RR and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setRR(RR) end)
bCB.MouseButton1Click:Connect(function() CB=not CB bCB.Text="Click Sound: "..(CB and "ВКЛ" or "ВЫКЛ") bCB.BackgroundColor3=CB and Color3.fromRGB(0,130,70) or Color3.fromRGB(28,28,42) setCB(CB) end)

-- Вкладки
local function setTab(name)
    local all={bF,bS,bJ,bN,bI,bA,bNG,bCC,bGR,bSP,bTP,bFL,bBH,bLS,bHP,bNF,bNC,bFB,bRF,bE,bAA,bXR,bINV,bSK,bFM,bGH,bAF,bSB,bAD,bWH,bSG,bJB,bTG,bAR,bAN,bFP,bAP,bTR,bFR,bSI,bIL,bWT,bIT,bMS,bFT,bWS2,bRR,bCB}
    for _,b in pairs(all) do b.Visible=false end
    if name=="move" then
        tabMove.BackgroundColor3=Color3.fromRGB(0,150,200); tabMove.TextColor3=Color3.fromRGB(255,255,255)
        tabVis.BackgroundColor3=Color3.fromRGB(30,30,45); tabVis.TextColor3=Color3.fromRGB(180,180,200)
        tabFun.BackgroundColor3=Color3.fromRGB(30,30,45); tabFun.TextColor3=Color3.fromRGB(180,180,200)
        tabMisc.BackgroundColor3=Color3.fromRGB(30,30,45); tabMisc.TextColor3=Color3.fromRGB(180,180,200)
        for _,b in pairs({bF,bS,bJ,bN,bI,bA,bNG,bCC,bGR,bSP,bTP,bFL,bBH,bLS,bHP,bNF,bNC}) do b.Visible=true end
    elseif name=="vis" then
        tabVis.BackgroundColor3=Color3.fromRGB(0,150,200); tabVis.TextColor3=Color3.fromRGB(255,255,255)
        tabMove.BackgroundColor3=Color3.fromRGB(30,30,45); tabMove.TextColor3=Color3.fromRGB(180,180,200)
        tabFun.BackgroundColor3=Color3.fromRGB(30,30,45); tabFun.TextColor3=Color3.fromRGB(180,180,200)
        tabMisc.BackgroundColor3=Color3.fromRGB(30,30,45); tabMisc.TextColor3=Color3.fromRGB(180,180,200)
        for _,b in pairs({bFB,bRF,bE,bAA,bXR,bINV,bSK,bFM,bGH}) do b.Visible=true end
    elseif name=="fun" then
        tabFun.BackgroundColor3=Color3.fromRGB(0,150,200); tabFun.TextColor3=Color3.fromRGB(255,255,255)
        tabMove.BackgroundColor3=Color3.fromRGB(30,30,45); tabMove.TextColor3=Color3.fromRGB(180,180,200)
        tabVis.BackgroundColor3=Color3.fromRGB(30,30,45); tabVis.TextColor3=Color3.fromRGB(180,180,200)
        tabMisc.BackgroundColor3=Color3.fromRGB(30,30,45); tabMisc.TextColor3=Color3.fromRGB(180,180,200)
        for _,b in pairs({bAF,bSB,bAD,bWH,bSG,bJB,bTG,bAR,bAN,bFP,bAP,bTR,bFR,bSI}) do b.Visible=true end
    else
        tabMisc.BackgroundColor3=Color3.fromRGB(0,150,200); tabMisc.TextColor3=Color3.fromRGB(255,255,255)
        tabMove.BackgroundColor3=Color3.fromRGB(30,30,45); tabMove.TextColor3=Color3.fromRGB(180,180,200)
        tabVis.BackgroundColor3=Color3.fromRGB(30,30,45); tabVis.TextColor3=Color3.fromRGB(180,180,200)
        tabFun.BackgroundColor3=Color3.fromRGB(30,30,45); tabFun.TextColor3=Color3.fromRGB(180,180,200)
        for _,b in pairs({bIL,bWT,bIT,bMS,bFT,bWS2,bRR,bCB}) do b.Visible=true end
    end
end

tabMove.MouseButton1Click:Connect(function() setTab("move") end)
tabVis.MouseButton1Click:Connect(function() setTab("vis") end)
tabFun.MouseButton1Click:Connect(function() setTab("fun") end)
tabMisc.MouseButton1Click:Connect(function() setTab("misc") end)
setTab("move")

-- Перетаскивание M
local dm,ds,dp,mv=false,nil,nil,false
m.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then dm=true mv=false ds=i.Position dp=m.Position end end)
u.InputChanged:Connect(function(i)
    if dm and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then
        local d=i.Position-ds
        if math.abs(d.X)>5 or math.abs(d.Y)>5 then mv=true end
        m.Position=UDim2.new(dp.X.Scale,dp.X.Offset+d.X,dp.Y.Scale,dp.Y.Offset+d.Y)
    end
end)
u.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
        if dm and not mv then f.Visible=true m.Visible=false end
        dm=false
    end
end)

hb.MouseButton1Click:Connect(function() f.Visible=false m.Visible=true end)

kb.MouseButton1Click:Connect(function()
    F,S,J,N,I,A,FB,RF,E,NG,CC,AA,XR,GR,INV,SP,TP,FL,SK,CB,FM,GH=false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false
    BH,LS,HP,NF,NC,IL,WT,IT,MS,FT,WS2,RR=false,false,false,false,false,false,false,false,false,false,false,false
    AF,SB,AD,WH,SG,JB,TG,AR,AN,FP,AP,TR,FR,SI=false,false,false,false,false,false,false,false,false,false,false,false,false,false
    if fc then fc:Disconnect() end
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
    if ijc then ijc:Disconnect() end
    if aac then aac:Disconnect() end
    if ngf then ngf:Destroy() end
    if ctc then ctc:Disconnect() end
    if aac2 then aac2:Disconnect() end
    if gtc then gtc:Disconnect() end
    if spc then spc:Disconnect() end
    if tpc then tpc:Disconnect() end
    if flc then flc:Disconnect() end
    if bhc then bhc:Disconnect() end
    if lsc then lsc:Disconnect() end
    if hpc then hpc:Disconnect() end
    if ncc2 then ncc2:Disconnect() end
    if ilc then ilc:Disconnect() end
    if wtc then wtc:Disconnect() end
    if itc then itc:Disconnect() end
    if msc then msc:Disconnect() end
    if ftc then ftc:Destroy() end
    if ftAttach then ftAttach:Destroy() end
    if wsc then wsc:Disconnect() end
    if rbc then rbc:Disconnect() end
    if csc then csc:Disconnect() end
    if ghc then ghc:Disconnect() end
    if afc then afc:Disconnect() end
    if sbc then sbc:Disconnect() end
    if adc then adc:Disconnect() end
    if whc then whc:Disconnect() end
    if sgc then sgc:Disconnect() end
    if jbc then jbc:Disconnect() end
    if tgc then tgc:Disconnect() end
    if arc then arc:Disconnect() end
    if anc then anc:Disconnect() end
    if fpc then fpc:Disconnect() end
    if apc then apc:Disconnect() end
    if trc then trc:Disconnect() end
    if frc then frc:Disconnect() end
    if sic then sic:Disconnect() end
    for pl,hl in pairs(ehl) do if hl then hl:Destroy() end end
    for v,tr in pairs(xrParts) do if v and v.Parent then v.Transparency=tr end end
    for _,gr in pairs(trailParts) do if gr and gr.Parent then gr:Destroy() end end
    for _,v in pairs(skelParts) do if v and v.Parent then v:Destroy() end end
    setFB(false) setRF(false) setINV(false) setNF(false)
    if p.Character then
        local h=p.Character:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed=16 h.JumpPower=50 h.CameraMode=Enum.CameraMode.Classic end
        for _,v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide=true v.Anchored=false v.Transparency=(v.Name=="HumanoidRootPart" and 1 or 0) end
        end
    end
    g:Destroy()
end)
