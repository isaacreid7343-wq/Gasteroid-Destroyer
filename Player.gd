extends Node2D
@onready var full_heart_1: Sprite2D = $"../Full Heart 1"
@onready var full_heart_2: Sprite2D = $"../Full Heart 2"
@onready var full_heart_3: Sprite2D = $"../Full Heart 3"

@export var bulletScene: PackedScene
var lives = 3

func _ready() -> void:
	get_child(0).play("3 Health")

func _process(delta: float) -> void:
	if get_parent().get_child(0).ending == false:
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
	else:
		if position.x < 1500:
			position.x += 5

func damage(damaged):
	get_parent().get_child(0).boomSound()
	lives -= damaged
	if lives >= 3:
		lives = 3
		full_heart_1.visible = true
		full_heart_2.visible = true
		full_heart_3.visible = true
		var Frame = get_child(0).frame
		get_child(0).play("3 Health")
		get_child(0).frame = Frame
	if lives <= 0:
		get_tree().reload_current_scene.call_deferred()
	if lives == 2:
		full_heart_1.visible = true
		full_heart_2.visible = true
		full_heart_3.visible = false
		var Frame = get_child(0).frame
		get_child(0).play("2 Health")
		get_child(0).frame = Frame
	elif lives == 1:
		full_heart_1.visible = true
		full_heart_2.visible = false
		full_heart_3.visible = false
		var Frame = get_child(0).frame
		get_child(0).play("1 Health")
		get_child(0).frame = Frame
