--CFrameCalculator

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Module
local CFrameCalculator = {}

function CFrameCalculator.CalculatePart2(HumanoidRootPart, SwingStrength, StartPart)
    --PLEASE JAMES CREATE THE WINDSPEED
    local WindSpeed = 5

    local QuarterWindSpeed = (-SwingStrength / 4)
    local HalfWindSpeed = (-SwingStrength / 2)

    return StartPart.CFrame * CFrame.new(QuarterWindSpeed - WindSpeed, HalfWindSpeed + 5, HalfWindSpeed - -5)
end

function CFrameCalculator.CalculatePart3(HumanoidRootPart, SwingStrength, StartPart)
    --PLEASE JAMES CREATE THE WINDSPEED
    local WindSpeed = 5

    local QuarterWindSpeed = (-SwingStrength / 4)
    local HalfWindSpeed = (-SwingStrength / 2)

    return StartPart.CFrame * CFrame.new(HalfWindSpeed -WindSpeed, HalfWindSpeed + 7, HalfWindSpeed - 10)
end

function CFrameCalculator.CalculatePart4(HumanoidRootPart, SwingStrength, StartPart)
    --PLEASE JAMES CREATE THE WINDSPEED
    local WindSpeed = 5

    local QuarterWindSpeed = (-SwingStrength / 4)
    local HalfWindSpeed = (-SwingStrength / 2)

    return StartPart.CFrame * CFrame.new(HalfWindSpeed, 10, HalfWindSpeed - -15)
end

--EndModule
return CFrameCalculator