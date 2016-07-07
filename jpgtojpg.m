pkg load image

%strrep(strsplit(fgetl(fid))(1),"/val/","/bval/")

folders = ["train"]; %["val";"train"];
folder_count = size(folders,1);

for i=1:folder_count
	folder = folders(i,:);
	mkdir(strcat("../b",folder));
	fid = fopen(strcat(folder,".txt"));
	fid2 = fopen(strcat(strcat("b",folder),".txt"), "w");
	while (!feof(fid))
		ll = strsplit(fgetl(fid));
		ifile = ll{1};
		label = ll{2};
		ofile = strrep(ifile, strcat(folder,"/"), strcat(strcat("b",folder), "/"));

		% Read image and find dimension
		ii = imread(ifile);						
		[h, w, d] = size(ii);
		ii = ii(:, :, 1:min(3,d));

		% Find crop size and box
		c = min(h,w);
		h_ = floor((h-c)/2)+1;
		w_ = floor((w-c)/2)+1;

		printf("%s %s %s %f %f %f %f %f %f\n", ifile, ofile, label, h, w, d, c, h_, w_);

		% Crop and Resize
		ii = ii(h_:min(h_+c,h), w_:min(w_+c,w), :);
		ii = imresize(ii, [255, 255]);

		imwrite(ii, ofile);
		fprintf(fid2, "%s %s\n", ofile, label);
	endwhile
	fclose(fid);
	fclose(fid2);

endfor




