module.constraints

AX.astro = lib.require(@model.phenomeno.ExponentialDisk.axes.astro);

func = @(obj) @(r) AX.astro.velocity.map(obj.set('radius', @(obj) r*parsec/obj.data.R));
EXPORT.astro.velocity = module.ProfileMapping(func);

