-- @ScriptType: LocalScript
game:GetService("ReplicatedStorage"):WaitForChild("voteTime").OnClientEvent:Connect(function(c1,c2,c3)
	script.Parent.Enabled = true
	
	script.Parent:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("choice1"):WaitForChild("title").Text = c1
	script.Parent:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("choice1"):WaitForChild("choose"):WaitForChild("LocalScript").Enabled = true
	
	script.Parent:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("choice2"):WaitForChild("title").Text = c2
	script.Parent:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("choice2"):WaitForChild("choose"):WaitForChild("LocalScript").Enabled = true
	
	script.Parent:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("choice3"):WaitForChild("title").Text = c3
	script.Parent:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("choice3"):WaitForChild("choose"):WaitForChild("LocalScript").Enabled = true
end)