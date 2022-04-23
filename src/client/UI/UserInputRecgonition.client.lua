--UserInputRecgonititon

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

--Variables
local UserInputRegister = false
local UserPowerRate = 0

--Events
local GolfDriverClient = ReplicatedStorage.Common.Events.Tools.GolfDriver.GolfDriverClientSend
local GolfDriverServer = ReplicatedStorage.Common.Events.Tools.GolfDriver.GolfDriverClientRecieve

--UI
local PowerBarUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("GolfPowerBar")
local PowerSlider = PowerBarUI.OuterFrame.InnerFrame.PowerSlider

--VariableRegister
GolfDriverClient.OnClientEvent:Connect(function()
    UserInputRegister = true
end)

--RunTime
UserInputService.InputBegan:Connect(function(GameInput, GameProcessedEvent)
    if UserInputRegister == true then
        if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
            --print("UserInputRegistered is true.")

            if PowerBarUI.Enabled == true then
                for i = 1, 20, 1 do
                    print(i)
                end
            end
        end
    end
end)

UserInputService.InputEnded:Connect(function(GameInput, GameProcessedEvent)
    if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
        UserInputRegister = false
    end
end)