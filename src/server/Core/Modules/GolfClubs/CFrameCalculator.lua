--CFrameCalculator

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Module
local CFrameCalculator = {}

function CFrameCalculator.CalculatePart1(HumanoidRootPart, SwingStrength, StartPart)
    --PLEASE JAMES CREATE THE WINDSPEED
    local WindSpeed = 5

    local QuarterWindSpeed = (-SwingStrength / 4)
    local HalfWindSpeed = (-SwingStrength / 2)

    return StartPart.CFrame * CFrame.new(QuarterWindSpeed - WindSpeed, HalfWindSpeed + 5, HalfWindSpeed - -5)
end

--EndModule
return CFrameCalculator