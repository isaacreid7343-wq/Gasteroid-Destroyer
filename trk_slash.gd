extends Area2D

var Started = false

func _on_area_entered(area: Area2D) -> void:
	if visible == true:
		if area.name == "Player":
			area.get_parent().damage(1)

func on_timer_executed():
	position.x = 1250
	var positivity = randi_range(1, 2)
	Started = true
	if positivity == 1:
		position.y = 154
	elif positivity == 2:
		position.y = 449
	visible = true

func _process(delta: float) -> void:
	if Started == true:
		position.x -= 15
	if position.x <= -50:
		Started = false

func on_timer_not_executed():
	visible = false
