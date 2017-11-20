classdef profile < module.ProfileData
    methods
        function obj=profile(varargin)
            obj = obj@module.ProfileData(varargin{:});
		end
		
		function obj=define(obj,PARAM)
			module.constraints
			
			% destructor
			R		= PARAM.R;
			RHO0	= PARAM.RHO0;
			M		= 8*pi*R^3*RHO0;
			V		= sqrt(R^2*8*pi*G*RHO0);
			
			obj.data.R		= R;
			obj.data.RHO	= RHO0;
			obj.data.M		= M;
			obj.data.V		= V;
		end
		
		function fit_velocity_maxima(obj,xmax,vmax)
			configs.constraints
			
			qxmax = 3.383634283;
			qvmax = 0.4406782028;
			
			R		= xmax/qxmax;
			sigma	= vmax/qvmax;
			RHO0	= sigma^2/(8*pi*G*R^2);
			M		= 8*pi*R^3*RHO0;

			obj.data.R		= R;
			obj.data.RHO0	= RHO0;
			obj.data.M		= M;
			obj.data.sigma	= sigma;
		end
    end
end