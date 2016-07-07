load data/meta.mat
file = fopen('meta.txt', 'w+')
for i = 1:1000
	fprintf(file, "%d %s %d\n", synsets(i).ILSVRC2010_ID, synsets(i).WNID, synsets(i).num_train_images)
endfor
fclose(file)

