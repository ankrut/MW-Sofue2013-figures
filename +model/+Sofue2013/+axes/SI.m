MAP		= lib.require(@model.Sofue2013.map);
SCALE	= lib.require(@model.Sofue2013.scale);

% define axis
EXPORT.radius		= module.ProfileAxis(MAP.radius,			SCALE.SI.radius);
EXPORT.mass			= module.ProfileAxis(MAP.mass,				SCALE.SI.mass);
EXPORT.velocity		= module.ProfileAxis(MAP.velocity,			SCALE.SI.velocity);
