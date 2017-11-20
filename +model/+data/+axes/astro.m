MAP		= lib.require(@model.data.map);
SCALE	= lib.require(@model.data.scale);

% define axis
EXPORT.radius		= module.ProfileAxis(MAP.radius,			SCALE.astro.radius);
EXPORT.mass			= module.ProfileAxis(MAP.mass,				SCALE.astro.mass);
EXPORT.velocity		= module.ProfileAxis(MAP.velocity,			SCALE.astro.velocity);
