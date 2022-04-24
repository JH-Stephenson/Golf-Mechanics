--ToolServer

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--ToolEvents
local ToolActivatedEvent = ReplicatedStorage.Common.Events.Tools.ToolActivatedEvent

--RunTime
ToolActivatedEvent.OnServerEvent:Connect(function(ServicePlayer, ToolName)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            print(ToolName)
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)