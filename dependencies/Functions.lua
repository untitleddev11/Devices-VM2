local Functions = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function Functions:SearchRemotes(Name)
	for Index, Descendant in next, ReplicatedStorage:GetDescendants() do
		if not Descendant:IsA("RemoteEvent") then continue end

		if Descendant.Name == Name then
			return Descendant
		end
	end
end

return Functions
