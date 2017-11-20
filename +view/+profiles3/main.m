function main
module.constraints

% set radius range for compositions
R			= logspace(0,log10(2E5))*parsec;

% load components
COMP		= view.profiles3.getComponents(R);

% load styles
STYLE		= lib.require(@configs.styles);

% load axes
AXIS.data	= lib.require(@model.data.axes.astro);
AXIS.tov	= lib.require(@model.tov.rar.axes.astro);
AXIS.sof13	= lib.require(@model.Sofue2013.axes.astro);

% create figure
fh = view.profiles3.getFigure();

% show figure
figure(fh);

% mass
axes(fh.UserData.axes(3,1));
view.radius_mass('component',COMP, 'axis', AXIS, 'style', STYLE);

% velocity
axes(fh.UserData.axes(2,1));
view.radius_velocity('component',COMP, 'axis', AXIS, 'style', STYLE);

% density
axes(fh.UserData.axes(1,1));
view.radius_density('component',COMP, 'axis', AXIS, 'style', STYLE);

% save pdf
lib.view.file.figure(fh,'export/mw-profiles');