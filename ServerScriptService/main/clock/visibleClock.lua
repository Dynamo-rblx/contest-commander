-- @ScriptType: Script


local globals = require(game:GetService("ServerScriptService"):WaitForChild("globals"))

while true do
	task.wait(1)
	local t = tostring(globals:CheckTimer())

	if globals:CheckTimer() > 0 then
		game:GetService("ReplicatedStorage"):WaitForChild("timerTxt"):FireAllClients(t)
	end

end