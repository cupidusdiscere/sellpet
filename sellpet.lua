-- CONFIGURATION
local PET_NAME = "Maneki-neko"      -- Replace this with the name of the pet you want to auto-sell
local CHECK_INTERVAL = 5           -- How often to check for the pet (in seconds)

-- SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- WAIT FOR REMOTE (Adjust the name if needed)
local SellPetRemote = ReplicatedStorage:WaitForChild("SellPet", 10)  -- Replace "SellPet" with the actual remote name if different
if not SellPetRemote then
    warn("SellPet RemoteEvent not found!")
    return
end

-- MAIN FUNCTION
local function autoSellPet()
    local inventory = LocalPlayer:FindFirstChild("Pets") or LocalPlayer:WaitForChild("Pets", 10)
    if not inventory then
        warn("No Pets folder found in player!")
        return
    end

    for _, pet in pairs(inventory:GetChildren()) do
        if pet:IsA("Folder") or pet:IsA("Model") or pet:IsA("Instance") then
            if pet.Name == PET_NAME then
                SellPetRemote:FireServer(pet)
                print("Auto-sold pet:", PET_NAME)
            end
        end
    end
end

-- LOOP
while true do
    task.wait(CHECK_INTERVAL)
    pcall(autoSellPet)
end
