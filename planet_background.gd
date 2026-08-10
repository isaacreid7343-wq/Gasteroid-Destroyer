extends Sprite2D
@onready var planet_2: Sprite2D = $"Planet 2"
@onready var planet_3: Sprite2D = $"Planet 3"

func _ready() -> void:
	position.x = 1553
	position.y = randf_range(31, 617)

func _process(delta: float) -> void:
	var randomizedNumber = randf_range(1, 3)
	if randomizedNumber == 1:
		planet_2.visible = true
		planet_3.visible = true
	if randomizedNumber == 2:
		planet_2.visible = true
		planet_3.visible = false
	if randomizedNumber == 3:
		planet_2.visible = false
		planet_3.visible = false
	position.x -= 100 * delta
	if position.x <= -385:
		position.y = randf_range(31, 617)
		position.x = 1553
