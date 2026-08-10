extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if visible == true:
		if area.name == "Player":
			area.get_parent().damage(1)

func on_timer_executed():
	var positivity = randi_range(1, 2)
	if positivity == 1:
		position.y = 154
	elif positivity == 2:
		position.y = 449
	visible = true

func on_timer_not_executed():
	visible = false
