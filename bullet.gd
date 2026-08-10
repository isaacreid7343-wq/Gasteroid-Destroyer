extends Area2D



func _process(delta: float) -> void:
	position.x += 1000 * delta
	if position.x >= 1200:
		queue_free()

func damage(damaged):
	get_parent().get_child(1).damage(damaged)

func point(pointed):
	get_parent().point(pointed)

func _on_area_entered(_area: Area2D) -> void:
	pass #get_parent().get_parent().get_child(0).get_child(0).boomSound()
