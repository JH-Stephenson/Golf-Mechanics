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
                    BezierPoint1.Anchored = true
                    BezierPoint1.CanCollide = false
                    BezierPoint1.CFrame = GolfBall.CFrame

                    local BezierPoint2 = Instance.new("Part")
                    BezierPoint2.Transparency = 1
                    BezierPoint2.Name = (ServicePlayer.UserId.."'s Bezier Point 2")
                    BezierPoint2.Anchored = true
                    BezierPoint2.CanCollide = false
                    BezierPoint2.CFrame = GolfSwingCFrames.CalculatePart1(CharacterRoot, GolfSwingDistance, BezierPoint1)
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