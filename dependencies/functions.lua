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

return functions
