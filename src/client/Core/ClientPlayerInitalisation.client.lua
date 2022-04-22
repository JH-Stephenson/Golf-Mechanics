--Client Player Initalisation

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--PreRequisites
local CurrentPlayer = game.Players.LocalPlayer
local CurrentCharacter = game.Workspace:WaitForChild(CurrentPlayer.Name)

--Events
local ToolActivatedEvent = ReplicatedStorage.Common.Events.ToolActivatedEvent

--RunTime
CurrentCharacter.ChildAdded:Connect(function(AddedChild)
    if AddedChild:IsA("Tool") then
        AddedChild.Activated:Connect(function()
            task.spawn(function()
                local Success, ErrorData = pcall(function()
                    ToolActivatedEvent:FireServer(AddedChild.Name)
                end)

                if not Success then
                    print(ErrorData)
                end
            end)
        end)
    end
end)