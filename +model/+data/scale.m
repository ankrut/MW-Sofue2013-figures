module.constraints

% SI (DEFAULT)
EXPORT.SI.radius		= module.ProfileScaling(1, '{\rm m}');
EXPORT.SI.mass			= module.ProfileScaling(1, '{\rm kg}');
EXPORT.SI.velocity		= module.ProfileScaling(1, '{\rm m/s}');

% astro
EXPORT.astro.radius		= module.ProfileScaling(1/parsec, '{\rm pc}');
EXPORT.astro.mass		= module.ProfileScaling(1/Msun, '{M_\odot');
EXPORT.astro.velocity	= module.ProfileScaling(1E-3, '{\rm km/s}');