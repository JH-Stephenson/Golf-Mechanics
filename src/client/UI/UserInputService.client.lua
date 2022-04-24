--UserInputService

--Services
local PlayersService = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

--PlayerVariables
local ServicePlayer = PlayersService.LocalPlayer
local PlayerGui = ServicePlayer.PlayerGui

local PowerBarUI = PlayerGui:WaitForChild("GolfPowerBar")
local PowerBar = PowerBarUI.OuterFrame.InnerFrame.PowerSlider

--Events
local ClubClientActivate = ReplicatedStorage.Common.Events.Tools.GolfClubs.ClubClientActivate
local ClubPowerBarSubmit = ReplicatedStorage.Common.Events.Tools.GolfClubs.ClubPowerBarSubmit

--Variables
local UserInputRegister = false
local UserPowerRate = 0

--ToolInUse
local Driver = false
local Iron = false
local Putter = false
local Wedge = false
local Wood = false

ClubClientActivate.OnClientEvent:Connect(function(ClubType)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if ClubType == ("Driver") then
                Driver = true
            elseif ClubType == ("Iron") then
                Iron = true
            elseif ClubType == ("Putter") then
                Putter = true
            elseif ClubType == ("Wedge") then
                Wedge = true
            elseif ClubType == ("Wood") then
                Wood = true
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)

UserInputService.InputBegan:Connect(function(GameInput, GameProcessedEvent)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if GameInput.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch or Enum.UserInputType.Gamepad1 then
                if PowerBarUI.Enabled == true then
                    UserInputRegister = true

                    while UserInputRegister == true do
                        for PowerCounter = 1, 320, 1 do
                            PowerBar.Position = UDim2.new(0, PowerCounter, 0, 0)
    
                            if UserInputRegister == false then
                                break
                            end
    
                            UserPowerRate = PowerCounter
                            task.wait()
    
                            if PowerCounter == 320 then
                                for PowerCounter = 320, 1, -1 do
                                    PowerBar.Position = UDim2.new(0, PowerCounter, 0, 0)

                                    if UserInputRegister == false then
                                        break
                                    end

                                    UserPowerRate = PowerCounter
                                    task.wait()
                                end
                            end
                        end
                        task.wait()
                    end
                end
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)

UserInputService.InputEnded:Connect(function(GameInput, GameProcessedEvent)
    task.spawn(function()
        local Success, ErrorData = pcall(function()
            if Driver == true then
                UserInputRegister = false
                Driver = false
                ClubPowerBarSubmit:FireServer("Driver", UserPowerRate)
            elseif Iron == true then
                UserInputRegister = false
                Iron = false
                ClubPowerBarSubmit:FireServer("Iron", UserPowerRate)
            elseif Putter == true then 
                UserInputRegister = false
                Putter = false
                ClubPowerBarSubmit:FireServer("Putter", UserPowerRate)
            elseif Wedge == true then
                UserInputRegister = false
                Wedge = false
                ClubPowerBarSubmit:FireServer("Wedge", UserPowerRate)
            elseif Wood == true then
                UserInputRegister = false
                Wood = false
                ClubPowerBarSubmit:FireServer("Wood", UserPowerRate)
            end
        end)

        if not Success then
            print(ErrorData)
        end
    end)
end)