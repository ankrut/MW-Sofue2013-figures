module.constraints

% SI SCALE
EXPORT.SI.radius		= module.ProfileScaling(kpc,		'\mathrm{m}');
EXPORT.SI.velocity		= module.ProfileScaling(1E3,		'\mathrm{m/s}');
EXPORT.SI.acceleration	= module.ProfileScaling(kpc/1E6,	'\mathrm{m/s^2}');
EXPORT.SI.mass			= module.ProfileScaling(kpc*1E6/G,	'\mathrm{kg}');

% ASTRO SCALE
EXPORT.astro.radius		= module.ProfileScaling(1E3,		'\mathrm{pc}');
EXPORT.astro.radius_kpc	= module.ProfileScaling(1,			'\mathrm{kpc}');
EXPORT.astro.velocity	= module.ProfileScaling(1,			'\mathrm{km/s}');
EXPORT.astro.mass		= module.ProfileScaling(kpc*1E6/G/Msun,	'M_odot');