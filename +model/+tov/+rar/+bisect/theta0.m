function varargout = theta0(vm,response,varargin)
% set iteration print function
sPrec	= '%1.15e';
sStrong = ['<strong>' sPrec '</strong>'];
sFormat = strjoin({sPrec,sStrong,sPrec,'%1.3e\n'},'\t');
fLog	= @(SOL) fprintf(sFormat,SOL.data.beta0,SOL.data.theta0,SOL.data.W0,response.chi2(SOL));

% set update function ([vector,struct] => struct)
fUpdate = @(b,vm) struct(...
	'param', struct(...
		'beta0',	vm.param.beta0,...
		'theta0',	b(1),...
		'W0',		vm.param.W0 ...
	),...
	'options',	vm.options ...
);

% search for solution
[varargout{1:nargout}] = model.tov.rar.bisect(vm,response,...
	'fUpdate',		fUpdate,...
	'fLog',			fLog,...
	varargin{:} ....
);