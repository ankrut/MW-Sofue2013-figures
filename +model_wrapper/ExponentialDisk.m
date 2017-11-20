classdef ExponentialDisk < model.phenomeno.ExponentialDisk.profile
	methods
		function obj = ExponentialDisk(vm)
			module.constraints

			obj = obj@model.phenomeno.ExponentialDisk.profile();

			obj.define(struct(...
				'R', vm.R*parsec,...
				'M', vm.M*Msun ...
			));
		end
		
		function p = compose(obj,R) % R is in SI units (m)
			AX = lib.require(@model.phenomeno.ExponentialDisk.axes.SI);

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