EscortWithSuitcaseActionWalk = EscortWithSuitcaseActionWalk or class(CopActionWalk)
EscortWithSuitcaseActionWalk._walk_anim_velocities = {
	stand = {
		hos = {
			walk = {
				fwd = 138,
				bwd = 70,
				l = 93,
				r = 65
			}
		}
	}
}
EscortWithSuitcaseActionWalk._walk_anim_lengths = {
	stand = {
		hos = {
			walk = {
				fwd = 28,
				bwd = 32,
				l = 45,
				r = 39
			}
		}
	}
}
for pose, stances in pairs(EscortWithSuitcaseActionWalk._walk_anim_lengths) do
	for stance, speeds in pairs(stances) do
		for speed, sides in pairs(speeds) do
			for side, speed in pairs(sides) do
				sides[side] = speed * 0.03333
			end
		end
	end
end
EscortPrisonerActionWalk = EscortPrisonerActionWalk or class(CopActionWalk)
EscortPrisonerActionWalk._walk_anim_velocities = {
	stand = {
		ntl = {
			run = {
				fwd = 329,
				bwd = 170,
				l = 170,
				r = 170
			}
		}
	}
}
EscortPrisonerActionWalk._walk_anim_lengths = {
	stand = {
		ntl = {
			run = {
				fwd = 22,
				bwd = 19,
				l = 25,
				r = 29
			}
		}
	}
}
for pose, stances in pairs(EscortPrisonerActionWalk._walk_anim_lengths) do
	for stance, speeds in pairs(stances) do
		for speed, sides in pairs(speeds) do
			for side, speed in pairs(sides) do
				sides[side] = speed * 0.03333
			end
		end
	end
end
