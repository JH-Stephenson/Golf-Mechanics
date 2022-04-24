local GolfTeeCreator = {}

function GolfTeeCreator.CreateGolfTee(ServicePlayer, GolfTee)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if not GolfTee then
                local RaycastingModule = require(game.ServerScriptService.Server.Core.Modules.Raycasting.RaycastingModule)
                local RaycastingResult = RaycastingModule.FindPlayersGround(ServicePlayer)
        
                if RaycastingResult then
                    local WorkspaceCharacter = ServicePlayer.Character
                    local HumanoidRootPart = WorkspaceCharacter:FindFirstChild("HumanoidRootPart")
        
                    local CreatedGolfTee = game.ReplicatedStorage.Common.Components.Objects.TeeObject:Clone()
                    CreatedGolfTee.Name = (ServicePlayer.UserId.."'s Golf Tee")
                    CreatedGolfTee.Parent = game.ReplicatedStorage.Common.Components.Objects
                    CreatedGolfTee.Size = Vector3.new(0.3, 0.7, 0.3)
        
                    CreatedGolfTee.CFrame = HumanoidRootPart.CFrame * CFrame.new(RaycastingResult.Position.X, RaycastingResult.Position.Y, RaycastingResult.Position.Z - 2)
                    CreatedGolfTee.Position = Vector3.new(CreatedGolfTee.Position.X, RaycastingResult.Position.Y, CreatedGolfTee.Position.Z)
                    CreatedGolfTee.Position = CreatedGolfTee.Position + Vector3.new(0, (CreatedGolfTee.Size.Y / 2), 0)
        
                    CreatedGolfTee.CanCollide = true
                    CreatedGolfTee.Anchored = true
                    CreatedGolfTee.Parent = game.Workspace

                    local TeeTool = WorkspaceCharacter:FindFirstChild("Tee")
                    TeeTool:Destroy()

                    return CreatedGolfTee
                else
                    print("Raycasted Ground could not identify the ground.")
                end
            else
                print("You've already got a Golf-Tee on the Field!")
            end
        end)
        
        if not Success then
            print(ErrorData)
        end
    end)
end

return GolfTeeCreator