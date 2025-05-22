-- @ScriptType: LocalScript
game:GetService("ReplicatedStorage"):WaitForChild("timerTxt").OnClientEvent:Connect(function(txt)
	script.Parent.Text = txt
end)