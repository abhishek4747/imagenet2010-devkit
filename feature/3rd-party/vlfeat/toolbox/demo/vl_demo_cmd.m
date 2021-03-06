function [err,msg] = vl_demo_cmd(name, args)
% DEMO_CMD: Demo: Command line utility

ext = '' ;
switch mexext
 case 'mexmac'
	arch = 'mac' ;
 case 'mexmaci'
	arch = 'maci' ;
 case 'mexglx'
	arch = 'glx' ;
 case 'mexa64'
	arch = 'g64' ;
 case 'dll' 
	arch = 'win32' ;
	ext = '.exe' ;
 case 'mexw32'
	arch = 'win32' ;
	ext ='.exe' ;
 case 'mexw64'
	arch = 'win64' ;    
	ext ='.exe' ;
end

cmd = fullfile(vl_root,'bin',arch,[name ext]) ;
str = ['"' cmd '" ' args] ;
disp(str);
[err,msg] = system(str) ;
