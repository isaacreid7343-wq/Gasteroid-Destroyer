extends Node2D
@onready var point_counter: Label = $"Point Counter"
@export var asteroidScene: PackedScene
@export var satelliteScene: PackedScene
@export var brokenSatelliteScene: PackedScene
@export var moonRockScene: PackedScene
@export var bossSceneNo1: PackedScene
var turn = 1
var points = 0
var pointLives = 0
var bossStart = 0

func _ready() -> void:
	point_counter.text = str(0)
	var node1 = asteroidScene.instantiate()
	node1.position.y = randf_range(31, 617)
	node1.position.x = 1250
	add_child(node1)

func _process(_delta: float) -> void:
	if points >= 1000 && pointLives == 0:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 2000 && pointLives == 1:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 3000 && pointLives == 2:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 4000 && pointLives == 3:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 5000 && pointLives == 4:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 6000 && pointLives == 5:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 7000 && pointLives == 6:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 8000 && pointLives == 7:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 9000 && pointLives == 8:
		pointLives += 1
		get_child(1).damage(-1)
	elif points >= 10000 && pointLives == 9:
		pointLives += 1
		get_child(1).damage(-1)

func _on_timer_timeout() -> void:
	if bossStart == 0:
		var randomizedNumber = int(randf_range(1, 4))
		if randomizedNumber == 1:
			pass
		elif randomizedNumber == 2:
			var node3 = moonRockScene.instantiate()
			node3.position.y = randf_range(31, 617)
			node3.position.x = 1250
			add_child(node3)
		else:
			var node1 = asteroidScene.instantiate()
			node1.position.y = randf_range(31, 617)
			node1.position.x = 1250
			add_child(node1)
		turn += 1
		if turn >= 3:
			var satelliteVersion = int(randf_range(1, 3))
			if satelliteVersion == 1:
				var node2 = satelliteScene.instantiate()
				node2.position.y = randf_range(31, 617)
				node2.position.x = 1500
				add_child(node2)
			elif satelliteVersion >= 2:
				var node4 = brokenSatelliteScene.instantiate()
				node4.position.y = randf_range(31, 617)
				node4.position.x = 1500
				add_child(node4)
			turn = 0

func point(pointed):
	points += pointed
	point_counter.text = str(points)

func bossBattle():
	if bossStart == 0:
		bossStart = 1
		var nodeBoss = bossSceneNo1.instantiate()
		nodeBoss.position.y = 0
		nodeBoss.position.x = 0
		add_child(nodeBoss)
