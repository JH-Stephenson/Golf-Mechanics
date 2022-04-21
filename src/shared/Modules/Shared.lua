local Shared = {}

function Shared.ClientModuleInitialisation()
    print("Hello World! This message was sent from a Shared Module.")
end

function Shared.ServerModuleInitialisation()
    print("Hello World! This message was sent from a Shared Module.")
end

return Shared