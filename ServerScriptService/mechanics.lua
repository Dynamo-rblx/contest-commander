-- @ScriptType: ModuleScript
local mapFolder = game:WaitForChild("ServerStorage"):WaitForChild("Maps")
local mechanics = {}

local globals = require(game:GetService("ServerScriptService"):WaitForChild("globals"))

function mechanics:startGame()
	local mapChosen = mapFolder:GetChildren()[math.random(1,#mapFolder:GetChildren())]
	local author = mapChosen:WaitForChild("Author").Value
	
	globals:DisplayMessage("Loading "..mapChosen.Name.." by "..author..": ("..globals.Gamemode.Name..")", 2)
	
	for i, v in pairs(workspace:WaitForChild("CurrentMap"):GetChildren()) do
		v:Destroy()
	end
	local temp = mapChosen:Clone()
	temp.Parent = workspace:WaitForChild("CurrentMap")
	
	for i, v in pairs(temp:GetChildren()) do
		if v:IsA("SpawnLocation") then
			v.Enabled = true
		end
	end
	
	local teams = {}
	--if globals.Gamemode:FindFirstChild("Teams") then
	--	for i, v in pairs(globals.Gamemode:FindFirstChild("Teams"):GetChildren()) do
	--		local c = v:Clone()
	--		table.insert(teams, c)
	--		c.Parent = game.Teams
			
	--		for i, v in pairs(temp:GetChildren()) do
	--			if v:IsA("SpawnLocation") then
	--				local e = v:Clone()
	--				e.TeamColor = c.TeamColor
	--				e.Parent = v.Parent
	--				e.Position = v.Position
	--				e.Enabled = true
	--				v:Destroy()
	--			end
	--		end
	--	end 
	--end
	local lastTeam = #teams
	
	for i, p in pairs(globals:GetPlayers()) do
		p.Neutral = false
		if p.Team == game.Teams:WaitForChild("Intermission")  then
			p.Team = game:GetService("Teams"):WaitForChild("Active")
			for i, v in pairs(globals.Gamemode:WaitForChild("Weapons"):GetChildren()) do
				v:Clone().Parent = p.Backpack
			end
			
			--if teams ~= {} then
			--	lastTeam += 1
			--	if lastTeam > #teams then
			--		lastTeam = 1
			--		p.Team = teams[lastTeam]
			--	end

			--end
			for i=1, 3 do
				p:LoadCharacter()
			end
			task.wait()
		elseif p.Team == game.Teams:WaitForChild("Joining") then
			p.Team = game.Teams:WaitForChild("Intermission")
		end
		
	end
end

function mechanics:endGame()
	globals:DisplayMessage("Game Ended", 2)
	
	for i, p in pairs(globals:GetPlayers()) do
		for i, item in pairs(p.Backpack:GetChildren()) do
			item:Destroy()
		end
		
		for i, v in pairs(game.Teams:GetChildren()) do
			if v.Name ~= "Active" and v.Name ~= "Intermission" and v.Name ~= "Joining" and v.Name ~= "Sitting Out" then
				v:Destroy()
			end
		end
		
		if p.Team ~= game.Teams:WaitForChild("Sitting Out") then
			p.Team = game:GetService("Teams"):WaitForChild("Intermission")
		end
		p:LoadCharacter()
		task.wait()
	end

end

return mechanics
