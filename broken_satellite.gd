extends Area2D

@export var shot = 0

func _process(delta: float) -> void:
	position.x -= 400 * delta
	if position.x <= -170:
		queue_free()
	
func _on_area_entered(area: Area2D) -> void:
	if area.has_meta("Bullet"):
		shot += 1
		if shot == 1:
			area.get_parent().point(10)
		elif  shot == 2:
			area.get_parent().point(20)
			get_parent().get_parent().get_child(0).get_child(0).boomSound()
			queue_free()
		area.queue_free()
	elif area.name == "Player":
		area.get_parent().damage(1)
		queue_free()
