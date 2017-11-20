fS = @(r) exp(-r);				% surface mass density in units of Sigma0
fM = @(r) 1 - exp(-r).*(1 + r);	% in units of M = 2 pi Sigma0 R�
fV = @(y) sqrt(2)*y.*sqrt(besseli(0,y).*besselk(0,y) - besseli(1,y).*besselk(1,y)); % y = r/(2*R)

EXPORT.radius = module.ProfileMapping(...
	@(obj) obj.data.radius,...
	'r' ...
);

EXPORT.surface_density = module.ProfileMapping(...
	@(obj) fS(obj.data.radius),...
	'\Sigma(r)'...
);

EXPORT.mass = module.ProfileMapping(...
	@(obj) fM(obj.data.radius),...
	'M(r)'...
);

EXPORT.velocity = module.ProfileMapping(...
	@(obj) fV(obj.data.radius./2),...
	'v(r)'...
);

EXPORT.acceleration = module.ProfileMapping(...
	@(obj) EXPORT.velocity.map(obj).^2./obj.data.radius,...
	'a(r)'...
);