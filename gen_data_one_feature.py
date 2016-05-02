# The program creates a file that has data on one feature. The output is a non linear equation.

import random

file_write = open("one_feature.dat",'w')
file_write_normal = open("one_feature_normal.dat", 'w')



# The function

func1 = "56 + 9*x1*x1"
func2 = "7+48*x2"

for i in xrange(50):

	x1 = float(random.randrange(100))/100
	while(x1==0):
		x1 = float(random.randrange(100))/100
	x2 = float(random.randrange(100))/100
	while(x2==0):
		x2 = float(random.randrange(100))/100
	y1 = eval(func1)
	y2 = eval(func2)

	file_write.write(str(x1) + " " + str(y1))
	file_write_normal.write(str(x2) + " " + str(y2))
	file_write.write("\n")
	file_write_normal.write("\n")


file_write.close()
file_write_normal.close()
