--ToolClient

--Services
local PlayersService = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--ToolClientPreRequisites
local ServicePlayer = PlayersService.LocalPlayer
local WorkspacePlayer = game.Workspace:WaitForChild(ServicePlayer.Name)

--ToolEvents
local ToolActivatedEvent = ReplicatedStorage.Common.Events.Tools.ToolActivatedEvent

--RunTime
WorkspacePlayer.ChildAdded:Connect(function(AddedChild)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if AddedChild:IsA("Tool") then
                AddedChild.Activated:Connect(function()
                    ToolActivatedEvent:FireServer(AddedChild.Name)
                end)

                --GENERATE HITPART (DriverHead) .Touched HERE IF HIT ON GolfBallTouch==True (ATTRIBUTE)
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)