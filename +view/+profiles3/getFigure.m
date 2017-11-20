function fh = getFigure()
% load axes
AXIS		= lib.require(@model.tov.rar.axes.astro);

% select axes
AR			= AXIS.radius;
ARHO		= AXIS.density;
AV			= AXIS.velocity;
AM			= AXIS.mass;

% define figure axes
AX.radius = struct(...
	'format',		'$%s\quad[%s]$',...
	'mapmodel',		AR.mapmodel,...
	'scalemodel',	AR.scalemodel ...
);

AX.density = struct(...
	'format',		'$%s\quad[%s]$',...
	'mapmodel',		ARHO.mapmodel,...
	'scalemodel',	ARHO.scalemodel ...
);

AX.velocity = struct(...
	'format',		'$%s\quad[%s]$',...
	'mapmodel',		AV.mapmodel,...
	'scalemodel',	AV.scalemodel ...
);

AX.mass = struct(...
	'format',		'$%s\quad[%s]$',...
	'mapmodel',		AM.mapmodel,...
	'scalemodel',	AM.scalemodel ...
);


% set axes models
RLIM = [1E-8,1E6];
XTICK = 10.^(-8:2:6);

AXMODEL.density = {...
	'xlabel',AX.radius,...
	'ylabel',AX.density,...
	'axes', { ...
		'XLim',			RLIM,...
		'YLim',			[1E-9,1E26],...
		'XTick',		XTICK,...
		'YTick',		10.^(-8:4:24),...
		'YMinorTick',	'off' ...
	} ...
};

AXMODEL.velocity = {...
	'xlabel',AX.radius,...
	'ylabel',AX.velocity,...
	'axes', { ...
		'XLim',			RLIM,...
		'YLim',			[8E-1,3E5],...
		'XTick',		XTICK,...
		'YTick',		10.^(0:1:5),...
		'YMinorTick',	'off' ...
	} ...
};

AXMODEL.mass = {...
	'xlabel',AX.radius,...
	'ylabel',AX.mass,...
	'axes', { ...
		'XLim',			RLIM,...
		'YLim',			[5E4,2E12],...
		'XTick',		XTICK,...
		'YTick',		10.^(5:1:13),...
		'YMinorTick',	'off' ...
	} ...
};

ax(3,1) = model.tov.rar.figure.ax_loglog(AXMODEL.mass{:});
ax(2,1) = model.tov.rar.figure.ax_loglog(AXMODEL.velocity{:});
ax(1,1) = model.tov.rar.figure.ax_loglog(AXMODEL.density{:});

% show figure
fh = module.sapthesis.figure_grid(ax,'axHeight',@(w) w*2/4,'figure',{'FileName','profiles'});