TimeSpeedEffectTweakData = TimeSpeedEffectTweakData or class()
function TimeSpeedEffectTweakData:init()
	self:_init_base_effects()
	self:_init_mission_effects()
end
function TimeSpeedEffectTweakData:_init_base_effects()
	self.mask_on = {
		speed = 0.2,
		fade_in_delay = 1.35,
		fade_in = 0.25,
		sustain = 5,
		fade_out = 0.8,
		timer = "pausable"
	}
	self.mask_on_player = {
		speed = 0.5,
		fade_in_delay = self.mask_on.fade_in_delay,
		fade_in = self.mask_on.fade_in,
		sustain = self.mask_on.sustain,
		fade_out = self.mask_on.fade_out,
		timer = self.mask_on.timer,
		affect_timer = "player"
	}
	self.downed = {
		speed = 0.3,
		fade_in = 0.25,
		sustain = 3,
		fade_out = 0.8,
		timer = "pausable"
	}
	self.downed_player = {
		speed = self.downed.speed,
		fade_in = self.downed.fade_in,
		sustain = self.downed.sustain,
		fade_out = self.downed.fade_out,
		timer = self.downed.timer,
		affect_timer = "player"
	}
end
function TimeSpeedEffectTweakData:_init_mission_effects()
	self.mission_effects = {}
	self.mission_effects.quickdraw = {
		speed = 0.2,
		fade_in_delay = 0.5,
		fade_in = 0.3,
		sustain = 5,
		fade_out = 0.8,
		timer = "pausable",
		sync = true
	}
	self.mission_effects.quickdraw_player = {
		speed = 0.5,
		fade_in_delay = self.mission_effects.quickdraw.fade_in_delay,
		fade_in = self.mission_effects.quickdraw.fade_in,
		sustain = self.mission_effects.quickdraw.sustain,
		fade_out = self.mission_effects.quickdraw.fade_out,
		timer = "pausable",
		affect_timer = "player",
		sync = true
	}
end
