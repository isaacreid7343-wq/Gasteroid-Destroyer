extends Label
@export var points = 0

func asteroidDestroy():
	points += 10
	print(points)
