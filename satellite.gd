extends Area2D

func _process(delta: float) -> void:
		position.x -= 400 * delta
		if position.x <= -170:
			queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.has_meta("Bullet"):
		area.damage(1)
		queue_free()
		area.queue_free()
	elif area.name == "Player":
		area.get_parent().damage(1)
		queue_free()
