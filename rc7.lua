local Remote = Instance.new("RemoteEvent", game.ReplicatedStorage)
Remote.Name = "RC7"

Remote.OnServerEvent:Connect(function(plr, code)
	local success, result = pcall(loadstring(code))
	if success then
		print(result)
	else
		warn(result)
	end
end)

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RC7GUI"

local box = Instance.new("TextBox", gui)
box.Size = UDim2.new(0, 400, 0, 50)
box.Position = UDim2.new(0, 100, 0, 100)
box.PlaceholderText = "..."
box.Text = ""
box.ClearTextOnFocus = false
box.TextScaled = true
box.BackgroundColor3 = Color3.fromRGB(30,30,30)
box.TextColor3 = Color3.fromRGB(255,255,255)

box.FocusLost:Connect(function(enter)
	if enter and box.Text ~= "" then
		Remote:FireServer(box.Text)
	end
end)