local RaycastingModule = {}

function RaycastingModule.FindPlayersGround(ServicePlayer)
    --WorkspacePreRequisites
    local WorkspacePlayer = ServicePlayer.Character
    local WorkspacePlayerRoot = WorkspacePlayer:FindFirstChild("HumanoidRootPart")

    --RaycastingParameters
    local RaycastOrigin = WorkspacePlayerRoot.Position
    local RaycastDirection = Vector3.new(0, -20, 0)
    
    local RaycastParameters = RaycastParams.new()
    RaycastParameters.FilterType = Enum.RaycastFilterType.Blacklist
    RaycastParameters.FilterDescendantsInstances = {WorkspacePlayer}
    RaycastParameters.IgnoreWater = false

    --RaycastCreation
    local Raycast = workspace:Raycast(RaycastOrigin, RaycastDirection, RaycastParameters)

    if Raycast then
        print("Player's Raycast Hit Object: ", Raycast.Instance:GetFullName())
        print("Player's Raycast Hit Object at Position: ", Raycast.Position)
        print("Player's Raycast Hit an Object with the Material: ", Raycast.Material.Name)
        print("Player's Raycast Surface Normal at Position: ", Raycast.Normal)

        return Raycast
    end
end

function RaycastingModule.FindPartGround(PartName)
    --RaycastingParameters
    local RaycastOrigin = PartName.Position
    local RaycastDirection = Vector3.new(0, -20, 0)
    
    local RaycastParameters = RaycastParams.new()
    RaycastParameters.FilterType = Enum.RaycastFilterType.Blacklist
    RaycastParameters.FilterDescendantsInstances = {PartName}
    RaycastParameters.IgnoreWater = false

    --RaycastCreation
    local Raycast = workspace:Raycast(RaycastOrigin, RaycastDirection, RaycastParameters)

    if Raycast then
        print("Player's Raycast Hit Object: ", Raycast.Instance:GetFullName())
        print("Player's Raycast Hit Object at Position: ", Raycast.Position)
        print("Player's Raycast Hit an Object with the Material: ", Raycast.Material.Name)
        print("Player's Raycast Surface Normal at Position: ", Raycast.Normal)

        return Raycast
    end
end

return RaycastingModule