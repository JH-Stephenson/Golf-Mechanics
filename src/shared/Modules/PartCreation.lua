local PartCreation = {}

function PartCreation.CreateGolfBall(Player, GolfTee)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
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
                end
            end

            CreatedGolfBall.CanCollide = true
            CreatedGolfBall.Shape = Enum.PartType.Ball
            CreatedGolfBall.Parent = game.Workspace

            return CreatedGolfBall
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end

return PartCreation