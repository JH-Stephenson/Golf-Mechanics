--UserToolInitialisation

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--ClientPreRequisites
local Player = game.Players.LocalPlayer
local Character = game.Workspace:WaitForChild(Player.Name)

--Events
local ToolActivationEvent = ReplicatedStorage.Common.Events.Tools.ToolActivation

--RunTime
Character.ChildAdded:Connect(function(AddedChild)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if AddedChild:IsA("Tool") then
                AddedChild.Activated:Connect(function()
                    ToolActivationEvent:FireServer(AddedChild.Name)
                end)
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)