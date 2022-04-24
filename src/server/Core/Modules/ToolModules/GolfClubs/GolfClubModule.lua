--GolfClubModule

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Events


--Module
local GolfClubModule = {}

function GolfClubModule.InitaliseClub(ServicePlayer, GolfClubName)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end

return GolfClubModule