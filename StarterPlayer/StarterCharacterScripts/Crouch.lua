-- @ScriptType: LocalScript
local UserInputService = game:GetService("UserInputService")
local a = Instance.new("Animation")
a.AnimationId = "rbxassetid://79553602015916"
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()

local anim = char:WaitForChild("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(a)

local function onInputBegan(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.C then
		-- Get the player's character and humanoid
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		
		if humanoid then
			-- Change the humanoid's properties to make the character crouch
			
			humanoid.WalkSpeed = 0 -- Slows down the player.
			
			-- Add more properties and actions as needed for crouching

			anim:Play()
		end
	end
end

local function onInputEnded(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.C then
		-- Get the player's character and humanoid
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			-- Reset the humanoid's properties to stand up

			humanoid.WalkSpeed = 16 -- Changes the speed back to normal (the walkspeed in my game is 12 so you can change it to your game's walkspeed).
			
			-- Reset other properties and actions as needed
			anim:Stop()
		end
	end
end

-- Connect the input events
UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputEnded:Connect(onInputEnded)

-- If you want to add some, you can add animations to add some life to your crouching.