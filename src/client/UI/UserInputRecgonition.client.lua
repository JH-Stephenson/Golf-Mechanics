--UserInputRecgonititon

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

--Variables
local UserInputRegister = false

--Events
local GolfDriverClient = ReplicatedStorage.Common.Events.Tools.GolfDriver.GolfDriverClientSend
local GolfDriverServer = ReplicatedStorage.Common.Events.Tools.GolfDriver.GolfDriverClientRecieve

--UI
local PowerBarUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("GolfPowerBar")

--VariableRegister
GolfDriverClient.OnClientEvent:Connect(function()
    UserInputRegister = true
end)

--RunTime
UserInputService.InputBegan:Connect(function(GameInput, GameProcessedEvent)
    if UserInputRegister == true then
        if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
            print("Print UserInputRegistered is true.")

            if PowerBarUI.Enabled == true then
                print("YEET")
            end
        end
    end
end)