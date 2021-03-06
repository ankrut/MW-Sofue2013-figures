function h=unity(varargin)
ah = gca;
xlbl = ah.UserData.x.mapmodel.var;
ylbl = ah.UserData.y.mapmodel.var;

h=line(...
	get(gca,'XLim'),...
	get(gca,'XLim'),...
	'DisplayName',sprintf('$%s = %s$',xlbl,ylbl),...
	varargin{:}...
);