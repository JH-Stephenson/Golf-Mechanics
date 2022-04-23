--UserInputRecgonititon

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

--Variables
local UserInputRegister = false

--RunTime
UserInputService.InputBegan:Connect(function(GameInput, GameProcessedEvent)
    if UserInputRegister == true then
        if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
            print("Print UserInputRegistered is true.")
        end
    end
end)