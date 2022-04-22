--UserInputService

--Services
local UserInputService = game:GetService("UserInputService")

--Variables
local UserInputRegistered = false

--UserInputServiceRunTime
UserInputService.InputBegan:Connect(function(GameInput, GameProcessedEvent)
    if UserInputRegistered == true then
        if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
            print("Print UserInputRegistered is true.")
        end
    end
end)