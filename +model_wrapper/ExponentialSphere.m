classdef ExponentialSphere < model.phenomeno.ExponentialSphere.profile
	methods
		function obj = ExponentialSphere(vm)
			module.constraints

			obj = obj@model.phenomeno.ExponentialSphere.profile('inner bulge');

			obj.define(struct(...
				'RHO0',	vm.RHO*Msun/parsec^3,...
				'R',	vm.R*parsec ...
			));
		end
		
		function p = compose(obj,R) % R is in SI units (m)
			AX = lib.require(@model.phenomeno.ExponentialSphere.axes.SI);

			% set radius
			obj.set('radius', R./obj.data.R);

			% create data set baryonic contribution (astro unit system)
			p = module.ProfileData();
			p.set('radius',		R);
			p.set('velocity',	AX.velocity.map(obj));
			p.set('mass',		AX.mass.map(obj));
		end
	end
end