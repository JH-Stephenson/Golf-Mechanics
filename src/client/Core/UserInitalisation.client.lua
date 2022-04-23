--UserInitialisation

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Modules
local SharedInitialisationModule = require(ReplicatedStorage.Common.Modules.SharedInitialisation)

--RunTime
print(game.Players.LocalPlayer.UserId.."'s has had their Client Initialised.")
SharedInitialisationModule.ClientModuleInitialisation()