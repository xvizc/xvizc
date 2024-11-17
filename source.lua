local Library = {}

function Library:CreateWindow(title)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Parent = screenGui
    frame.Size = UDim2.new(0, 500, 0, 300)
    frame.Position = UDim2.new(0.5, -250, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Text = title or "Title"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.BorderSizePixel = 0

    local tabHolder = Instance.new("Frame")
    tabHolder.Parent = frame
    tabHolder.Size = UDim2.new(0.2, 0, 1, -30)
    tabHolder.Position = UDim2.new(0, 0, 0, 30)
    tabHolder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    tabHolder.BorderSizePixel = 0

    local contentFrame = Instance.new("Frame")
    contentFrame.Parent = frame
    contentFrame.Size = UDim2.new(0.8, 0, 1, -30)
    contentFrame.Position = UDim2.new(0.2, 0, 0, 30)
    contentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    contentFrame.BorderSizePixel = 0

    return {
        Frame = frame,
        TabHolder = tabHolder,
        ContentFrame = contentFrame
    }
end

function Library:CreateTab(tabHolder, name, contentFrame)
    local tabButton = Instance.new("TextButton")
    tabButton.Parent = tabHolder
    tabButton.Size = UDim2.new(1, 0, 0, 30)
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    tabButton.TextSize = 14
    tabButton.Font = Enum.Font.SourceSans
    tabButton.BorderSizePixel = 0

    local tabContent = Instance.new("Frame")
    tabContent.Parent = contentFrame
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.Visible = false
    tabContent.BackgroundTransparency = 1

    tabButton.MouseButton1Click:Connect(function()
        for _, v in pairs(contentFrame:GetChildren()) do
            if v:IsA("Frame") then
                v.Visible = false
            end
        end
        tabContent.Visible = true
    end)

    return tabContent
end

function Library:CreateLabel(parent, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    label.TextSize = 14
    label.Font = Enum.Font.SourceSans
    label.BorderSizePixel = 0
    return label
end

-- Добавленный метод CreateButton
function Library:CreateButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(0, 200, 0, 30)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.TextSize = 14
    button.Font = Enum.Font.SourceSans
    button.BorderSizePixel = 0
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
    return button
end

return Library
