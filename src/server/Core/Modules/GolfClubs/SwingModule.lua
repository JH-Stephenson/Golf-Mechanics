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
            local GolfBall = game.Workspace:FindFirstChild(ServicePlayer.UserId.."'s Golf Ball")
            local GroundRaycast = Raycasting.FindPlayersGround(ServicePlayer)

            if GolfBall then
                if GroundRaycast then
                    local StartPart = Instance.new("Attachment")
                    StartPart.Transparency = 1
                    StartPart.Name = (ServicePlayer.UserId.."'s Start Bezier Part")
                    StartPart.Anchored = true
                    StartPart.CanCollide = false
                    StartPart.CFrame = GolfBall.CFrame
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