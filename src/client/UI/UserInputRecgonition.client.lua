--UserInputRecgonititon

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

--Variables
local UserInputRegister = false
local UserPowerRate = 0

--RequestedTool
local DriverRequested = false
local IronRequested = false
local PutterRequested = false
local WedgeRequested = false
local WoodRequested = false

--Events
local GolfClubClient = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfClubClientRecieve
local GolfClubServer = ReplicatedStorage.Common.Events.Tools.GolfClubs.GolfClubServerSend

--UI
local PowerBarUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("GolfPowerBar")
local PowerSlider = PowerBarUI.OuterFrame.InnerFrame.PowerSlider

--RequestedToolClients
GolfClubClient.OnClientEvent:Connect(function(ClubName)
    if ClubName == ("Driver") then
        DriverRequested = true
    elseif ClubName == ("Iron") then
        IronRequested = true
    elseif ClubName == ("Putter") then
        PutterRequested = true
    elseif ClubName == ("Wedge") then
        WedgeRequested = true
    elseif ClubName == ("Wood") then
        WoodRequested = true
    end
end)

--RunTime
UserInputService.InputBegan:Connect(function(GameInput, GameProcessedEvent)
    if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
        if PowerBarUI.Enabled == true then
            UserInputRegister = true
            task.spawn(function()
                local Success, ErrorData = pcall(function()
                    while UserInputRegister == true do
                        for UserInputPowerRate = 1, 320, 1 do
                            PowerSlider.Position = UDim2.new(0, UserInputPowerRate, 0, 0)
                            if UserInputRegister == false then
                                break
                            end

                            UserPowerRate = UserInputPowerRate
                            task.wait()

                            if UserInputPowerRate == 320 then
                                for UserInputPowerRate = 320, 1, -1 do
                                    PowerSlider.Position = UDim2.new(0, UserInputPowerRate, 0, 0)
                                    if UserInputRegister == false then
                                        break
                                    end

                                    UserPowerRate = UserInputPowerRate
                                    task.wait()
                                end
                            end
                        end
                        task.wait()
                    end
                end)

                if not Success then
                    print(ErrorData)
                end
            end)
        end
    end
end)

UserInputService.InputEnded:Connect(function(GameInput, GameProcessedEvent)
    if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
        if PowerBarUI.Enabled == true then
            task.spawn(function()
                local Success, ErrorData = pcall(function()
                    if DriverRequested == true then
                        UserInputRegister = false
                        DriverRequested = false
                        GolfClubServer:FireServer("Driver", UserPowerRate)
                        
                    elseif IronRequested == true then
                        UserInputRegister = false
                        IronRequested = false
                        GolfClubServer:FireServer("Iron", UserPowerRate)

                    elseif PutterRequested == true then
                        UserInputRegister = false
                        PutterRequested = false
                        GolfClubServer:FireServer("Putter", UserPowerRate)

                    elseif WedgeRequested == true then
                        UserInputRegister = false
                        WedgeRequested = false
                        GolfClubServer:FireServer("Wedge", UserPowerRate)

                    elseif WoodRequested == true then
                        UserInputRegister = false
                        WoodRequested = false
                        GolfClubServer:FireServer("Wood", UserPowerRate)
                    end
                end)

                if not Success then
                    print(ErrorData)
                end
            end)
        end
    end
end)