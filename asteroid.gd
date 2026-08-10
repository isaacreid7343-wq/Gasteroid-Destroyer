extends Area2D

@export var audioPlayed = 0

func _process(delta: float) -> void:
	position.x -= 400 * delta
	if position.x <= -85:
		queue_free()
	
func _on_area_entered(area: Area2D) -> void:
	if area.has_meta("Bullet"):
		area.get_parent().point(10)
		get_parent().get_parent().get_child(0).get_child(0).boomSound()
		queue_free()
		area.queue_free()
	elif area.name == "Player":
		area.get_parent().damage(1)
		queue_free()
