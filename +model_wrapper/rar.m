classdef rar < model.tov.rar.profile
	methods
		function obj=rar(varargin)
			obj = obj@model.tov.rar.profile(varargin{:});
		end
		
		function p=interpolate(obj,R) % R is in SI units
			% load axes
			AX_TOC		= lib.require(@model.tov.rar.axes.SI);
			AX_VAC		= lib.require(@model.tov.pointlike.axes.SI);

			% get vacuum solution (after cutoff)
			profileVacuum = obj.getVacuumSolution('rmax',R(end));
			

			p1 = module.ProfileData()...
				.set('radius',		AX_TOC.radius.map(obj))...
				.set('mass',		AX_TOC.mass.map(obj))...
				.set('velocity',	AX_TOC.velocity.map(obj));

			p2 = module.ProfileData()...
				.set('radius',		AX_VAC.radius.map(profileVacuum))...
				.set('mass',		AX_VAC.mass.map(profileVacuum))...
				.set('velocity',	AX_VAC.velocity.map(profileVacuum));

			% interpolate total velocities
			LOG_V_TOT = interp1(...
				log([p1.data.radius; p2.data.radius(2:end)]),...
				log([p1.data.velocity; p2.data.velocity(2:end)]),...
				log(R), 'spline');
			
			LOG_M_TOT = interp1(...
				log([p1.data.radius; p2.data.radius(2:end)]),...
				log([p1.data.mass; p2.data.mass(2:end)]),...
				log(R), 'spline');
			
			p = module.ProfileData('total');
			p.set('radius',		R);
			p.set('mass',		exp(LOG_M_TOT));
			p.set('velocity',	exp(LOG_V_TOT));
		end
	end
end