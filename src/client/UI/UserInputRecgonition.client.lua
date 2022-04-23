--UserInputRecgonititon

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
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

--RunTime
UserInputService.InputBegan:Connect(function(GameInput, GameProcessedEvent)
    if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
        if PowerBarUI.Enabled == true then
            UserInputRegister = true
            task.spawn(function()
                local Success, ErrorData = pcall(function()
                    while UserInputRegister == true do
                        --START TO EDIT UI HERE
                        print("hi")
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
                    UserInputRegister = false
                end)

                if not Success then
                    print(ErrorData)
                end
            end)
        end
    end
end)