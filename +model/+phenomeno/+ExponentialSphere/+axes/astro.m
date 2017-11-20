MAP		= lib.require(@model.phenomeno.ExponentialSphere.map);
SCALE	= lib.require(@model.phenomeno.ExponentialSphere.scale);

% define axis
EXPORT.radius		= module.ProfileAxis(MAP.radius,			SCALE.astro.radius);
EXPORT.mass			= module.ProfileAxis(MAP.mass,				SCALE.astro.mass);
EXPORT.velocity		= module.ProfileAxis(MAP.velocity,			SCALE.astro.velocity);
