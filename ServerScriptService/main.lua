-- @ScriptType: Script
game.Players.PlayerAdded:Connect(function(plr)
	repeat task.wait()
	plr.Team = game:GetService("Teams"):WaitForChild("Intermission")
	until plr.Team == game:GetService("Teams"):WaitForChild("Intermission")
	
	for i=1, 10 do
		plr:LoadCharacter()
	end
	
	while task.wait() do
		plr.Neutral = false
	end
end)

