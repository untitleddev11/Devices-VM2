local functions = {}

local replicatedStorage = game:GetService("ReplicatedStorage")

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

return functions
