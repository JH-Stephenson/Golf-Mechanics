--ToolServer

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--ToolEvents
local ToolActivatedEvent = ReplicatedStorage.Common.Events.ToolActivatedEvent

--RunTime
ToolActivatedEvent.OnServerEvent:Connect(function(ServicePlayer, ToolName)
    
end)