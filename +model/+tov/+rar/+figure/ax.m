function ax = ax(varargin)
Q = module.struct(...
	'axes', {},...
	varargin{:}...
);

ax = axes(...
	'Parent',			[],...
	'NextPlot',			'add',...
	'box',				'on',...
	'Layer',			'top',...
	Q.axes{:}...
);

ax.XLabel.Interpreter = 'latex';
ax.YLabel.Interpreter = 'latex';


if isfield(Q,'xlabel')
	switch class(Q.xlabel)
		case 'char'
		ax.XLabel.String = Q.xlabel;
		
		case 'module.ProfileMapping'
		ax.XLabel.String = Q.xlabel.unit;
		
		case 'struct'
		ax.XLabel.String = lib.sprintf(...
			Q.xlabel.format,...
			Q.xlabel.mapmodel.var,...
			Q.xlabel.scalemodel.unit ...
		);
	end
end

if isfield(Q,'ylabel')
	switch class(Q.ylabel)
		case 'char'
		ax.YLabel.String = Q.ylabel;
		
		case 'module.ProfileMapping'
		ax.YLabel.String = Q.ylabel.unit;
		
		case 'struct'
		ax.YLabel.String = lib.sprintf(...
			Q.ylabel.format,...
			Q.ylabel.mapmodel.var,...
			Q.ylabel.scalemodel.unit ...
		);
	end
end