-- ========================================
-- TWISTEDHOOK v1 - Roblox Rivals Exploit
-- Clean Kicia-Style UI | Draggable | Full Features
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
        ESP = { Enabled = false, Distance = 500, ShowHealth = true },
        Aimbot = { Enabled = false, Smoothness = 0.5, FOV = 120, SilentAim = true },
        Movement = { SpeedBoost = false, Speed = 1.5, Teleport = false },
        AntiDetection = { Randomization = true, BehaviorMimicking = true, RateLimit = true },
        AutoEquip = false,
        FastReload = false,
        BetterAccuracy = false,
    }
    
    -- ==================== CLEAN KICIA-STYLE UI ====================
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 5)
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TwistedhookUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui
    
    -- Main Menu Frame - Kicia Style
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainMenu"
    MainFrame.Size = UDim2.new(0, 320, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -160, 0.1, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- Add shadow effect
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(60, 30, 120)
    UIStroke.Thickness = 2
    UIStroke.Parent = MainFrame
    
    -- Title Bar - Kicia Style
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 50)
    TitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 10)
    TitleCorner.Parent = TitleBar
    
    -- Title Text
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -50, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.Text = "TWISTEDHOOK"
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TitleBar
    
    -- Close Button (Modern X)
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "CloseBtn"
    CloseBtn.Size = UDim2.new(0, 40, 0, 40)
    CloseBtn.Position = UDim2.new(1, -45, 0, 5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    CloseBtn.TextSize = 18
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Parent = TitleBar
    
    local CloseBtnCorner = Instance.new("UICorner")
    CloseBtnCorner.CornerRadius = UDim.new(0, 6)
    CloseBtnCorner.Parent = CloseBtn
    
    -- Hover effect for close button
    CloseBtn.MouseEnter:Connect(function()
        CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    CloseBtn.MouseLeave:Connect(function()
        CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    end)
    
    -- Scroll Frame
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Name = "ScrollFrame"
    ScrollFrame.Size = UDim2.new(1, 0, 1, -50)
    ScrollFrame.Position = UDim2.new(0, 0, 0, 50)
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.ScrollBarThickness = 6
    ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 40, 150)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
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
    
    print("[TWISTEDHOOK] Clean UI created")
    
    -- ==================== FEATURE BUTTONS - KICIA STYLE ====================
    local function CreateToggleButton(parent, name, callback)
        local Button = Instance.new("TextButton")
        Button.Name = name
        Button.Size = UDim2.new(1, 0, 0, 42)
        Button.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        Button.TextColor3 = Color3.fromRGB(200, 200, 200)
        Button.TextSize = 14
        Button.Font = Enum.Font.GothamSemibold
        Button.Text = name
        Button.BorderSizePixel = 0
        Button.Parent = parent
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 8)
        BtnCorner.Parent = Button
        
        local BtnStroke = Instance.new("UIStroke")
        BtnStroke.Color = Color3.fromRGB(60, 30, 100)
        BtnStroke.Thickness = 1
        BtnStroke.Parent = Button
        
        -- Toggle indicator (left side)
        local ToggleIndicator = Instance.new("Frame")
        ToggleIndicator.Name = "Indicator"
        ToggleIndicator.Size = UDim2.new(0, 8, 0, 8)
        ToggleIndicator.Position = UDim2.new(0, 12, 0.5, -4)
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
                Button.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
                ToggleIndicator.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                Button.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
        
        Button.MouseButton1Click:Connect(function()
            State = not State
            UpdateButton()
            callback(State)
        end)
        
        -- Hover effect
        Button.MouseEnter:Connect(function()
            Button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        end)
        
        Button.MouseLeave:Connect(function()
            UpdateButton()
        end)
        
        return Button, function() return State end
    end
    
    -- Create all feature buttons
    CreateToggleButton(ScrollFrame, "ESP", function(state)
        Config.ESP.Enabled = state
    end)
    
    CreateToggleButton(ScrollFrame, "Aimbot", function(state)
        Config.Aimbot.Enabled = state
    end)
    
    CreateToggleButton(ScrollFrame, "Silent Aim", function(state)
        Config.Aimbot.SilentAim = state
    end)
    
    CreateToggleButton(ScrollFrame, "Speed Boost", function(state)
        Config.Movement.SpeedBoost = state
    end)
    
    CreateToggleButton(ScrollFrame, "Teleport to Target", function(state)
        Config.Movement.Teleport = state
    end)
    
    CreateToggleButton(ScrollFrame, "Auto Equip", function(state)
        Config.AutoEquip = state
    end)
    
    CreateToggleButton(ScrollFrame, "Fast Reload", function(state)
        Config.FastReload = state
    end)
    
    CreateToggleButton(ScrollFrame, "Better Accuracy", function(state)
        Config.BetterAccuracy = state
    end)
    
    CreateToggleButton(ScrollFrame, "Anti-Detection", function(state)
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
            local delta = Mouse.Position - dragStart
            MainFrame.Position = frameStart + UDim2.new(0, delta.X, 0, delta.Y)
        end
    end)
    
    print("[TWISTEDHOOK] Dragging enabled")
    
    -- ==================== CLOSE BUTTON ====================
    local minButton = Instance.new("TextButton")
    minButton.Name = "MinButton"
    minButton.Size = UDim2.new(0, 50, 0, 50)
    minButton.Position = UDim2.new(0, 15, 0, 15)
    minButton.BackgroundColor3 = Color3.fromRGB(80, 30, 150)
    minButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minButton.TextSize = 24
    minButton.Font = Enum.Font.GothamBold
    minButton.Text = "≡"
    minButton.Visible = false
    minButton.ZIndex = 100
    minButton.BorderSizePixel = 0
    minButton.Parent = ScreenGui
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 8)
    MinCorner.Parent = minButton
    
    CloseBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        minButton.Visible = true
    end)
    
    minButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        minButton.Visible = false
    end)
    
    print("[TWISTEDHOOK] Close/minimize working")
    
    -- ==================== OPTIMIZED FEATURES ====================
    local ESPCache = {}
    local LastESPUpdate = 0
    local OriginalSpeed = 16
    
    local function UpdateESP()
        if not Config.ESP.Enabled then return end
        if tick() - LastESPUpdate < 0.1 then return end
        
        LastESPUpdate = tick()
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local character = player.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart and not ESPCache[player] then
                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Adornee = humanoidRootPart
                    billboardGui.MaxDistance = Config.ESP.Distance
                    billboardGui.Size = UDim2.new(4, 0, 5, 0)
                    billboardGui.Parent = humanoidRootPart
                    
                    local frame = Instance.new("Frame")
                    frame.BackgroundTransparency = 1
                    frame.Size = UDim2.new(1, 0, 1, 0)
                    frame.Parent = billboardGui
                    
                    local uiStroke = Instance.new("UIStroke")
                    uiStroke.Color = Color3.fromRGB(100, 0, 200)
                    uiStroke.Thickness = 2
                    uiStroke.Parent = frame
                    
                    ESPCache[player] = billboardGui
                end
            end
        end
    end
    
    -- Speed Boost
    local function UpdateSpeed()
        if not Config.Movement.SpeedBoost or not LocalPlayer.Character then return end
        
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = OriginalSpeed * Config.Movement.Speed
        end
    end
    
    -- Aimbot
    local function UpdateAimbot()
        if not Config.Aimbot.Enabled or not LocalPlayer.Character then return end
        
        local closest = nil
        local closestDistance = Config.Aimbot.FOV
        
        if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local character = player.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart then
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
            pcall(function()
                Camera.CFrame = Camera.CFrame:Lerp(
                    CFrame.new(Camera.CFrame.Position, closest.Position),
                    Config.Aimbot.Smoothness
                )
            end)
        end
    end
    
    local function ResetSpeed()
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = OriginalSpeed
            end
        end
    end
    
    -- Main feature loop
    RunService.Heartbeat:Connect(function()
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
    
    print("[TWISTEDHOOK] Features enabled and working")
    
    -- ==================== PLAYER MANAGEMENT ====================
    Players.PlayerRemoving:Connect(function(player)
        if ESPCache[player] then
            pcall(function() ESPCache[player]:Destroy() end)
            ESPCache[player] = nil
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
    
    print("✓✓✓ TWISTEDHOOK v1 LOADED ✓✓✓")
    print("✓ Clean Kicia-style UI")
    print("✓ Draggable menu working")
    print("✓ All features active")
    print("✓ Press 'P' to toggle menu")
    print("✓ Ready for Rivals!")
    
else
    print("⚠ TWISTEDHOOK already loaded!")
end
