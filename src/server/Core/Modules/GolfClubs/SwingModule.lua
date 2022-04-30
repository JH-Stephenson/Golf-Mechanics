--SwingModule

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

--RequiredModules
local Raycasting = require(game.ServerScriptService.Server.Core.Modules.Raycasting.RaycastingModule)
local GolfSwingCFrames = require(game.ServerScriptService.Server.Core.Modules.GolfClubs.CFrameCalculator)
local Bezier = require(game.ServerScriptService.Server.Core.Modules.BezierCurves.BezierModule)

--Module
local SwingModule = {}

--RunTime
function SwingModule.HitBall(ServicePlayer, GolfSwingDistance)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            local WorkspaceCharacter = game.Workspace:FindFirstChild(ServicePlayer.Name)
            local CharacterRoot = WorkspaceCharacter:FindFirstChild("HumanoidRootPart")

            local GolfBall = game.Workspace:FindFirstChild(ServicePlayer.UserId.."'s Golf Ball")
            local GroundRaycast = Raycasting.FindPlayersGround(ServicePlayer)

            if GolfBall then
                if GroundRaycast then
                    local BezierPoint1 = Instance.new("Part")
                    BezierPoint1.Transparency = 1
                    BezierPoint1.Name = (ServicePlayer.UserId.."'s Bezier Point 1")
                    BezierPoint1.Parent = game.Workspace
                    BezierPoint1.Size = Vector3.new(0.3, 0.3, 0.3)
                    BezierPoint1.Anchored = true
                    BezierPoint1.CanCollide = false
                    BezierPoint1.CFrame = GolfBall.CFrame

                    local BezierPoint2 = Instance.new("Part")
                    BezierPoint2.Transparency = 1
                    BezierPoint2.Name = (ServicePlayer.UserId.."'s Bezier Point 2")
                    BezierPoint2.Parent = game.Workspace
                    BezierPoint2.Size = Vector3.new(0.3, 0.3, 0.3)
                    BezierPoint2.Anchored = true
                    BezierPoint2.CanCollide = false
                    BezierPoint2.CFrame = GolfSwingCFrames.CalculatePart2(BezierPoint1, GolfSwingDistance)

                    local BezierPoint3 = Instance.new("Part")
                    BezierPoint3.Transparency = 1
                    BezierPoint3.Name = (ServicePlayer.UserId.."'s Bezier Point 3")
                    BezierPoint3.Parent = game.Workspace
                    BezierPoint3.Size = Vector3.new(0.3, 0.3, 0.3)
                    BezierPoint3.Anchored = true
                    BezierPoint3.CanCollide = false
                    BezierPoint3.CFrame = GolfSwingCFrames.CalculatePart3(BezierPoint1, GolfSwingDistance)

                    local BezierPoint4 = Instance.new("Part")
                    BezierPoint4.Transparency = 1
                    BezierPoint4.Name = (ServicePlayer.UserId.."'s Bezier Point 4")
                    BezierPoint4.Parent = game.Workspace
                    BezierPoint4.Size = Vector3.new(0.3, 0.3, 0.3)
                    BezierPoint4.Anchored = true
                    BezierPoint4.CanCollide = false
                    BezierPoint4.CFrame = GolfSwingCFrames.CalculatePart4CFrame(BezierPoint1, GolfSwingDistance)
                    BezierPoint4.Position = GolfSwingCFrames.CalculatePart4Position(BezierPoint4)

                    local GolfAttachment0 = Instance.new("Attachment")
                    GolfAttachment0.Name = ("Attachment0")
                    GolfAttachment0.Parent = GolfBall
                    GolfAttachment0.Position = Vector3.new(1.6, 0, 1)

                    local GolfAttachment1 = Instance.new("Attachment")
                    GolfAttachment1.Name = ("Attachment1")
                    GolfAttachment1.Parent = GolfBall
                    GolfAttachment1.Position = Vector3.new(-1.6, 0, 1)

                    local GolfTrail = ReplicatedStorage.Common.Components.Particles.GolfBallTrail
                    GolfTrail.Parent =  GolfBall
                    GolfTrail.Attachment0 = GolfAttachment0
                    GolfTrail.Attachment1 = GolfAttachment1

                    Bezier.CubicBezier(ServicePlayer, game.Workspace:FindFirstChild(ServicePlayer.UserId.."'s Golf Tee"), BezierPoint1, BezierPoint2, BezierPoint3, BezierPoint4, GolfBall)
                end
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end


--EndModule
return SwingModule