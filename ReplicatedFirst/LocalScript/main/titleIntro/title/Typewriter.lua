-- @ScriptType: LocalScript
---- Variables
--local startroom = game.Workspace:WaitForChild("starterRoom")
--local tw = startroom:WaitForChild("tw")
--local twprompt = tw:WaitForChild("activationkey"):WaitForChild("ProximityPrompt")
--local vent = startroom:WaitForChild("vent")
--local ventDestination = vent:WaitForChild("destination").Value
--local ventDestColor = vent:WaitForChild("destColor").Value
--local plr = game.Players.LocalPlayer
--local char = plr.Character
--local scenebox = game.ReplicatedStorage:WaitForChild("Scenes")
--local eventBox = game.ReplicatedStorage:WaitForChild("Events")
--local thoughts = plr.PlayerGui:WaitForChild("txt"):WaitForChild("Frame"):WaitForChild("text")
--local begin = eventBox:WaitForChild("Begin")
--local hum = char:WaitForChild("Humanoid")
local tI = TweenInfo.new(2)
local tI2 = TweenInfo.new(4)
local t = game:GetService("TweenService")
local twen1 = t:Create(script.Parent.Parent,tI,{BackgroundTransparency=1})
local twen2 = t:Create(script.Parent,tI,{TextTransparency=1, TextSize=100})
local twen3 = t:Create(script.Parent.Parent.Parent:WaitForChild("vignetteEffect"),tI,{ImageTransparency=1})
--local twen3 = t:Create(vent,tI2,{Position=ventDestination})

---- Functions
--function PlayScene(num)
--	print("Began Search")
--	local scene = scenebox:FindFirstChild(num)
--	print("Found Scene")
--	local txt = scene:FindFirstChild("dialog").Value
--	print("Found Dialog")
--	local s = hum:LoadAnimation(scene)
--	print("Loaded Scene")
--	if scene:FindFirstChildOfClass("Sound") then
--		scene:FindFirstChildOfClass("Sound"):Play()
--		print("Played SFX")
--	end
--	s:Play()
--	for i = 1, #txt, 1 do
--		wait()
--		thoughts.Text = string.sub(txt, 1, i)
--	end
--end

--function Think(txt)
--	for i = 1, #txt, 1 do
--		wait()
--		thoughts.Text = string.sub(txt, 1, i)
--	end
--end



function Type(GUI, txt)
	for i = 1, #txt, 1 do
		task.wait()
		GUI.Text = string.sub(txt, 1, i)
	end
end

-- Intro --
Type(script.Parent, "Contest Commander") -- Repeat this all you want with different text.

task.wait(4)
script.Parent.TextColor3 = Color3.fromRGB(57, 255, 64)
task.wait(2)

twen3:Play()
twen2:Play()
script.Parent.TextTruncate = Enum.TextTruncate.AtEnd
twen1:Play()
task.wait(3)

script.Parent.Parent.Parent.Enabled = false

task.wait(5)