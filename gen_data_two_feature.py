import random

file_write = open("two_feature.dat",'w')


func1 = "3 + 37*x1*x1 + 15*x2*x2*x2*x2*x2"

for i in xrange(50):

	x1 = float(random.randrange(100))/100
	while(x1==0):
		x1 = float(random.randrange(100))/100
	x2 = float(random.randrange(100))/100
	while(x2==0):
		x2 = float(random.randrange(100))/100
	y1 = eval(func1)

	file_write.write(str(x1) + " " + str(x2) + " " + str(y1))
	file_write.write("\n")


file_write.close()
