--Server Player Initialisation

--Services
local PlayersService = game:GetService("Players")

--Modules
local DataStoreModule = require(game.ServerScriptService.Server.Core.Modules.DataStorage.DataStorageModule)

--RunTime
PlayersService.PlayerAdded:Connect(function(Player)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            print(Player.UserId.." has joined the game.")
        end)

        if not Success then 
            print(ErrorData)
        end
    end)
end)