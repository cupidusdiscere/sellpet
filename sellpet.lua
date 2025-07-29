-- Auto-click "I want to sell my pet" button in the GUI

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Adjust this path based on how the UI is structured
local function clickSellButton()
    local gui = PlayerGui:FindFirstChild("PetSellGui") or PlayerGui:FindFirstChildOfClass("ScreenGui")
    if gui then
        for _, obj in pairs(gui:GetDescendants()) do
            if obj:IsA("TextButton") and obj.Text == "I want to sell my pet" then
                obj:Activate() -- or obj:Fire(), or obj.MouseButton1Click:Connect
                print("Clicked the sell pet button!")
                return
            end
        end
    else
        warn("Sell GUI not found.")
    end
end

-- Repeat every 5 seconds
while true do
    task.wait(5)
    pcall(clickSellButton)
