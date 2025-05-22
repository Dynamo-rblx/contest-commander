-- @ScriptType: LocalScript
game:GetService("ReplicatedStorage"):WaitForChild("toggleCam").OnClientEvent:Connect(function()
	if game.Players.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
		game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	else
		game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
	end
end)