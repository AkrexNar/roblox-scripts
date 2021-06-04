local Spectate = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local Spectate_2 = Instance.new("TextButton")
local Unspectate = Instance.new("TextButton")
local ScrollingFrame = Instance.new("ScrollingFrame")
local PlayerInfo = Instance.new("TextLabel")
local Template = Instance.new("TextButton")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")

Spectate.Name = "Spectate"
Spectate.Enabled = false
Spectate.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Spectate.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Spectate
Frame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Frame.BackgroundTransparency = 0.500
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 4
Frame.Position = UDim2.new(0.124058113, 0, 0.149779737, 0)
Frame.Size = UDim2.new(0.75, 0, 0.699999988, 0)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BackgroundTransparency = 0.700
TextBox.BorderColor3 = Color3.fromRGB(34, 34, 34)
TextBox.BorderSizePixel = 3
TextBox.Position = UDim2.new(0.0402932763, 0, 0.106263764, 0)
TextBox.Size = UDim2.new(0.408109605, 0, 0.130427927, 0)
TextBox.Font = Enum.Font.Fantasy
TextBox.PlaceholderColor3 = Color3.fromRGB(128, 128, 128)
TextBox.PlaceholderText = "Player name"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

Spectate_2.Name = "Spectate"
Spectate_2.Parent = Frame
Spectate_2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Spectate_2.BorderColor3 = Color3.fromRGB(16, 16, 52)
Spectate_2.BorderSizePixel = 3
Spectate_2.Position = UDim2.new(0.0388580635, 0, 0.718218923, 0)
Spectate_2.Size = UDim2.new(0.179000005, 0, 0.119999997, 0)
Spectate_2.Font = Enum.Font.Fantasy
Spectate_2.Text = "Spectate"
Spectate_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Spectate_2.TextScaled = true
Spectate_2.TextSize = 14.000
Spectate_2.TextWrapped = true

Unspectate.Name = "Unspectate"
Unspectate.Parent = Frame
Unspectate.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Unspectate.BorderColor3 = Color3.fromRGB(16, 16, 52)
Unspectate.BorderSizePixel = 3
Unspectate.Position = UDim2.new(0.268262923, 0, 0.715072274, 0)
Unspectate.Size = UDim2.new(0.178704709, 0, 0.120000012, 0)
Unspectate.Font = Enum.Font.Fantasy
Unspectate.Text = "Unspectate"
Unspectate.TextColor3 = Color3.fromRGB(255, 255, 255)
Unspectate.TextScaled = true
Unspectate.TextSize = 14.000
Unspectate.TextWrapped = true

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BackgroundTransparency = 0.500
ScrollingFrame.BorderSizePixel = 3
ScrollingFrame.Position = UDim2.new(0.492285609, 0, 0.103838898, 0)
ScrollingFrame.Size = UDim2.new(0.482777178, 0, 0.734380007, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2.25, 0)
ScrollingFrame.ScrollBarThickness = 0

PlayerInfo.Name = "PlayerInfo"
PlayerInfo.Parent = Frame
PlayerInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerInfo.BackgroundTransparency = 1.000
PlayerInfo.BorderSizePixel = 5
PlayerInfo.Position = UDim2.new(0.0387624875, 0, 0.289490253, 0)
PlayerInfo.Size = UDim2.new(0.409640312, 0, 0.367000014, 0)
PlayerInfo.Font = Enum.Font.Fantasy
PlayerInfo.Text = "Display: \\nUsername: \\nUserId:"
PlayerInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerInfo.TextScaled = true
PlayerInfo.TextSize = 20.000
PlayerInfo.TextStrokeColor3 = Color3.fromRGB(20, 20, 20)
PlayerInfo.TextStrokeTransparency = 0.000
PlayerInfo.TextWrapped = true

Template.Name = "Template"
Template.Parent = Frame
Template.Active = false
Template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Template.BackgroundTransparency = 1.000
Template.BorderColor3 = Color3.fromRGB(255, 255, 255)
Template.BorderSizePixel = 5
Template.Position = UDim2.new(9.6766243e-08, 0, 0, 0)
Template.Selectable = false
Template.Size = UDim2.new(0.999999881, 0, 0.225216478, 0)
Template.Visible = false
Template.Font = Enum.Font.Fantasy
Template.Text = "Display (Username)"
Template.TextColor3 = Color3.fromRGB(255, 255, 255)
Template.TextScaled = true
Template.TextSize = 14.000
Template.TextWrapped = true

UIAspectRatioConstraint.Parent = Template
UIAspectRatioConstraint.AspectRatio = 6.000
UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height

UICorner.CornerRadius = UDim.new(0.0500000007, 0)
UICorner.Parent = Frame

local function main() -- Spectate.LocalScript 

	local UIS = game:GetService("UserInputService")
	
	local cons = {}
	
	local gui = Spectate
	local frame = gui.Frame
	local sframe = frame.ScrollingFrame
	local textbox = frame.TextBox
	local spectBut = frame.Spectate
	local unspectBut = frame.Unspectate
	local cam = workspace.CurrentCamera
	local temp = frame.Template
	local info = frame.PlayerInfo
	
	local function updateList()
		for i = 1, #cons do
			cons[i]:Disconnect()
		end
		sframe:ClearAllChildren()
		local plrs = game.Players:GetPlayers()
		for i = 1, #plrs do
			local newBut = temp:Clone()
			newBut.Position = UDim2.new(0, 0, (i-1)*0.083, 0)
			newBut.Text = plrs[i].DisplayName.." ("..plrs[i].Name..")"
			newBut.Visible = true
			newBut.Parent = sframe
			cons[i] = newBut.MouseButton1Down:Connect(function()
				info.Text = "Display: "..plrs[i].DisplayName.."\nUsername: "..plrs[i].Name.."\nUserId: "..plrs[i].UserId
				textbox.Text = plrs[i].Name	
			end)
		end
	end
	
	spectBut.MouseButton1Down:Connect(function()
		local plrName = string.lower(textbox.Text)
		local plrList = game.Players:GetPlayers()
		for i = 1, #plrList do
			if plrName == string.lower(string.sub(plrList[i].Name, 1, string.len(plrName))) then
				cam.CameraSubject = plrList[i].Character.Humanoid
				info.Text = "Display: "..plrList[i].DisplayName.."\nUsername: "..plrList[i].Name.."\nUserId: "..plrList[i].UserId
				return
			end
		end
	end)
	
	unspectBut.MouseButton1Down:Connect(function()
		cam.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	end)
	
	UIS.InputBegan:Connect(function(inp, gpe)
		if gpe then return
		elseif inp.KeyCode == Enum.KeyCode.J then
			gui.Enabled = not gui.Enabled
		end
	end)
	
	game.Players.PlayerAdded:Connect(updateList)
	game.Players.PlayerRemoving:Connect(updateList)
	updateList()
end
main()
