function list = getComponents(R) % R in SI units (m)
% load data
load('data/PROFILE_SOFUE2013.mat');
load('export/PROFILE_CORE_HALO.mat');

% select RAR solutions and makeup
RAR = P.pick(1:17:154);
for ii = 1:RAR.length
	RAR.data{ii}.data.density(end) = realmin;
end

% select components
BAR = model_wrapper.baryons(lib.require(@configs.parameter_sofue2013));
TOT = model_wrapper.total('RAR + bar').set('baryonic',BAR).set('dark',RAR.data{end});

% put in list
list.sofue2013	= PROFILE_SOFUE2013;
list.rar		= RAR;
list.baryonic	= BAR.compose(R);
list.total		= TOT.compose(R);

