classdef total < module.ProfileData
	methods
		function obj=total(varargin)
			obj = obj@module.ProfileData(varargin{:});
		end
		
		function p = compose(obj,R)
			V_TOT = module.array([
				obj.data.baryonic.compose(R)
				obj.data.dark.interpolate(R);
			]).map(...
				@(obj) obj.data.velocity.^2 ...
			).reduce(@(a,b) a + b, @sqrt);
		
			M_TOT = module.array([
				obj.data.baryonic.compose(R)
				obj.data.dark.interpolate(R);
			]).map(...
				@(obj) obj.data.mass ...
			).reduce(@(a,b) a + b);

			p = module.ProfileData(obj.label);
			p.set('radius',		R);
			p.set('mass',		M_TOT);
			p.set('velocity',	V_TOT);
		end
	end
end