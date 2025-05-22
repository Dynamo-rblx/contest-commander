-- @ScriptType: Script
game:GetService("ReplicatedStorage"):WaitForChild("SitOut").OnServerEvent:Connect(function(plr, switch)
	if switch == true then
		plr.Team = game.Teams:WaitForChild("Sitting Out")
		plr:LoadCharacter()
	elseif switch == false then
		plr.Team = game.Teams:WaitForChild("Intermission")
		plr:LoadCharacter()
	end
	
end)