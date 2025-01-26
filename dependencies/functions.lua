local functions = {}

local replicatedStorage = game:GetService("ReplicatedStorage")
local userInputService = game:GetService("UserInputService")

function functions:SearchRemotes(Name)
	for Index, Descendant in next, replicatedStorage:GetDescendants() do
		if not Descendant:IsA("RemoteEvent") then continue end

		if Descendant.Name == Name then
			return Descendant
		end
	end
end

function functions:CheckGunHold(Child)
	if Child:IsA("Tool") and Child:FindFirstChild("Ammo") and Child:FindFirstChild("Handle") then
		return true
	end

	return false
end

function functions:ReturnClosestToMouse(LocalPlayer)
	local ClosestDistance = math.huge
	local ClosestPlayer = nil

	for Index, Player in ipairs(game.Players:GetPlayers()) do
		local PlayerCharacter = Player.Character or workspace.Players:FindFirstChild(Player.Name)
		if Player ~= LocalPlayer and PlayerCharacter and PlayerCharacter:FindFirstChild("Humanoid") and PlayerCharacter.Humanoid.Health > 0 then
			local ScreenPos, CameraVisible = workspace.CurrentCamera:WorldToViewportPoint(PlayerCharacter.HumanoidRootPart.Position)
			if CameraVisible then
				local DistanceToMouse = (Vector2.new(userInputService:GetMouseLocation().X, userInputService:GetMouseLocation().Y) - Vector2.new(ScreenPos.X, ScreenPos.Y)).Magnitude
				if DistanceToMouse < ClosestDistance then
					ClosestPlayer = Player
					ClosestDistance = DistanceToMouse
				end
			end
		end
	end

	return ClosestPlayer
end

function functions:ReturnPlayerVelocity(Player)
	local Old = Player.Character.HumanoidRootPart.Position
	task.wait(0.145)
	local Current = Player.Character.HumanoidRootPart.Position
	return (Current - Old) / 0.145
end

return functions
