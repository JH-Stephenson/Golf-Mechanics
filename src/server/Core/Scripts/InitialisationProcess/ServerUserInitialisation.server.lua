--ServerUserInitialisation

--Services
local PlayersService = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Modules
local DataStorageModule = require(game.ServerScriptService.Server.Core.Modules.DataStorage.DataStorageModule)
local SharedInitialisationModule = require(ReplicatedStorage.Common.Modules.SharedInitialisation)

--RunTime
PlayersService.PlayerAdded:Connect(function(ServicePlayer)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            print(ServicePlayer.UserId.." has been initalised on the Server.")
            DataStorageModule.SetupPlayer(ServicePlayer)
            SharedInitialisationModule.ServerModuleInitialisation()
        end)

        if not Success then 
            print(ErrorData)
        end
    end)
end)