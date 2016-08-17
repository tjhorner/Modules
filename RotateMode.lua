-- It's self explanatory

function RotateModel(model,origin,interval)
	local parts = {}
	for i,v in pairs(model:GetChildren()) do
		table.insert(parts,i,v)
		local displacement = origin.CFrame:inverse() * parts[i].CFrame
		parts[i].CFrame = origin.CFrame * CFrame.Angles(0,math.rad(interval),0) * displacement
  end
end

reuturn RotateModel
