--ToolClient

--Services
local PlayersService = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--ToolClientPreRequisites
local ServicePlayer = PlayersService.LocalPlayer
local WorkspacePlayer = game.Workspace:WaitForChild(ServicePlayer.Name)

--ToolEvents
local ToolActivatedEvent = ReplicatedStorage.Common.Events.Tools.ToolActivatedEvent

--GolfClubEvents
local DriverHit = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfDriver.HitGolfBall

--RunTime
WorkspacePlayer.ChildAdded:Connect(function(AddedChild)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if AddedChild:IsA("Tool") then
                local ToolHead = AddedChild:FindFirstChild("Head")

                AddedChild.Activated:Connect(function()
                    ToolActivatedEvent:FireServer(AddedChild.Name)
                end)

                if ToolHead then
                    ToolHead.Touched:Connect(function(TouchedPart)
                        if TouchedPart.Name == (ServicePlayer.UserId.."'s Golf Ball") then
                            local ToolHeadDebounce = ToolHead:GetAttribute("GolfBallTouch")

                            if ToolHeadDebounce == ("True") then
                                ToolHead:SetAttribute("GolfBallTouch", "False")

                                if AddedChild.Name == ("Driver") then
                                    DriverHit:FireServer()
                                end
                            end
                        end
                    end)
                end
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)