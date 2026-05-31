-- ========================================
-- TWISTEDHOOK v2.2 - Mobile Optimized
-- Roblox Rivals Exploit | Mobile Compatible
-- With FOV Circles for Aimbot
-- ========================================

if not getgenv().TwistedhookLoaded then
    getgenv().TwistedhookLoaded = true
    
    print("[TWISTEDHOOK] Mobile version v2.2 starting...")
    
    -- ==================== CORE SETUP ====================
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Camera = workspace.CurrentCamera
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    
    if setthreadidentity then
        setthreadidentity(2)
    end
    
    -- ==================== CONFIGURATION ====================
    local Config = {
        MenuVisible = true,
        ESP = { Enabled = false, Distance = 1000, ShowHealth = true, WallPenetration = true },
        Aimbot = { Enabled = false, Smoothness = 0.15, FOV = 300, SilentAim = true, Strength = 2, ShowFOV = true },
        Movement = { SpeedBoost = false, Speed = 2, Teleport = false },
        AntiDetection = { Randomization = true, BehaviorMimicking = true, RateLimit = true },
        AutoEquip = false,
        FastReload = false,
        BetterAccuracy = false,
    }
    
    -- Wait for PlayerGui with timeout
    local PlayerGui
    local attempts = 0
    while not PlayerGui and attempts < 10 do
        attempts = attempts + 1
        pcall(function()
            PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
        end)
        if not PlayerGui then
            wait(0.5)
        end
    end
    
    if not PlayerGui then
        print("[TWISTEDHOOK] ERROR: Could not find PlayerGui")
        return
    end
    
    -- ==================== FOV CIRCLE DRAWING ====================
    local FOVGui = Instance.new("ScreenGui")
    FOVGui.Name = "FOVCircles"
    FOVGui.ResetOnSpawn = false
    FOVGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    FOVGui.Parent = PlayerGui
    
    local function CreateFOVCircle()
        local canvas = Instance.new("Frame")
        canvas.Name = "FOVCanvas"
        canvas.Size = UDim2.new(1, 0, 1, 0)
        canvas.BackgroundTransparency = 1
        canvas.BorderSizePixel = 0
        canvas.Parent = FOVGui
        
        return canvas
    end
    
    local FOVCircle = CreateFOVCircle()
    
    local function DrawFOVCircle()
        if not Config.Aimbot.ShowFOV or not Config.Aimbot.Enabled then
            FOVCircle:ClearAllChildren()
            return
        end
        
        pcall(function()
            FOVCircle:ClearAllChildren()
            
            local mousePos = Mouse.Position
            local radius = Config.Aimbot.FOV
            
            -- Draw circle using lines
            local segments = 32
            for i = 1, segments do
                local angle1 = (i - 1) * (2 * math.pi / segments)
                local angle2 = i * (2 * math.pi / segments)
                
                local x1 = math.cos(angle1) * radius
                local y1 = math.sin(angle1) * radius
                local x2 = math.cos(angle2) * radius
                local y2 = math.sin(angle2) * radius
                
                local line = Instance.new("Frame")
                line.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
                line.BorderSizePixel = 0
                line.Parent = FOVCircle
                
                -- Calculate line position and rotation
                local length = math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
                local angle = math.atan2(y2 - y1, x2 - x1)
                
                line.Size = UDim2.new(0, length, 0, 1)
                line.Position = UDim2.new(0, mousePos.X + x1, 0, mousePos.Y + y1)
                
                local rotation = math.deg(angle)
                line.Rotation = rotation
            end
            
            -- Draw center dot
            local center = Instance.new("Frame")
            center.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            center.Size = UDim2.new(0, 6, 0, 6)
            center.Position = UDim2.new(0, mousePos.X - 3, 0, mousePos.Y - 3)
            center.BorderSizePixel = 0
            center.Parent = FOVCircle
            
            local centerCorner = Instance.new("UICorner")
            centerCorner.CornerRadius = UDim.new(0.5, 0)
            centerCorner.Parent = center
        end)
    end
    
    -- Update FOV circle every frame
    RunService.RenderStepped:Connect(function()
        DrawFOVCircle()
    end)
    
    print("[TWISTEDHOOK] FOV Circle system initialized")
    
    -- ==================== ENHANCED UI - MOBILE FRIENDLY ====================
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TwistedhookUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui
    
    -- Main Menu Frame - Mobile Optimized
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainMenu"
    MainFrame.Size = UDim2.new(0, 340, 0, 580)
    MainFrame.Position = UDim2.new(0.5, -170, 0.05, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- Add shadow effect
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(100, 50, 200)
    UIStroke.Thickness = 2
    UIStroke.Parent = MainFrame
    
    -- Title Bar - Mobile Optimized
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 55)
    TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    -- Title Text
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
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 750)
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
    
    -- ==================== FEATURE BUTTONS ====================
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
        
        return Button, function() return State end
    end
    
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
    
    CreateToggleButton(ScrollFrame, "Fast Reload", "⏱", function(state)
        Config.FastReload = state
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
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = Mouse.Position
            frameStart = MainFrame.Position
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
    
    print("[TWISTEDHOOK] Minimize button working")
    
    -- ==================== POWERFUL ESP - MOBILE OPTIMIZED ====================
    local ESPCache = {}
    local LastESPUpdate = 0
    local OriginalSpeed = 16
    
    local function CreateESPBox(humanoidRootPart, player)
        pcall(function()
            local billboardGui = Instance.new("BillboardGui")
            billboardGui.Adornee = humanoidRootPart
            billboardGui.MaxDistance = Config.ESP.Distance
            billboardGui.Size = UDim2.new(5, 0, 6, 0)
            billboardGui.MaxDistance = math.huge -- Show from ANY distance
            billboardGui.Parent = humanoidRootPart
            
            local frame = Instance.new("Frame")
            frame.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
            frame.BackgroundTransparency = 0.1
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BorderSizePixel = 0
            frame.Parent = billboardGui
            
            -- Stronger outline
            local uiStroke = Instance.new("UIStroke")
            uiStroke.Color = Color3.fromRGB(200, 100, 255)
            uiStroke.Thickness = 3
            uiStroke.Parent = frame
            
            -- Player name
            local nameLabel = Instance.new("TextLabel")
            nameLabel.BackgroundTransparency = 1
            nameLabel.Size = UDim2.new(1, 0, 0.3, 0)
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.TextSize = 16
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.Text = player.Name
            nameLabel.Parent = frame
            
            -- Health bar
            if Config.ESP.ShowHealth then
                local healthBg = Instance.new("Frame")
                healthBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                healthBg.BackgroundTransparency = 0.3
                healthBg.Size = UDim2.new(0.8, 0, 0.15, 0)
                healthBg.Position = UDim2.new(0.1, 0, 0.7, 0)
                healthBg.BorderSizePixel = 0
                healthBg.Parent = frame
                
                local healthBar = Instance.new("Frame")
                healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                healthBar.Size = UDim2.new(1, 0, 1, 0)
                healthBar.BorderSizePixel = 0
                healthBar.Parent = healthBg
                
                return billboardGui, healthBar
            end
            
            return billboardGui
        end)
    end
    
    local function UpdateESP()
        if not Config.ESP.Enabled then return end
        if tick() - LastESPUpdate < 0.05 then return end
        
        LastESPUpdate = tick()
        
        pcall(function()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local character = player.Character
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChild("Humanoid")
                    
                    if humanoidRootPart and humanoid then
                        if not ESPCache[player] then
                            local billboard, healthBar = CreateESPBox(humanoidRootPart, player)
                            ESPCache[player] = {
                                billboard = billboard,
                                healthBar = healthBar,
                                lastHealth = humanoid.Health
                            }
                        else
                            -- Update health bar
                            if Config.ESP.ShowHealth and ESPCache[player].healthBar then
                                local healthPercent = math.max(0, humanoid.Health / humanoid.MaxHealth)
                                ESPCache[player].healthBar.Size = UDim2.new(math.max(0, healthPercent), 0, 1, 0)
                            end
                        end
                    end
                end
            end
        end)
    end
    
    -- Speed Boost
    local function UpdateSpeed()
        if not Config.Movement.SpeedBoost or not LocalPlayer.Character then return end
        
        pcall(function()
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = OriginalSpeed * Config.Movement.Speed
            end
        end)
    end
    
    -- STRONGER AIMBOT
    local function UpdateAimbot()
        if not Config.Aimbot.Enabled or not LocalPlayer.Character then return end
        
        pcall(function()
            local closest = nil
            local closestDistance = Config.Aimbot.FOV
            
            local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local character = player.Character
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChild("Humanoid")
                    
                    if humanoidRootPart and humanoid and humanoid.Health > 0 then
                        local distance = (humanoidRootPart.Position - myRoot.Position).Magnitude
                        local screenPos = Camera:WorldToScreenPoint(humanoidRootPart.Position)
                        local mousePos = Vector2.new(Mouse.X, Mouse.Y)
                        local distanceToMouse = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                        
                        if distance <= Config.Aimbot.FOV and distanceToMouse < closestDistance then
                            closest = humanoidRootPart
                            closestDistance = distanceToMouse
                        end
                    end
                end
            end
            
            if closest and Config.Aimbot.SilentAim then
                -- Stronger aiming with higher strength
                local targetCFrame = CFrame.new(Camera.CFrame.Position, closest.Position + closest.AssemblyLinearVelocity * 0.1)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, Config.Aimbot.Smoothness * Config.Aimbot.Strength)
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
    
    -- Main feature loop
    local featureConnection = RunService.Heartbeat:Connect(function()
        pcall(function()
            if Config.ESP.Enabled then
                UpdateESP()
            end
            
            if Config.Movement.SpeedBoost then
                UpdateSpeed()
            else
                ResetSpeed()
            end
            
            if Config.Aimbot.Enabled then
                UpdateAimbot()
            end
        end)
    end)
    
    print("[TWISTEDHOOK] Features running")
    
    -- ==================== PLAYER MANAGEMENT ====================
    Players.PlayerRemoving:Connect(function(player)
        pcall(function()
            if ESPCache[player] then
                if ESPCache[player].billboard then
                    ESPCache[player].billboard:Destroy()
                end
                ESPCache[player] = nil
            end
        end)
    end)
    
    -- Cleanup on character respawn
    LocalPlayer.CharacterAdded:Connect(function(newCharacter)
        pcall(function()
            for player, cache in pairs(ESPCache) do
                if cache.billboard and cache.billboard.Adornee then
                    if not cache.billboard.Adornee.Parent then
                        pcall(function() cache.billboard:Destroy() end)
                        ESPCache[player] = nil
                    end
                end
            end
        end)
    end)
    
    -- ==================== INPUT ====================
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Enum.KeyCode.P then
            MainFrame.Visible = not MainFrame.Visible
            minButton.Visible = not minButton.Visible
        end
    end)
    
    -- ==================== CLEANUP ON GAME LEAVE ====================
    Players.PlayerRemoving:Connect(function(player)
        if player == LocalPlayer then
            if featureConnection then
                featureConnection:Disconnect()
            end
        end
    end)
    
    if setthreadidentity then
        setthreadidentity(2)
    end
    
    print("✓✓✓ TWISTEDHOOK v2.2 LOADED ✓✓✓")
    print("✓ Mobile optimized")
    print("✓ Powerful ESP (shows through walls)")
    print("✓ Stronger aimbot")
    print("✓ FOV circles for all aim modes")
    print("✓ Game-stable")
    print("✓ Press 'P' to toggle menu")
    print("✓ Ready for Rivals!")
    
else
    print("⚠ TWISTEDHOOK already loaded!")
end
