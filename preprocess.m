pkg load image
arg_list = argv ();

% Filename
% ifile = 'val/ILSVRC2010_val_00000001.JPEG';	
ifile = arg_list{1};

% Read image and find dimension
ii = imread(ifile);						
[h, w, d] = size(ii);

% Find crop size and box
c = min(h,w);
h_ = floor((h-c)/2)+1;
w_ = floor((w-c)/2)+1;

% Crop and Resize
ii = ii(h_:min(h_+c,h), w_:min(w_+c,w), :);
ii = imresize(ii, [255, 255]);

% Save data to binary file
% ofile = strcat(strcat('b',substr(f,1,length(f)-4)),'bin');
ofile = arg_list{2};

fid = fopen(ofile, 'w');
fwrite(fid, ii);
fclose(fid);

% Read binary file and save as image

% fid = fopen(ofile);
% fdata = fread(fid);
% fdata = reshape(fdata, [255, 255, 3]);
% imwrite(uint8(fdata), 'test.jpeg');
% fclose(fid);



