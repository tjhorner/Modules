--[[ 
	
	Designates and opens a hinge joint, then closes it after a set time
	Usage: WaitOpenHinge(The affected model, the origin to rotate around, the angle rotated, ticks given to finish, time it stays open)
	
]]--

function WaitOpenHinge(model, origin, angle, time, set)
	local interval = angle/time	
	-- Creat a function to Open it one rotation
	local function OpenHinge(model,origin,interval)
		-- Calculate its CFrame and transformations
		local function RotateModel(model,origin,interval)
			local parts = {}
			for i,v in pairs(model:GetChildren()) do
				table.insert(parts,i,v)
				local displacement = origin.CFrame:inverse() * parts[i].CFrame
				parts[i].CFrame = origin.CFrame * CFrame.Angles(0,math.rad(interval),0) * displacement
			end
		end
		-- Go to the designated point smoothly
		local a = 0
		repeat
			RotateModel(model,origin,interval)
			wait()
			a = a + 1
		until a == time
	end
	-- Open then close the hinge after a wait
	OpenHinge(model,origin,interval)
	wait(set)
	OpenHinge(model,origin,-1*interval)
	
end

return WaitOpenHinge
