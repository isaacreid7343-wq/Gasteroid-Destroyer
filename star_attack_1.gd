extends Area2D

var Started = false

func on_timer_executed():
	visible = true
	Started = true
	get_parent().rotation_degrees = randi_range(-30, 30)
	position.x = 0

func on_timer_not_executed():
	visible = false
	Started = false
	position.x = 0

func _process(delta: float) -> void:
	if Started == true:
		position.x -= 7
		if position.x <= -1350:
			Started = false

func _on_area_entered(area: Area2D) -> void:
	if visible == true:
		if area.name == "Player":
			area.get_parent().damage(1)
