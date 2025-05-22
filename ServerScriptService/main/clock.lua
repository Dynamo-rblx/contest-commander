-- @ScriptType: Script
local globals = require(game:GetService("ServerScriptService"):WaitForChild("globals"))
local mechanics = require(game:GetService("ServerScriptService"):WaitForChild("mechanics"))

local c1 = 0
local c2 = 0
local c3 = 0

local choice1 = ""
local choice2 = ""
local choice3 = ""

game:GetService("ReplicatedStorage"):WaitForChild("voted").OnServerEvent:Connect(function(plr, choice)
	if choice == 1 then
		c1 += 1
	elseif choice == 2 then
		c2 += 1
	elseif choice == 3 then
		c3 += 1
	end
end)

globals:SetIntermission(true)
globals:SetTimer(globals.intermissionTime)

while true do
	task.wait(1)
	local t = globals:CheckTimer()
	
	if t > 0 then
		globals:SetTimer(t-1)
		
	elseif t <= 0 then
		if globals.Intermission.Value == true then -- If break ends
			
			local gamemodes = game.ServerStorage:WaitForChild("Weapons"):GetChildren()
			
			if #gamemodes > 3 then
				repeat
					table.remove(gamemodes, math.random(1, #gamemodes))
				until #gamemodes == 3
			end
			
			choice1 = gamemodes[1].Name
			choice2 = gamemodes[2].Name
			choice3 = gamemodes[3].Name
			c1, c2, c3 = 0, 0, 0

			game.ReplicatedStorage:WaitForChild("voteTime"):FireAllClients(choice1, choice2, choice3)
			for i=15, 1, -1 do
				globals:SetTimer(i)
				task.wait(1)
			end
			
			if c1 > c2 and c1 > c3 then
				globals.Gamemode = game:GetService("ServerStorage"):WaitForChild("Weapons"):FindFirstChild(choice1)
			elseif c2 > c1 and c2 > c3 then
				globals.Gamemode = game:GetService("ServerStorage"):WaitForChild("Weapons"):FindFirstChild(choice2)
			elseif c3 > c1 and c3 > c2 then
				globals.Gamemode = game:GetService("ServerStorage"):WaitForChild("Weapons"):FindFirstChild(choice3)
			else
				local rand = math.random(1,3)
				if rand == 1 then
					globals.Gamemode = game:GetService("ServerStorage"):WaitForChild("Weapons"):FindFirstChild(choice1)
				elseif rand == 2 then
					globals.Gamemode = game:GetService("ServerStorage"):WaitForChild("Weapons"):FindFirstChild(choice2)
				else
					globals.Gamemode = game:GetService("ServerStorage"):WaitForChild("Weapons"):FindFirstChild(choice3)
				end
			end
			
			print("a")
			globals:ToggleIntermission()
			globals:SetTimer(globals.maxGameTime)
			mechanics:startGame()
			game.ReplicatedStorage:WaitForChild("toggleCam"):FireAllClients()
			globals.Events.gameStarted:FireAllClients()
			
		else -- If game ends
			print("b")
			globals:ToggleIntermission()
			mechanics:endGame()
			game.ReplicatedStorage:WaitForChild("toggleCam"):FireAllClients()
			globals.Events.gameEnded:FireAllClients()

			
			
			globals:SetTimer(globals.intermissionTime)
			

		end
		
	end
	
end