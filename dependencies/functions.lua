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
		if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 then
			local ScreenPos, CameraVisible = workspace.CurrentCamera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
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

function functions:ReturnIsVisible(Part, TargetCharacter)
	local camera = workspace.CurrentCamera
	local screenPosition, onScreen = camera:WorldToViewportPoint(Part.Position)

	if not onScreen then
		return false
	end

	local ray = Ray.new(camera.CFrame.Position, (Part.Position - camera.CFrame.Position).unit * 500)
	local hit, hitPosition = workspace:FindPartOnRay(ray, TargetCharacter)

	return hit == Part or hit == nil
end

return functions
