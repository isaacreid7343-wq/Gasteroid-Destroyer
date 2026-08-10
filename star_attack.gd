extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if visible == true:
		if area.name == "Player":
			area.get_parent().damage(1)

func on_timer_executed():
	visible = true

func on_timer_not_executed():
	visible = false
