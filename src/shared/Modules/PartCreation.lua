local PartCreation = {}

function PartCreation.CreateGolfBall(Player, GolfBall, GolfTee)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if not GolfBall then
                local CreatedGolfBall = Instance.new("Part")
                CreatedGolfBall.Material = Enum.Material.Neon
                CreatedGolfBall.Name = (Player.UserId.."'s Golf Ball")
                CreatedGolfBall.Parent = game.ReplicatedStorage.Common.Components.Objects
                CreatedGolfBall.Size = Vector3.new(0.5, 0.5, 0.5)
                
                if GolfTee then
                    CreatedGolfBall.CFrame = GolfTee.CFrame * CFrame.new(0, 0.4, 0)
                else
                    local RaycastingModule = require(script.Parent.RaycastingModule)
                    local RaycastingResult = RaycastingModule.FindPlayersGround(Player)
    
                    if RaycastingResult then
                        local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
    
                        CreatedGolfBall.CFrame = HumanoidRootPart.CFrame * CFrame.new(RaycastingResult.Position.X, RaycastingResult.Position.Y, RaycastingResult.Position.Z - 2)
                        CreatedGolfBall.Position = Vector3.new(CreatedGolfBall.Position.X, RaycastingResult.Position.Y, CreatedGolfBall.Position.Z)
                        CreatedGolfBall.Position = CreatedGolfBall.Position + Vector3.new(0, (CreatedGolfBall.Size.Y / 2), 0)
                    else
                        print("Raycasted Ground could not identify the ground.")
                    end
                end
    
                CreatedGolfBall.CanCollide = true
                CreatedGolfBall.Shape = Enum.PartType.Ball
                CreatedGolfBall.Parent = game.Workspace
    
                return CreatedGolfBall
            else
                print("You've already got a Golf-Ball on the Field!")
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end

function PartCreation.CreateGolfTee(Player, GolfTee)
    if not GolfTee then
        local RaycastingModule = require(script.Parent.RaycastingModule)
        local RaycastingResult = RaycastingModule.FindPlayersGround(Player)

        if RaycastingResult then
            local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")

            local CreatedGolfTee = Instance.new("Part")
            CreatedGolfTee.Name = (Player.UserId.."'s Golf Tee")
            CreatedGolfTee.Parent = game.ReplicatedStorage.Common.Components.Objects
            CreatedGolfTee.Size = Vector3.new(0.3, 0.7, 0.3)

            CreatedGolfTee.CFrame = HumanoidRootPart.CFrame * CFrame.new(RaycastingResult.Position.X, RaycastingResult.Position.Y, RaycastingResult.Position.Z - 2)
            CreatedGolfTee.Position = Vector3.new(CreatedGolfTee.Position.X, RaycastingResult.Position.Y, CreatedGolfTee.Position.Z)
            CreatedGolfTee.Position = CreatedGolfTee.Position + Vector3.new(0, (CreatedGolfTee.Size.Y / 2), 0)

            CreatedGolfTee.CanCollide = true
            CreatedGolfTee.Parent = game.Workspace

            return CreatedGolfTee
        else
            print("Raycasted Ground could not identify the ground.")
        end
    else
        print("You've already got a Golf-Tee on the Field!")
    end
end

return PartCreation