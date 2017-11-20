classdef baryons < module.ProfileData
	methods
		function obj=baryons(vm)
			obj = obj@module.ProfileData('baryons');
			
			% set components
			obj.data.inner_bulge	= model_wrapper.ExponentialSphere(vm.inner_bulge);
			obj.data.main_bulge		= model_wrapper.ExponentialSphere(vm.bulge);
			obj.data.disk			= model_wrapper.ExponentialDisk(vm.disk);
		end
		

		function p = compose(obj,R) % R is in SI units (m)
			AXIS_BULGE	= lib.require(@model.phenomeno.ExponentialSphere.axes.SI);
			AXIS_DISK	= lib.require(@model.phenomeno.ExponentialDisk.axes.SI);

			% set radius
			obj.data.inner_bulge.set('radius', @(obj) R./obj.data.R);
			obj.data.main_bulge.set('radius', @(obj) R./obj.data.R);
			obj.data.disk.set('radius', @(obj) R./obj.data.R);

			% calc total velocities
			V_TOT = module.array({
				AXIS_BULGE.velocity.map(obj.data.inner_bulge).^2
				AXIS_BULGE.velocity.map(obj.data.main_bulge).^2
				AXIS_DISK.velocity.map(obj.data.disk).^2
			}).reduce(@(a,b) a + b, @sqrt);
		
			M_TOT = module.array({
				AXIS_BULGE.mass.map(obj.data.inner_bulge)
				AXIS_BULGE.mass.map(obj.data.main_bulge)
				AXIS_DISK.mass.map(obj.data.disk)
			}).reduce(@(a,b) a + b);

			% create data set baryonic contribution (astro unit system)
			p = module.ProfileData('baryons');
			p.set('radius',		R);
			p.set('velocity',	V_TOT);
			p.set('mass',		M_TOT);
		end
	end
end