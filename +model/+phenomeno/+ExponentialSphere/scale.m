module.constraints

% RAW
EXPORT.raw.radius			= module.ProfileScaling(1,'R');
EXPORT.raw.density			= module.ProfileScaling(1,'\rho_0');
EXPORT.raw.velocity			= module.ProfileScaling(1,'\sigma');
EXPORT.raw.acceleration		= module.ProfileScaling(1,'\sigma^2/R');
EXPORT.raw.mass				= module.ProfileScaling(1,'M');

% SI
EXPORT.SI.radius = module.ProfileScaling(...
	@(obj) obj.data.R,...
	'\mathrm{m}'...
);

EXPORT.SI.density = module.ProfileScaling(...
	@(obj) obj.data.RHO,...
	'\mathrm{kg/m^3}'...
);

EXPORT.SI.velocity = module.ProfileScaling(...
	@(obj) obj.data.V,...
	'\mathrm{m/s}'...
);

EXPORT.SI.acceleration = module.ProfileScaling(...
	@(obj) EXPORT.SI.velocity.map(obj)^2/EXPORT.SI.radius.map(obj),...
	'\mathrm{m/s^2}'...
);

EXPORT.SI.mass = module.ProfileScaling(...
	@(obj) obj.data.M,...
	'\mathrm{kg}'...
);

% ASTRO SCALE
EXPORT.astro.radius = module.ProfileScaling(...
	@(obj) EXPORT.SI.radius.map(obj)/parsec,...
	'\mathrm{pc}');

EXPORT.astro.f_radius = @(key) module.ProfileScaling(...
	@(obj) EXPORT.SI.radius.map(obj)/parsec/MAGNITUDE.(key),...
	'\mathrm{pc}');

EXPORT.astro.density = module.ProfileScaling(...
	@(obj) EXPORT.SI.density.map(obj)/(Msun/parsec^3),...
	'\mathrm{M_\odot/pc^3}');

EXPORT.astro.velocity = module.ProfileScaling(...
	@(obj) EXPORT.SI.velocity.map(obj)/1E3,...
	'\mathrm{km/s}'...
);

EXPORT.astro.mass = module.ProfileScaling(...
	@(obj) EXPORT.SI.mass.map(obj)/Msun,...
	'M_\odot'...
);