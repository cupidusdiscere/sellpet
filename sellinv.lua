-- Auto Sell when "Max Backpack! Go Sell!" message appears

-- Settings
local SELL_MESSAGE = "Max Backpack! Go Sell!"
local SELL_DIALOGUE = "I want to sell my inventory"

-- References
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local sellRemote = replicatedStorage:FindFirstChild("Sell_Inventory") -- change if your game's remote name is different

-- UI text location (you may need to adjust based on the game structure)
local messageLabel = player:WaitForChild("PlayerGui"):WaitForChild("MainUI"):WaitForChild("BackpackStatus"):WaitForChild("TextLabel")

-- Function to trigger sell
local function triggerSell_Inventory()
	if sellRemote then
		print("Triggered Auto Sell")
		sellRemote:FireServer(SELL_DIALOGUE) -- Assuming this is the correct remote and argument
	else
		warn("Sell remote not found!")
	end
end

-- Monitor the UI for the specific sell message
messageLabel:GetPropertyChangedSignal("Max backpack! Go sell!"):Connect(function()
	if messageLabel.Text == SELL_MESSAGE then
		triggerSell()
	end
end)

print("Auto-sell script loaded.")
