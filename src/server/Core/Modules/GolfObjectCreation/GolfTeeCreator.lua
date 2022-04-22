local GolfTeeCreator = {}

function GolfTeeCreator.CreateGolfTee(Player, GolfTee)
    if not GolfTee then
        local RaycastingModule = require(game.ServerScriptService.Server.Modules.Raycasting.RaycastingModule)
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

return GolfTeeCreator