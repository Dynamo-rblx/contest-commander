-- @ScriptType: ModuleScript
local globals = {}

globals.Events = {
	gameStarted = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("gameStart"),
	gameEnded = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("gameEnd")
}

globals.Intermission = game:GetService("ReplicatedStorage"):WaitForChild("Values"):WaitForChild("Intermission")
globals.Timer = game:GetService("ReplicatedStorage"):WaitForChild("Values"):WaitForChild("Timer")
globals.Gamemode = game:GetService("ServerStorage"):WaitForChild("Weapons"):WaitForChild("Classic")
globals.intermissionTime = 35
globals.maxGameTime = 600

function globals:CheckTimer()
	return globals.Timer.Value
end

function globals:SetTimer(d)
	globals.Timer.Value = d
end

function globals:ToggleIntermission()
	globals.Intermission.Value = not(globals.Intermission.Value)
	print(globals.Intermission.Value)
end

function globals:SetIntermission(d)
	if d == true then
		globals.Intermission.Value = true
	else
		globals.Intermission.Value = false
	end
end

function globals:GetPlayers()
	local tab = {}
	
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
		table.insert(tab, v)
		task.wait()
	end
	
	return tab
end

function globals:DisplayMessage(msg, t, targets)
	if t == nil then t = 5 end
	if msg == nil then msg = "[NO MESSAGE]" end
	if targets == nil then targets = globals.GetPlayers() end
	
	local m = Instance.new("Message", script)
	m.Name = "Message"
	m.Text = msg
	
	for i, v in pairs(targets) do
		m:Clone().Parent = v:WaitForChild("PlayerGui")
		task.wait()
	end
	
	task.wait(t)
	
	for i, v in pairs(targets) do
		v.PlayerGui:FindFirstChildOfClass("Message"):Destroy()
		task.wait()
	end
	
	m:Destroy()
end


return globals
