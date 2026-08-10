extends Sprite2D

@export var stretches = 0

func _process(delta: float) -> void:
	position.x -= 100 * delta
	if position.x <= -385:
		stretches += 1
		position.x = 1553
		print(stretches)
		if stretches >= 1 && get_parent().points >= 0:
			get_parent().bossBattle()

func boomSound():
	get_child(0).play()
