--BezierModule

--Services
local RunService = game:GetService("RunService")

--Modules
local BezierModule = {}

function BezierModule.Lerp(StartPosition, EndPosition, Time)
    return StartPosition + (EndPosition - StartPosition) * Time
end

function BezierModule.QuadraticBezier(Player, GolfTee, StartPart, MidPart, EndPart, TravelPart)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            for QuadraticBezierCounter = 0, 10, 1 do
                local BezierTime = QuadraticBezierCounter / 10

                local QuadraticLerp1 = BezierModule.Lerp(StartPart.Position, MidPart.Position, BezierTime)
                local QuadraticLerp2 = BezierModule.Lerp(MidPart.Position, EndPart.Position, BezierTime)

                local QuadraticCurve = BezierModule.Lerp(QuadraticLerp1, QuadraticLerp2, BezierTime)
                TravelPart.Position = QuadraticCurve

                if QuadraticBezierCounter == 1 then
                    if GolfTee ~= nil then
                        GolfTee:Destroy()
                    end
                end

                RunService.Heartbeat:Wait()
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end

function BezierModule.CubicBezier(Player, GolfTee, StartPart, MidPart1, MidPart2, EndPart, TravelPart)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            for CubicBezierCounter = 0, 10, 1 do
                local BezierTime = CubicBezierCounter / 10

                local CubicLerp1 = BezierModule.Lerp(StartPart.Position, MidPart1.Position, BezierTime)
                local CubicLerp2 = BezierModule.Lerp(MidPart1.Position, MidPart2.Position, BezierTime)
                local CubicLerp3 = BezierModule.Lerp(MidPart2.Position, EndPart.Position, BezierTime)

                local CubicCurve1 = BezierModule.Lerp(CubicLerp1, CubicLerp2, BezierTime)
                local CubicCurve2 = BezierModule.Lerp(CubicLerp2, CubicLerp3, BezierTime)

                local CubicBezierCurve = BezierModule.Lerp(CubicCurve1, CubicCurve2, BezierTime)
                TravelPart.Position = CubicBezierCurve

                if CubicBezierCounter == 1 then
                    if GolfTee ~= nil then
                        GolfTee:Destroy()
                    end
                end

                RunService.Heartbeat:Wait()
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end


return BezierModule
