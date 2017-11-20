% load packages
MAP		= lib.require(@model.tov.rar.map);
SCALE	= lib.require(@model.tov.rar.scale);

% define axis
AX = module.ProfileAxis(MAP.radius,		SCALE.core.radius);
AY = module.ProfileAxis(MAP.density,	SCALE.core.density);

DIM = struct(...
	'width',	11.1125*4/3,...
	'height',	11.1125,...
	'padding',	struct('top', 0.5, 'left', 1.5, 'right', 1.5, 'bottom', 1.5),...
	'grid',		[1,1] ...
);

fh = figure(...
	'Visible',					'off',...
	'FileName',					'radius_density',...
	'defaulttextinterpreter',	'latex',...
	'Units',					'centimeters',...
	'PaperUnits',				'centimeters',...
	'PaperSize',				[DIM.width DIM.height],...
	'PaperPosition',			[0,0,DIM.width,DIM.height]...
);

fh.Position(2) = fh.Position(2) - (DIM.height - fh.Position(4));
fh.Position(3) = DIM.width;
fh.Position(4) = DIM.height;

AXWIDTH		= (DIM.width - (DIM.padding.left + DIM.padding.right))/DIM.grid(2);
AXHEIGHT	= (DIM.height - (DIM.padding.bottom + DIM.padding.top))/DIM.grid(1);

ax = axes(...
	'Parent',			fh,...
	'XScale',			'log',...
	'YScale',			'log',...
	'NextPlot',			'add',...
	'box',				'on',...
	'Layer',			'top',...
	'Units',			'centimeter',...
	'Position',			[DIM.padding.left DIM.padding.bottom AXWIDTH AXHEIGHT] ...
);

lib.view.plot.xlabel(AX,'$%s/%s$');
lib.view.plot.ylabel(AY,'$%s/%s$');


EXPORT = fh;
EXPORT.UserData.dim = DIM;
EXPORT.UserData.axes = ax;