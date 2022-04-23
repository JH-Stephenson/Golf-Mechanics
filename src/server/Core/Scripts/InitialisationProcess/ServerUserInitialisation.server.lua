--ServerUserInitialisation

--Services
local PlayersService = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Modules
local DataStorageModule = require(game.ServerScriptService.Server.Core.Modules.DataStorage.DataStorageModule)
local SharedInitialisationModule = require(ReplicatedStorage.Common.Modules.SharedInitialisation)

--RunTime
PlayersService.PlayerAdded:Connect(function(Player)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            print(Player.UserId.." has been initialisaed on the Server.")
            DataStorageModule.SetupPlayer(Player)
            SharedInitialisationModule.ServerModuleInitialisation()
        end)

        if not Success then 
            print(ErrorData)
        end
    end)
end)