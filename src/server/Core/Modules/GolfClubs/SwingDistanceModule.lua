--SwingDistanceModule

local SwingDistanceModule = {}

function SwingDistanceModule.GenerateDriverDistance(PowerRate)
    if PowerRate >= 0 and PowerRate <= 20 then
        return(math.random(5, 10))

    elseif PowerRate >= 21 and PowerRate <= 40 then
        return(math.random(7, 15))

    elseif PowerRate >= 41 and PowerRate <= 60 then
        return(math.random(12, 18))

    elseif PowerRate >= 61 and PowerRate <= 80 then
        return(math.random(15, 20))

    elseif PowerRate >= 81 and PowerRate <= 100 then
        return(math.random(18, 22))

    elseif PowerRate >= 101 and PowerRate <= 120 then
        return(math.random(20, 25))

    elseif PowerRate >= 121 and PowerRate <= 140 then
        return(math.random(22, 28))

    elseif PowerRate >= 141 and PowerRate <= 160 then
        return(math.random(25, 30))

    elseif PowerRate >= 161 and PowerRate <= 180 then
        return(math.random(27, 32))

    elseif PowerRate >= 181 and PowerRate <= 200 then
        return(math.random(30, 35))
        
    elseif PowerRate >= 201 and PowerRate <= 220 then
        return(math.random(32, 37))

    elseif PowerRate >= 221 and PowerRate <= 240 then
        return(math.random(35, 40))

    elseif PowerRate >= 241 and PowerRate <= 260 then
        return(math.random(40, 43))

    elseif PowerRate >= 261 and PowerRate <= 280 then
        return(math.random(43, 45))

    elseif PowerRate >= 281 and PowerRate <= 300 then
        return(math.random(45, 47))

    elseif PowerRate >= 301 and PowerRate <= 320 then
        return(math.random(47, 50))
    end
end

return SwingDistanceModule