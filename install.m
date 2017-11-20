function install(varargin)
mkdir('+configs')
mkdir('+view')
mkdir('data')
mkdir('export')

try
	module.array();
catch
	install_lib(struct('id', 'lib', 'src', '*.m', 'dest', ''))
	install_module(struct('id',	'module.array',	'src', 'array/*.m', 'dest', ''));
end

Q = module.array(varargin);

list.lib = module.array([
	struct('id',	'lib',						'src', '*.m',					'dest', '')
	struct('id',	'lib.struct',				'src', '+struct/*.m',			'dest', '+struct/')
	struct('id',	'lib.fitting',				'src', '+fitting/*.m',			'dest', '+fitting/')
	struct('id',	'lib.color',				'src', '+color/*.m',			'dest', '+color/')
	struct('id',	'lib.view.file',			'src', '+view/+file/*.m',		'dest', '+view/+file/')
	struct('id',	'lib.view.plot',			'src', '+view/+plot/*.m',		'dest', '+view/+plot/')
	struct('id',	'lib.test',					'src', '+test/*.m',				'dest', '+test/')
]);

list.module = module.array([
	struct('id',	'module.number',			'src', 'number/*.m',			'dest', '')
	struct('id',	'module.array',				'src', 'array/*.m',				'dest', '')
	struct('id',	'module.struct',			'src', 'struct/*.m',			'dest', '')
	struct('id',	'module.ProfileData',		'src', 'ProfileData/*.m',		'dest', '')
	struct('id',	'module.ProfileAxis',		'src', 'ProfileAxis/*.m',		'dest', '')
	struct('id',	'module.ProfileAnchor',		'src', 'ProfileAnchor/*.m',		'dest', '')
	struct('id',	'module.ProfileClip',		'src', 'ProfileClip/*.m',		'dest', '')
	struct('id',	'module.ProfileMap',		'src', 'ProfileMapping/*.m',	'dest', '')
	struct('id',	'module.ProfileScale',		'src', 'ProfileScaling/*.m',	'dest', '')
	struct('id',	'module.ProfileResponse',	'src', 'ProfileResponse/*.m',	'dest', '')
	struct('id',	'module.tov',				'src', 'tov/*.m',				'dest', '')
	struct('id',	'module.constants',			'src', 'constraints/*.m',		'dest', '')
	struct('id',	'module.Sofue2013',			'src', 'Sofue2013/*.m',			'dest', '')
	struct('id',	'module.ProfileObservation','src', 'ProfileObservation/*.m','dest', '')
	struct('id',	'module.sapthesis',			'src', 'sapthesis/*.m',			'dest', '+sapthesis')
]);

list.model = module.array([
	struct('id',	'model.data',				'src', '+data/*',				'dest', '+data/')
	struct('id',	'model.tov',				'src', '+tov/*.m',				'dest', '+tov/')
	struct('id',	'model.tov.fd',				'src', '+tov/+fd/*',			'dest', '+tov/+fd/')
	struct('id',	'model.tov.rar',			'src', '+tov/+rar/*',			'dest', '+tov/+rar/')
	struct('id',	'model.tov.pointlike',		'src', '+tov/+pointlike/*',		'dest', '+tov/+pointlike/')
	struct('id',	'model.elementary.pointlike',			'src', '+elementary/+pointlike/*',			'dest', '+elementary/+pointlike/')
	struct('id',	'model.phenomeno.ExponentialDisk',		'src', '+phenomeno/+ExponentialDisk/*',		'dest', '+phenomeno/+ExponentialDisk/')
	struct('id',	'model.phenomeno.ExponentialSphere',	'src', '+phenomeno/+ExponentialSphere/*',	'dest', '+phenomeno/+ExponentialSphere/')
	struct('id',	'model.Sofue2013',						'src', '+Sofue2013/*',						'dest', '+Sofue2013/')
]);

for ii=1:Q.length
	q		= Q.data{ii};
	fFilter = @(t) strcmp(q,t.id);
	
	switch q
		case 'ALL'
		install_lib(list.lib.accumulate())
		install_module(list.module.accumulate())
		install_model(list.model.accumulate())
		
		case 'LIBS'
		install_lib(list.lib)
			
		case 'MODULES'
		install_module(list.module)
		
		case 'MODELS'
		install_model(list.model)
		
		otherwise
		install_lib(list.lib.filter(fFilter).accumulate())
		install_module(list.module.filter(fFilter).accumulate())
		install_model(list.model.filter(fFilter).accumulate())
	end
end



function install_lib(list)
path = 'D:/Documents/PhD/code/lib/';
copy(path,'+lib/',list);

function install_module(list)
path	= 'D:/Documents/PhD/code/modules/';
copy(path,'+module/',list);

function install_model(list)
path = 'D:/Documents/PhD/code/models/';
copy(path,'+model/',list);


function copy(path_src,path_dest,list)
for ii=1:numel(list)
	ll = list(ii);
	copyfile([path_src ll.src],[path_dest ll.dest]);
	disp([path_src ll.src]);
end