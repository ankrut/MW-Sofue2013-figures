function cacheCoreHalo
% load list
load('data\TBL_CORE_HALO.mat');

% find particle mass maximum
M		= TBL_CORE_HALO.accumulate(@(t) t.model.param.m);
BETA0	= TBL_CORE_HALO.accumulate(@(t) t.model.param.beta0);

x		= lib.get_extrema(log(BETA0),log(M),1);
beta0	= exp(x);

P = TBL_CORE_HALO.filter(@(t) t.model.param.beta0 <= beta0)...
	.map(@(t) model_wrapper.rar('model',t.model));

save('export/PROFILE_CORE_HALO.mat','P');
