frho	= @(r) exp(-r);
fM		= @(r) 1 - exp(-r).*(1 + r + 1/2*r.^2);

EXPORT.radius = module.ProfileMapping(...
	@(obj) obj.data.radius,...
	'r' ...
);

EXPORT.density = module.ProfileMapping(...
	@(obj) frho(obj.data.radius),...
	'\Sigma(r)'...
);

EXPORT.mass = module.ProfileMapping(...
	@(obj) fM(obj.data.radius),...
	'M(r)'...
);

EXPORT.velocity = module.ProfileMapping(...
	@(obj) sqrt(EXPORT.mass.map(obj)./obj.data.radius),...
	'v(r)'...
);

EXPORT.acceleration = module.ProfileMapping(...
	@(obj) EXPORT.velocity.map(obj).^2./obj.data.radius,...
	'a(r)'...
);