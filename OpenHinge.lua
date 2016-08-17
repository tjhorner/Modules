--[[
	Designates a Hinge Joint and opens it when called.
	Usuage: OpenHinge(Model to move, the origin, the angle to turn around the origin, ticks taken to turn)
--]]

function OpenHinge(model,origin,angle,time)
	local interval = angle/time
	local function RotateModel(model,origin,interval)
		local parts = {}
		for i,v in pairs(model:GetChildren()) do
			table.insert(parts,i,v)
			local displacement = origin.CFrame:inverse() * parts[i].CFrame
			parts[i].CFrame = origin.CFrame * CFrame.Angles(0,math.rad(interval),0) * displacement
		end
	end
	local a = 0
	repeat
		RotateModel(model,origin,interval)
		wait()
		a = a + 1
	until a == time
end

return OpenHinge
