NewShotgunBase = NewShotgunBase or class(NewRaycastWeaponBase)
function NewShotgunBase:init(...)
	NewShotgunBase.super.init(self, ...)
end
NewFlamethrowerBase = NewFlamethrowerBase or class(NewRaycastWeaponBase)
FlamethrowerEffectExtension = FlamethrowerEffectExtension or class(NewRaycastWeaponBase)
SaigaShotgun = SaigaShotgun or class(NewShotgunBase)
GrenadeLauncherBase = GrenadeLauncherBase or class(NewRaycastWeaponBase)
GrenadeLauncherContinousReloadBase = GrenadeLauncherContinousReloadBase or class(NewRaycastWeaponBase)
AkimboWeaponBase = AkimboWeaponBase or class(NewRaycastWeaponBase)
AkimboWeaponBase.AKIMBO = true
BowWeaponBase = BowWeaponBase or class(NewRaycastWeaponBase)
