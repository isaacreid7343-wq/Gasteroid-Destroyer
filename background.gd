extends Sprite2D

var stretches = 0
var ending = false

func _process(delta: float) -> void:
	if ending == false:
		position.x -= 100 * delta
	if position.x <= -385:
		stretches += 1
		position.x = 1553
		print(stretches)
		if stretches >= 3 && get_parent().points >= 3000:
			get_parent().bossBattle()

func boomSound():
	get_child(0).play()
