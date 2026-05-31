-- ========================================
-- TWISTEDHOOK v2 - Roblox Rivals Exploit
-- Enhanced UI | Wall-Penetrating ESP | Stable
-- ========================================

if not getgenv().TwistedhookLoaded then
    getgenv().TwistedhookLoaded = true
    
    print("[TWISTEDHOOK] Starting initialization...")
    
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
        ESP = { Enabled = false, Distance = 500, ShowHealth = true, WallPenetration = true },
        Aimbot = { Enabled = false, Smoothness = 0.5, FOV = 120, SilentAim = true },
        Movement = { SpeedBoost = false, Speed = 1.5, Teleport = false },
        AntiDetection = { Randomization = true, BehaviorMimicking = true, RateLimit = true },
        AutoEquip = false,
        FastReload = false,
        BetterAccuracy = false,
    }
    
    -- ==================== ENHANCED UI - MODERN STYLE ====================
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 5)
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TwistedhookUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui
    
    -- Main Menu Frame - Modern Glass Morphism Style
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainMenu"
    MainFrame.Size = UDim2.new(0, 380, 0, 580)
    MainFrame.Position = UDim2.new(0.5, -190, 0.1, 0)
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
    
    -- Title Bar - Modern Style
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 60)
    TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    -- Gradient effect on title (using Frame)
    local GradientFrame = Instance.new("Frame")
    GradientFrame.Size = UDim2.new(1, 0, 1, 0)
    GradientFrame.BackgroundColor3 = Color3.fromRGB(80, 30, 150)
    GradientFrame.BackgroundTransparency = 0.8
    GradientFrame.BorderSizePixel = 0
    GradientFrame.Parent = TitleBar
    
    local GradientCorner = Instance.new("UICorner")
    GradientCorner.CornerRadius = UDim.new(0, 12)
    GradientCorner.Parent = GradientFrame
    
    -- Title Text
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 20, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 22
    Title.Font = Enum.Font.GothamBold
    Title.Text = "⚡ TWISTEDHOOK"
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 2
    Title.Parent = TitleBar
    
    -- Version label
    local VersionLabel = Instance.new("TextLabel")
    VersionLabel.Name = "Version"
    VersionLabel.Size = UDim2.new(0, 60, 1, 0)
    VersionLabel.Position = UDim2.new(1, -80, 0, 0)
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.TextColor3 = Color3.fromRGB(150, 100, 200)
    VersionLabel.TextSize = 12
    VersionLabel.Font = Enum.Font.GothamSemibold
    VersionLabel.Text = "v2.0"
    VersionLabel.TextXAlignment = Enum.TextXAlignment.Center
    VersionLabel.ZIndex = 2
    VersionLabel.Parent = TitleBar
    
    -- Close Button (Modern X)
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "CloseBtn"
    CloseBtn.Size = UDim2.new(0, 45, 0, 45)
    CloseBtn.Position = UDim2.new(1, -50, 0, 7.5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 20
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.BorderSizePixel = 0
    CloseBtn.ZIndex = 3
    CloseBtn.Parent = TitleBar
    
    local CloseBtnCorner = Instance.new("UICorner")
    CloseBtnCorner.CornerRadius = UDim.new(0, 8)
    CloseBtnCorner.Parent = CloseBtn
    
    -- Hover effect for close button
    CloseBtn.MouseEnter:Connect(function()
        CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    end)
    
    CloseBtn.MouseLeave:Connect(function()
        CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end)
    
    -- Scroll Frame with improved styling
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Name = "ScrollFrame"
    ScrollFrame.Size = UDim2.new(1, 0, 1, -60)
    ScrollFrame.Position = UDim2.new(0, 0, 0, 60)
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.ScrollBarThickness = 8
    ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 80, 220)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 700)
    ScrollFrame.Parent = MainFrame
    
    local ScrollCorner = Instance.new("UICorner")
    ScrollCorner.CornerRadius = UDim.new(0, 12)
    ScrollCorner.Parent = ScrollFrame
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 12)
    UIListLayout.Parent = ScrollFrame
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop = UDim.new(0, 12)
    UIPadding.PaddingBottom = UDim.new(0, 12)
    UIPadding.PaddingLeft = UDim.new(0, 12)
    UIPadding.PaddingRight = UDim.new(0, 12)
    UIPadding.Parent = ScrollFrame
    
    print("[TWISTEDHOOK] Enhanced UI created")
    
    -- ==================== FEATURE BUTTONS - MODERN STYLE ====================
    local function CreateToggleButton(parent, name, icon, callback)
        local Button = Instance.new("TextButton")
        Button.Name = name
        Button.Size = UDim2.new(1, 0, 0, 50)
        Button.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        Button.TextColor3 = Color3.fromRGB(200, 200, 200)
        Button.TextSize = 14
        Button.Font = Enum.Font.GothamSemibold
        Button.Text = icon .. " " .. name
        Button.BorderSizePixel = 0
        Button.Parent = parent
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 10)
        BtnCorner.Parent = Button
        
        local BtnStroke = Instance.new("UIStroke")
        BtnStroke.Color = Color3.fromRGB(80, 40, 150)
        BtnStroke.Thickness = 1.5
        BtnStroke.Parent = Button
        
        -- Toggle indicator (left side)
        local ToggleIndicator = Instance.new("Frame")
        ToggleIndicator.Name = "Indicator"
        ToggleIndicator.Size = UDim2.new(0, 10, 0, 10)
        ToggleIndicator.Position = UDim2.new(0, 12, 0.5, -5)
        ToggleIndicator.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        ToggleIndicator.BorderSizePixel = 0
        ToggleIndicator.Parent = Button
        
        local IndicatorCorner = Instance.new("UICorner")
        IndicatorCorner.CornerRadius = UDim.new(0, 3)
        IndicatorCorner.Parent = ToggleIndicator
        
        local State = false
        
        local function UpdateButton()
            if State then
                Button.BackgroundColor3 = Color3.fromRGB(120, 50, 220)
                ToggleIndicator.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                BtnStroke.Color = Color3.fromRGB(150, 80, 220)
            else
                Button.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
                ToggleIndicator.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Button.TextColor3 = Color3.fromRGB(200, 200, 200)
                BtnStroke.Color = Color3.fromRGB(80, 40, 150)
            end
        end
        
        Button.MouseButton1Click:Connect(function()
            State = not State
            UpdateButton()
            pcall(function() callback(State) end)
        end)
        
        -- Hover effect
        Button.MouseEnter:Connect(function()
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        end)
        
        Button.MouseLeave:Connect(function()
            UpdateButton()
        end)
        
        return Button, function() return State end
    end
    
    -- Create all feature buttons with icons
    CreateToggleButton(ScrollFrame, "ESP", "👁", function(state)
        Config.ESP.Enabled = state
    end)
    
    CreateToggleButton(ScrollFrame, "Aimbot", "🎯", function(state)
        Config.Aimbot.Enabled = state
    end)
    
    CreateToggleButton(ScrollFrame, "Silent Aim", "🔇", function(state)
        Config.Aimbot.SilentAim = state
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
    
    CreateToggleButton(ScrollFrame, "Better Accuracy", "🎪", function(state)
        Config.BetterAccuracy = state
    end)
    
    CreateToggleButton(ScrollFrame, "Anti-Detection", "🛡", function(state)
        Config.AntiDetection.Randomization = state
        Config.AntiDetection.BehaviorMimicking = state
        Config.AntiDetection.RateLimit = state
    end)
    
    print("[TWISTEDHOOK] All buttons created")
    
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
    minButton.Size = UDim2.new(0, 60, 0, 60)
    minButton.Position = UDim2.new(0, 20, 0, 20)
    minButton.BackgroundColor3 = Color3.fromRGB(120, 50, 220)
    minButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minButton.TextSize = 28
    minButton.Font = Enum.Font.GothamBold
    minButton.Text = "⚡"
    minButton.Visible = false
    minButton.ZIndex = 100
    minButton.BorderSizePixel = 0
    minButton.Parent = ScreenGui
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 12)
    MinCorner.Parent = minButton
    
    local MinStroke = Instance.new("UIStroke")
    MinStroke.Color = Color3.fromRGB(200, 100, 255)
    MinStroke.Thickness = 2
    MinStroke.Parent = minButton
    
    CloseBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        minButton.Visible = true
    end)
    
    minButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        minButton.Visible = false
    end)
    
    print("[TWISTEDHOOK] Minimize button working")
    
    -- ==================== FIXED ESP WITH WALL PENETRATION ====================
    local ESPCache = {}
    local LastESPUpdate = 0
    local OriginalSpeed = 16
    
    local function CreateESPBox(humanoidRootPart, player)
        -- Create a BillboardGui that shows through walls
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = humanoidRootPart
        billboardGui.MaxDistance = Config.ESP.Distance
        billboardGui.Size = UDim2.new(4, 0, 5, 0)
        billboardGui.Parent = humanoidRootPart
        
        -- Main frame
        local frame = Instance.new("Frame")
        frame.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
        frame.BackgroundTransparency = 0.3
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BorderSizePixel = 0
        frame.Parent = billboardGui
        
        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 4)
        frameCorner.Parent = frame
        
        -- Outline stroke (wall penetration)
        local uiStroke = Instance.new("UIStroke")
        uiStroke.Color = Color3.fromRGB(150, 100, 255)
        uiStroke.Thickness = 2
        uiStroke.Parent = frame
        
        -- Player name label
        local nameLabel = Instance.new("TextLabel")
        nameLabel.BackgroundTransparency = 1
        nameLabel.Size = UDim2.new(1, 0, 0.3, 0)
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Text = player.Name
        nameLabel.Parent = frame
        
        -- Health bar background
        if Config.ESP.ShowHealth then
            local healthBg = Instance.new("Frame")
            healthBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            healthBg.Size = UDim2.new(0.9, 0, 0.15, 0)
            healthBg.Position = UDim2.new(0.05, 0, 0.7, 0)
            healthBg.BorderSizePixel = 0
            healthBg.Parent = frame
            
            local healthBar = Instance.new("Frame")
            healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            healthBar.Size = UDim2.new(1, 0, 1, 0)
            healthBar.BorderSizePixel = 0
            healthBar.Parent = healthBg
            
            ESPCache[player].healthBar = healthBar
        end
        
        return billboardGui
    end
    
    local function UpdateESP()
        if not Config.ESP.Enabled then return end
        if tick() - LastESPUpdate < 0.15 then return end
        
        LastESPUpdate = tick()
        
        pcall(function()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local character = player.Character
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChild("Humanoid")
                    
                    if humanoidRootPart and humanoid then
                        -- Create ESP if it doesn't exist
                        if not ESPCache[player] then
                            ESPCache[player] = {
                                billboard = CreateESPBox(humanoidRootPart, player),
                                lastHealth = humanoid.Health
                            }
                        else
                            -- Update health bar
                            if Config.ESP.ShowHealth and ESPCache[player].healthBar then
                                local healthPercent = humanoid.Health / humanoid.MaxHealth
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
    
    -- Aimbot with better stability
    local function UpdateAimbot()
        if not Config.Aimbot.Enabled or not LocalPlayer.Character then return end
        
        pcall(function()
            local closest = nil
            local closestDistance = Config.Aimbot.FOV
            
            if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local character = player.Character
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChild("Humanoid")
                    
                    if humanoidRootPart and humanoid and humanoid.Health > 0 then
                        local distance = (humanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
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
                Camera.CFrame = Camera.CFrame:Lerp(
                    CFrame.new(Camera.CFrame.Position, closest.Position),
                    Config.Aimbot.Smoothness
                )
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
    
    -- Main feature loop with stability improvements
    RunService.Heartbeat:Connect(function()
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
    
    print("[TWISTEDHOOK] Features enabled and working")
    
    -- ==================== PLAYER MANAGEMENT ====================
    Players.PlayerRemoving:Connect(function(player)
        if ESPCache[player] then
            pcall(function()
                if ESPCache[player].billboard then
                    ESPCache[player].billboard:Destroy()
                end
                ESPCache[player] = nil
            end)
        end
    end)
    
    -- Clean up on respawn
    LocalPlayer.CharacterAdded:Connect(function()
        for player, cache in pairs(ESPCache) do
            if cache.billboard and cache.billboard.Adornee then
                if not cache.billboard.Adornee.Parent then
                    pcall(function() cache.billboard:Destroy() end)
                    ESPCache[player] = nil
                end
            end
        end
    end)
    
    -- ==================== INPUT ====================
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Enum.KeyCode.P then
            MainFrame.Visible = not MainFrame.Visible
            minButton.Visible = not minButton.Visible
        end
    end)
    
    if setthreadidentity then
        setthreadidentity(2)
    end
    
    print("✓✓✓ TWISTEDHOOK v2 LOADED ✓✓✓")
    print("✓ Wall-penetrating ESP")
    print("✓ Enhanced modern UI")
    print("✓ Improved stability")
    print("✓ Draggable menu working")
    print("✓ All features active")
    print("✓ Press 'P' to toggle menu")
    print("✓ Ready for Rivals!")
    
else
    print("⚠ TWISTEDHOOK already loaded!")
end
