extends Area2D
@export var shot = false

func _process(delta: float) -> void:
	if shot == false:
		position.x -= 400 * delta

func _on_area_entered(area: Area2D) -> void:
	if area.has_meta("Bullet"):
		if shot == false:
			get_parent().get_parent().get_child(0).get_child(0).boomSound()
			area.get_parent().point(20)
			shot = true
		if shot == true:
			position.x += 20
			if position.x >= 1237:
				area.get_parent().point(100)
				get_parent().get_parent().get_child(0).get_child(0).boomSound()
				queue_free()
		area.queue_free()
	elif area.name == "Player":
		area.get_parent().damage(1)
		queue_free()
