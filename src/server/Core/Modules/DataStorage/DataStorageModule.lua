--DataStorageModule

--Services
local DataStoreService = game:GetService("DataStoreService")

--Tables
local CurrentPlayerData = {}

--Module
local DataStorageModule = {}

function DataStorageModule.DataStoreName()
    return("PGM | v0.01")
end

function DataStorageModule.SetupPlayer(ServicePlayer)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            local CurrentDataStore = DataStoreService:GetDataStore(DataStorageModule.DataStoreName())
            local CheckPlayersData = CurrentDataStore:GetAsync(ServicePlayer.UserId)
        
            local PlayerJoinedTable = CurrentPlayerData[ServicePlayer.UserId] or {};
            CurrentPlayerData[ServicePlayer.UserId] = PlayerJoinedTable
        
            if CheckPlayersData == nil then
                print(ServicePlayer.UserId.."'s not visited this game before!")
        
                --SetupData
                PlayerJoinedTable["£"] = 1
        
                PlayerJoinedTable["Player Expierence"] = 1
                PlayerJoinedTable["Player Strength"] = 1
                PlayerJoinedTable["Player Accuracy"] = 1
                PlayerJoinedTable["Player Putting Skill"] = 1
        
                PlayerJoinedTable["Player Catering Expierence"] = 1
                PlayerJoinedTable["Player Hospitality Expierence"] = 1
                PlayerJoinedTable["Player Operational Expierence"] = 1
                PlayerJoinedTable["Player Hallstaff Expierence"] = 1
                PlayerJoinedTable["Player Hosting Expierence"] = 1
                PlayerJoinedTable["Player Roving Expierence"] = 1
            else
                print(ServicePlayer.UserId.."'s has visited this game before!")
        
                --SetDataFromDataStore
                PlayerJoinedTable["£"] = CheckPlayersData["£"]
        
                PlayerJoinedTable["Player Expierence"] = CheckPlayersData["Player Expierence"]
                PlayerJoinedTable["Player Strength"] = CheckPlayersData["Player Strength"]
                PlayerJoinedTable["Player Accuracy"] = CheckPlayersData["Player Accuracy"]
                PlayerJoinedTable["Player Putting Skill"] = CheckPlayersData["Player Putting Skill"]
        
                PlayerJoinedTable["Player Catering Expierence"] = CheckPlayersData["Player Catering Expierence"]
                PlayerJoinedTable["Player Hospitality Expierence"] = CheckPlayersData["Player Hospitality Expierence"]
                PlayerJoinedTable["Player Operational Expierence"] = CheckPlayersData["Player Operational Expierence"]
                PlayerJoinedTable["Player Hallstaff Expierence"] = CheckPlayersData["Player Hallstaff Expierence"]
                PlayerJoinedTable["Player Hosting Expierence"] = CheckPlayersData["Player Hosting Expierence"]
                PlayerJoinedTable["Player Roving Expierence"] = CheckPlayersData["Player Roving Expierence"]
            end
            --Create Public Variables
            local PublicPlayerLeaderstats = Instance.new("Folder")
            PublicPlayerLeaderstats.Name = ("leaderstats")
            PublicPlayerLeaderstats.Parent = ServicePlayer
        
            local PlayersMoney = Instance.new("IntValue")
            PlayersMoney.Parent = PublicPlayerLeaderstats
            PlayersMoney.Name = ("£")
            PlayersMoney.Value = PlayerJoinedTable["£"]
        
            local PlayersExpierence = Instance.new("IntValue")
            PlayersExpierence.Parent = PublicPlayerLeaderstats
            PlayersExpierence.Name = ("XP")
            PlayersExpierence.Value = PlayerJoinedTable["Player Expierence"]
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end

return DataStorageModule