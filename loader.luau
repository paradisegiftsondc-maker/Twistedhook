-- ========================================
-- TWISTEDHOOK v2.3 - Mobile Optimized (Fixed)
-- Roblox Rivals Exploit | Mobile Compatible
-- With FOV Circles for Aimbot
-- ========================================

if not getgenv().TwistedhookLoaded then
    getgenv().TwistedhookLoaded = true
    
    print("[TWISTEDHOOK] Mobile version v2.3 starting...")
    
    -- ==================== CORE SETUP ====================
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Camera = workspace.CurrentCamera
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    
    if setthreadidentity then
        pcall(function() setthreadidentity(2) end)
    end
    
    -- ==================== CONFIGURATION ====================
    local Config = {
        MenuVisible = true,
        ESP = { Enabled = false, Distance = 1000, ShowHealth = true },
        Aimbot = { Enabled = false, Smoothness = 0.15, FOV = 300, SilentAim = true, Strength = 2, ShowFOV = false },
        Movement = { SpeedBoost = false, Speed = 2 },
        AntiDetection = { Randomization = true },
    }
    
    -- ==================== WAIT FOR PLAYERGUI ====================
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
    
    if not PlayerGui then
        print("[TWISTEDHOOK] ERROR: PlayerGui not found")
        return
    end
    
    print("[TWISTEDHOOK] PlayerGui found")
    
    -- ==================== SIMPLE FOV CIRCLE ====================
    local FOVGui = Instance.new("ScreenGui")
    FOVGui.Name = "FOVCircles"
    FOVGui.ResetOnSpawn = false
    FOVGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    FOVGui.Parent = PlayerGui
    
    local FOVCanvas = Instance.new("Frame")
    FOVCanvas.Name = "FOVCanvas"
    FOVCanvas.Size = UDim2.new(1, 0, 1, 0)
    FOVCanvas.BackgroundTransparency = 1
    FOVCanvas.BorderSizePixel = 0
    FOVCanvas.Parent = FOVGui
    
    print("[TWISTEDHOOK] FOV Canvas created")
    
    -- ==================== MAIN UI ====================
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TwistedhookUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui
    
    -- Main Menu Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainMenu"
    MainFrame.Size = UDim2.new(0, 340, 0, 520)
    MainFrame.Position = UDim2.new(0.5, -170, 0.05, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(100, 50, 200)
    UIStroke.Thickness = 2
    UIStroke.Parent = MainFrame
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 55)
    TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.Text = "⚡ TWISTEDHOOK"
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TitleBar
    
    -- Close Button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "CloseBtn"
    CloseBtn.Size = UDim2.new(0, 40, 0, 40)
    CloseBtn.Position = UDim2.new(1, -45, 0, 7.5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 18
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Parent = TitleBar
    
    local CloseBtnCorner = Instance.new("UICorner")
    CloseBtnCorner.CornerRadius = UDim.new(0, 8)
    CloseBtnCorner.Parent = CloseBtn
    
    CloseBtn.MouseEnter:Connect(function()
        CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    end)
    
    CloseBtn.MouseLeave:Connect(function()
        CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end)
    
    -- Scroll Frame
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Name = "ScrollFrame"
    ScrollFrame.Size = UDim2.new(1, 0, 1, -55)
    ScrollFrame.Position = UDim2.new(0, 0, 0, 55)
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.ScrollBarThickness = 6
    ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 80, 220)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 650)
    ScrollFrame.Parent = MainFrame
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 10)
    UIListLayout.Parent = ScrollFrame
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop = UDim.new(0, 10)
    UIPadding.PaddingBottom = UDim.new(0, 10)
    UIPadding.PaddingLeft = UDim.new(0, 10)
    UIPadding.PaddingRight = UDim.new(0, 10)
    UIPadding.Parent = ScrollFrame
    
    print("[TWISTEDHOOK] UI created")
    
    -- ==================== TOGGLE BUTTON FUNCTION ====================
    local function CreateToggleButton(parent, name, icon, callback)
        local Button = Instance.new("TextButton")
        Button.Name = name
        Button.Size = UDim2.new(1, 0, 0, 45)
        Button.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        Button.TextColor3 = Color3.fromRGB(200, 200, 200)
        Button.TextSize = 13
        Button.Font = Enum.Font.GothamSemibold
        Button.Text = icon .. " " .. name
        Button.BorderSizePixel = 0
        Button.Parent = parent
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 8)
        BtnCorner.Parent = Button
        
        local BtnStroke = Instance.new("UIStroke")
        BtnStroke.Color = Color3.fromRGB(80, 40, 150)
        BtnStroke.Thickness = 1
        BtnStroke.Parent = Button
        
        local ToggleIndicator = Instance.new("Frame")
        ToggleIndicator.Name = "Indicator"
        ToggleIndicator.Size = UDim2.new(0, 8, 0, 8)
        ToggleIndicator.Position = UDim2.new(0, 10, 0.5, -4)
        ToggleIndicator.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        ToggleIndicator.BorderSizePixel = 0
        ToggleIndicator.Parent = Button
        
        local IndicatorCorner = Instance.new("UICorner")
        IndicatorCorner.CornerRadius = UDim.new(0, 2)
        IndicatorCorner.Parent = ToggleIndicator
        
        local State = false
        
        local function UpdateButton()
            if State then
                Button.BackgroundColor3 = Color3.fromRGB(100, 40, 200)
                ToggleIndicator.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                Button.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
                ToggleIndicator.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Button.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
        
        Button.MouseButton1Click:Connect(function()
            State = not State
            UpdateButton()
            pcall(function() callback(State) end)
        end)
        
        Button.MouseEnter:Connect(function()
            Button.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
        end)
        
        Button.MouseLeave:Connect(function()
            UpdateButton()
        end)
        
        return Button
    end
    
    -- Create buttons
    CreateToggleButton(ScrollFrame, "ESP", "👁", function(state)
        Config.ESP.Enabled = state
    end)
    
    CreateToggleButton(ScrollFrame, "Aimbot", "🎯", function(state)
        Config.Aimbot.Enabled = state
    end)
    
    CreateToggleButton(ScrollFrame, "Silent Aim", "🔇", function(state)
        Config.Aimbot.SilentAim = state
    end)
    
    CreateToggleButton(ScrollFrame, "Show FOV Circle", "⭕", function(state)
        Config.Aimbot.ShowFOV = state
    end)
    
    CreateToggleButton(ScrollFrame, "Speed Boost", "⚡", function(state)
        Config.Movement.SpeedBoost = state
    end)
    
    CreateToggleButton(ScrollFrame, "Teleport", "📍", function(state)
        Config.Movement.Teleport = state
    end)
    
    CreateToggleButton(ScrollFrame, "Auto Equip", "🔄", function(state)
        Config.AutoEquip = state
    end)
    
    CreateToggleButton(ScrollFrame, "Anti-Detection", "🛡", function(state)
        Config.AntiDetection.Randomization = state
    end)
    
    print("[TWISTEDHOOK] Buttons created")
    
    -- ==================== DRAGGABLE MENU ====================
    local dragging = false
    local dragStart = nil
    local frameStart = nil
    
    TitleBar.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = Mouse.Position
            frameStart = MainFrame.Position
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    Mouse.Move:Connect(function()
        if dragging and dragStart and frameStart then
            pcall(function()
                local delta = Mouse.Position - dragStart
                MainFrame.Position = frameStart + UDim2.new(0, delta.X, 0, delta.Y)
            end)
        end
    end)
    
    print("[TWISTEDHOOK] Dragging enabled")
    
    -- ==================== MINIMIZE BUTTON ====================
    local minButton = Instance.new("TextButton")
    minButton.Name = "MinButton"
    minButton.Size = UDim2.new(0, 55, 0, 55)
    minButton.Position = UDim2.new(0, 15, 0, 15)
    minButton.BackgroundColor3 = Color3.fromRGB(120, 50, 220)
    minButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minButton.TextSize = 24
    minButton.Font = Enum.Font.GothamBold
    minButton.Text = "⚡"
    minButton.Visible = false
    minButton.ZIndex = 100
    minButton.BorderSizePixel = 0
    minButton.Parent = ScreenGui
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 10)
    MinCorner.Parent = minButton
    
    CloseBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        minButton.Visible = true
    end)
    
    minButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        minButton.Visible = false
    end)
    
    print("[TWISTEDHOOK] Menu setup complete")
    
    -- ==================== VARIABLES ====================
    local ESPCache = {}
    local LastESPUpdate = 0
    local OriginalSpeed = 16
    
    -- ==================== ESP FUNCTION ====================
    local function UpdateESP()
        if not Config.ESP.Enabled then return end
        if tick() - LastESPUpdate < 0.1 then return end
        
        LastESPUpdate = tick()
        
        pcall(function()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local character = player.Character
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChild("Humanoid")
                    
                    if humanoidRootPart and humanoid and not ESPCache[player] then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Adornee = humanoidRootPart
                        billboard.MaxDistance = math.huge
                        billboard.Size = UDim2.new(4, 0, 5, 0)
                        billboard.Parent = humanoidRootPart
                        
                        local frame = Instance.new("Frame")
                        frame.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
                        frame.BackgroundTransparency = 0.3
                        frame.Size = UDim2.new(1, 0, 1, 0)
                        frame.BorderSizePixel = 0
                        frame.Parent = billboard
                        
                        local stroke = Instance.new("UIStroke")
                        stroke.Color = Color3.fromRGB(200, 100, 255)
                        stroke.Thickness = 2
                        stroke.Parent = frame
                        
                        ESPCache[player] = billboard
                    end
                end
            end
        end)
    end
    
    -- ==================== AIMBOT FUNCTION ====================
    local function UpdateAimbot()
        if not Config.Aimbot.Enabled or not LocalPlayer.Character then return end
        
        pcall(function()
            local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end
            
            local closest = nil
            local closestDistance = Config.Aimbot.FOV
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                    local humanoid = player.Character:FindFirstChild("Humanoid")
                    
                    if humanoidRootPart and humanoid and humanoid.Health > 0 then
                        local screenPos = Camera:WorldToScreenPoint(humanoidRootPart.Position)
                        local mousePos = Vector2.new(Mouse.X, Mouse.Y)
                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                        
                        if dist < closestDistance then
                            closest = humanoidRootPart
                            closestDistance = dist
                        end
                    end
                end
            end
            
            if closest and Config.Aimbot.SilentAim then
                local targetCFrame = CFrame.new(Camera.CFrame.Position, closest.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, Config.Aimbot.Smoothness * Config.Aimbot.Strength)
            end
        end)
    end
    
    -- ==================== SPEED FUNCTION ====================
    local function UpdateSpeed()
        if not Config.Movement.SpeedBoost or not LocalPlayer.Character then return end
        
        pcall(function()
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = OriginalSpeed * Config.Movement.Speed
            end
        end)
    end
    
    local function ResetSpeed()
        if LocalPlayer.Character then
            pcall(function()
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = OriginalSpeed
                end
            end)
        end
    end
    
    -- ==================== FOV CIRCLE UPDATE ====================
    local lastFOVUpdate = 0
    local function UpdateFOVCircle()
        if not Config.Aimbot.ShowFOV or not Config.Aimbot.Enabled then
            if tick() - lastFOVUpdate > 0.5 then
                FOVCanvas:ClearAllChildren()
                lastFOVUpdate = tick()
            end
            return
        end
        
        if tick() - lastFOVUpdate < 0.016 then return end
        lastFOVUpdate = tick()
        
        pcall(function()
            FOVCanvas:ClearAllChildren()
            
            local mousePos = Mouse.Position
            local radius = Config.Aimbot.FOV
            
            -- Draw simple circle
            for i = 0, 30 do
                local angle1 = (i / 30) * (2 * math.pi)
                local angle2 = ((i + 1) / 30) * (2 * math.pi)
                
                local x1 = math.cos(angle1) * radius
                local y1 = math.sin(angle1) * radius
                local x2 = math.cos(angle2) * radius
                local y2 = math.sin(angle2) * radius
                
                local line = Instance.new("Frame")
                line.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
                line.BorderSizePixel = 0
                line.Parent = FOVCanvas
                
                local length = math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
                local angle = math.atan2(y2 - y1, x2 - x1)
                
                line.Size = UDim2.new(0, length, 0, 1)
                line.Position = UDim2.new(0, mousePos.X + x1, 0, mousePos.Y + y1)
                line.Rotation = math.deg(angle)
            end
        end)
    end
    
    -- ==================== MAIN LOOP ====================
    local heartbeatConnection = RunService.Heartbeat:Connect(function()
        pcall(function()
            UpdateESP()
            UpdateAimbot()
            
            if Config.Movement.SpeedBoost then
                UpdateSpeed()
            else
                ResetSpeed()
            end
        end)
    end)
    
    RunService.RenderStepped:Connect(function()
        pcall(function()
            UpdateFOVCircle()
        end)
    end)
    
    print("[TWISTEDHOOK] Main loops started")
    
    -- ==================== CLEANUP ====================
    Players.PlayerRemoving:Connect(function(player)
        if ESPCache[player] then
            pcall(function()
                ESPCache[player]:Destroy()
            end)
            ESPCache[player] = nil
        end
        
        if player == LocalPlayer then
            pcall(function()
                heartbeatConnection:Disconnect()
            end)
        end
    end)
    
    -- ==================== TOGGLE MENU ====================
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Enum.KeyCode.P then
            MainFrame.Visible = not MainFrame.Visible
            minButton.Visible = not minButton.Visible
        end
    end)
    
    print("✓✓✓ TWISTEDHOOK v2.3 LOADED ✓✓✓")
    print("✓ Fixed freeze issues")
    print("✓ Optimized FOV circles")
    print("✓ Mobile ready")
    print("✓ Press 'P' to toggle menu")
    
else
    print("⚠ TWISTEDHOOK already loaded!")
end
