MAP		= lib.require(@model.phenomeno.ExponentialDisk.map);
SCALE	= lib.require(@model.phenomeno.ExponentialDisk.scale);

% define axis
EXPORT.radius		= module.ProfileAxis(MAP.radius,			SCALE.SI.radius);
EXPORT.mass			= module.ProfileAxis(MAP.mass,				SCALE.SI.mass);
EXPORT.velocity		= module.ProfileAxis(MAP.velocity,			SCALE.SI.velocity);
