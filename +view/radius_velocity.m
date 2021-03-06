function radius_velocity(varargin)
Q = module.struct(varargin{:});

% destructure
COMP	= Q.component;
AXIS	= Q.axis;
STYLE	= Q.style;

COMP.rar.forEach(@(p) lib.view.plot.curve2D(p,AXIS.tov.radius,AXIS.tov.velocity,STYLE.rar{:}));
lib.view.plot.curve2D(COMP.baryonic,AXIS.data.radius,AXIS.data.velocity,STYLE.baryonic{:});
lib.view.plot.curve2D(COMP.total,AXIS.data.radius,AXIS.data.velocity,STYLE.total{:});

lib.view.plot.errorbar(...
	'profile',	COMP.sofue2013,...
	'x',		AXIS.sof13.radius,...
	'y',		AXIS.sof13.velocity,...
	'dy',		AXIS.sof13.velocity_error,...
	'errorbar',	STYLE.errorbar...
);