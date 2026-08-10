extends Node2D
@onready var full_heart_1: Sprite2D = $"../Full Heart 1"
@onready var full_heart_2: Sprite2D = $"../Full Heart 2"
@onready var full_heart_3: Sprite2D = $"../Full Heart 3"

@export var bulletScene: PackedScene
@export var lives = 3


func _process(delta: float) -> void:
	var input = Input.get_axis("up", "down")
	position.y += (input * 600) * delta
	if position.y >= 595:
		position.y = 595
	elif position.y <= 55:
		position.y = 55
	if Input.is_action_just_pressed("shoot"):
		var node = bulletScene.instantiate()
		node.position.y = position.y
		node.position.x = position.x + 70
		get_parent().add_child(node)

func damage(damaged):
	get_parent().get_child(0).boomSound()
	lives -= damaged
	if lives >= 3:
		lives = 3
		full_heart_1.visible = true
		full_heart_2.visible = true
		full_heart_3.visible = true
		get_child(0).visible = true
		get_child(1).visible = false
		get_child(2).visible = false
	if lives <= 0:
		get_tree().reload_current_scene.call_deferred()
		print("Game Ended")
	if lives == 2:
		full_heart_1.visible = true
		full_heart_2.visible = true
		full_heart_3.visible = false
		get_child(0).visible = false
		get_child(1).visible = true
		get_child(2).visible = false
	elif lives == 1:
		full_heart_1.visible = true
		full_heart_2.visible = false
		full_heart_3.visible = false
		get_child(0).visible = false
		get_child(1).visible = false
		get_child(2).visible = true
