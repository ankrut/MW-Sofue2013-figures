MAP		= lib.require(@model.Sofue2013.map);
SCALE	= lib.require(@model.Sofue2013.scale);

% define axis
EXPORT.radius		= module.ProfileAxis(MAP.radius,			SCALE.astro.radius);
EXPORT.mass			= module.ProfileAxis(MAP.mass,				SCALE.astro.mass);
EXPORT.velocity		= module.ProfileAxis(MAP.velocity,			SCALE.astro.velocity);

EXPORT.velocity_error	= module.ProfileAxis(MAP.velocity_error,SCALE.astro.velocity);
EXPORT.mass_error		= module.ProfileAxis(MAP.mass_error,	SCALE.astro.mass);
