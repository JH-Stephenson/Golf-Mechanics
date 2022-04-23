local SharedInitialisation = {}

function SharedInitialisation.ClientModuleInitialisation()
    print("Client - ReplicatedStorage Initialisation Verified.")
end

function SharedInitialisation.ServerModuleInitialisation()
    print("Client Joining - Server Pickup - ReplicatedStorage Initialisation Verified.")
end

return SharedInitialisation