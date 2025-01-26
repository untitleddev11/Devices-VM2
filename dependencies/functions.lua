local functions = {}

local replicatedStorage = game:GetService("ReplicatedStorage")
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")

function functions:SearchRemotes(Name)
	for _, Descendant in next, replicatedStorage:GetDescendants() do
		if Descendant:IsA("RemoteEvent") and Descendant.Name == Name then
			return Descendant
		end
	end
end

function functions:CheckGunHold(Child)
	return Child:IsA("Tool") and Child:FindFirstChild("Ammo") and Child:FindFirstChild("Handle")
end

function functions:ReturnClosestToMouse(LocalPlayer)
	local ClosestDistance = math.huge
	local ClosestPlayer = nil

	for _, Player in next, players:GetPlayers() do
		if not Player:FindFirstChild("DataFolder") then continue end
		
		local PlayerCharacter = Player.Character or workspace.Players:FindFirstChild(Player.Name)

		if Player ~= LocalPlayer and PlayerCharacter then
			local HumanoidRootPart = PlayerCharacter:FindFirstChild("HumanoidRootPart")
			local Humanoid = PlayerCharacter:FindFirstChild("Humanoid")

			if not HumanoidRootPart or not Humanoid then
				HumanoidRootPart = workspace.Players[Player.Name]:FindFirstChild("HumanoidRootPart")
				Humanoid = workspace.Players[Player.Name]:FindFirstChild("Humanoid")
			end

			if HumanoidRootPart and Humanoid and Humanoid.Health > 0 then
				local RootToViewportPoint, IsOnScreen = workspace.CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position)
				if IsOnScreen then
					local MouseLocation = userInputService:GetMouseLocation()
					local DistanceToMouse = (Vector2.new(MouseLocation.X, MouseLocation.Y) - Vector2.new(RootToViewportPoint.X, RootToViewportPoint.Y)).Magnitude
					if DistanceToMouse < ClosestDistance then
						ClosestPlayer = Player
						ClosestDistance = DistanceToMouse
					end
				end
			end
		end
	end

	return ClosestPlayer
end

return functions
