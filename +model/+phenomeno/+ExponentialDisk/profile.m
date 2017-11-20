classdef profile < module.ProfileData
    methods
        function obj=profile(varargin)
            obj = obj@module.ProfileData(varargin{:});
		end
		
		function obj=define(obj,PARAM)
			module.constraints
			
			if isfield(PARAM,'R') && isfield(PARAM,'M')
				% R		length scale
				% M		mass scale
				R	= PARAM.R;
				M	= PARAM.M;
				S0  = M/(2*pi*R^2);
				V	= sqrt(G*M/R);
			elseif isfield(PARAM,'R') && isfield(PARAM,'S0')
				% R		length scale
				% S0	central surface mass density
				R	= PARAM.R;
				S0	= PARAM.S0;
				M	= 2*pi*S0*R^2;
				V	= sqrt(G*M/R);
			elseif isfield(PARAM,'RMAX') && isfield(PARAM,'VMAX')
				% RMAX	maxima where V'(RMAX) = 0
				% VMAX	maximal velocity, V(RMAX) = VMAX
				
				% numerical conversion factors
				qxmax = 3.383634283;
				qvmax = 0.4406782028;

				R	= PARAM.RMAX/qxmax;
				V	= PARAM.VMAX/qvmax;
				M	= R*V^2/G;
				S0  = M/(2*pi*R^2);
			else
				error('unknown set of parameters in class "ExponentialDisk"');
			end

			obj.data.R	= R;
			obj.data.M	= M;
			obj.data.S	= S0;
			obj.data.V	= V;				
		end
    end
end