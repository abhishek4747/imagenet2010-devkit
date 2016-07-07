from subprocess import call
import os

folders = ["val","train"] 

for f in folders:
	if not os.path.exists('../b'+f):
		os.makedirs('../b'+f)

for f in folders:
	r = open(f+".txt").readlines();
	b = open("b"+f+'.txt', 'w')
	for line in r:
		ll = line.split(' ')
		infile = ll[0]
		label = ll[1].strip()
		outfile = infile.replace("/"+f+"/","/b"+f+"/").replace(".JPEG",".bin")
		# print infile,outfile,label
		b.write(outfile+" "+label+"\n")
		call(["octave","preprocess.m",infile,outfile])
	b.close()
