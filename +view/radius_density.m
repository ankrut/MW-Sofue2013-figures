function radius_density(varargin)
Q = module.struct(varargin{:});

% destructure
COMP	= Q.component;
AXIS	= Q.axis;
STYLE	= Q.style;

COMP.rar.forEach(@(p) lib.view.plot.curve2D(p,AXIS.tov.radius,AXIS.tov.density,STYLE.rar{:}));