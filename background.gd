extends Sprite2D

@export var stretches = 0

func _process(delta: float) -> void:
	position.x -= 100 * delta
	if position.x <= -385:
		stretches += 1
		position.x = 1553
		print(stretches)
		if stretches >= INF && get_parent().points >= INF:
			get_parent().bossBattle()

func boomSound():
	get_child(0).play()
