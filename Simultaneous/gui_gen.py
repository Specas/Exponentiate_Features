import pygame
import random

BLACK=(0,0,0)
WHITE=(255,255,255)
GREEN=(0,255,0)
RED=(255,0,0)

file_write = open("gfeature2.dat",'w')

points = []

def draw_obj(screen, cx, cy):
	for ii in range(len(points)):
		pygame.draw.circle(screen, RED, points[ii], 3)

pygame.init()

#width and height of screen
size=(500, 500)
screen= pygame.display.set_mode(size)

pygame.display.set_caption("Generate Data")

done = False;

while not done:

	mousex, mousey = pygame.mouse.get_pos()


	for event in pygame.event.get():
	    if event.type==pygame.QUIT:
	        done=True
	    if event.type == pygame.MOUSEBUTTONDOWN:
	    	points.append((mousex, mousey))
	    	
	    if event.type == pygame.MOUSEBUTTONUP:
	    	print(len(points))
	    	px = mousex/500.0
	    	py = (500-mousey)/500.0
	    	file_write.write(str(px) + " " + str(py))
	    	file_write.write("\n")




	screen.fill(WHITE)
	draw_obj(screen, mousex, mousey)
	pygame.display.flip()
    
    
    
pygame.quit()
file_write.close()