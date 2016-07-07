meta = open('meta.txt').readlines()
w2i = {}
for m in meta:
	m2 = m.strip().split(' ')
	w2i[m2[1]] = str(int(m2[0]) - 1)

v = w2i.values()
vs = '\n'.join(v)
open('labels.txt','w').write(vs)


import os
if 1:

	train_files = os.listdir('../train')
	outfile = open('train.txt', 'w')
	for tf in train_files:
		f = tf.split('_')[0]
		s = os.path.join(os.path.dirname(os.getcwd()),'train')+'/'+tf +' '+w2i[f]+'\n'
		#print s,
		outfile.write(s)

	outfile.close()

if 1:
	def tostr(ii):
		l = len(str(ii))
		return '0'*(8-l) + str(ii)
	gt = map(int, open('data/ILSVRC2010_validation_ground_truth.txt').readlines())
	val_files = os.listdir('../val')
	outfile = open('val.txt', 'w')
	for i in range(0,len(val_files)):
		#ILSVRC2010_val_00000024.JPEG
		s = os.path.join(os.path.dirname(os.getcwd()),'val')+'/'+'ILSVRC2010_val_'+tostr(i+1)+'.JPEG'+ ' '+ str(gt[i]-1)+'\n'
		outfile.write(s)
	outfile.close()
		
