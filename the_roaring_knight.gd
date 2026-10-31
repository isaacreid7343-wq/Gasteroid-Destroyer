extends Area2D
@export var audioPlayed = 0
@export var attack = randi_range(1, 1)
@export var bossBattleStarted = 0
@export var time_passed = 0

func _ready() -> void:
	position.x = 1385
	position.y = 324

func _process(delta: float) -> void:
	time_passed += delta
	get_parent().get_parent().get_child(3).volume_db -= 5
	if get_parent().get_parent().get_child(3).volume_db == -80:
		get_parent().get_parent().get_child(3).stop()
	if not position.x <= 1152:
		position.x -= 1000 * delta
	else:
		position.x = 1152
		position.y = sin(time_passed) * 50 + 324
		if get_parent().get_parent().bossStart == 1 && bossBattleStarted == 0:
			print("egg2")
			bossBattle()
			bossBattleStarted = 1
		if audioPlayed == 0:
			get_parent().get_parent().get_parent().get_child(0).get_child(0).boomSound()
			get_child(0).play()
			get_child(0).get_child(0).start()
			get_child(0).volume_db = -80.0
			audioPlayed = 1

func _on_audio_timer_timeout() -> void:
		audioPlayed = 0

func bossBattle():
	attack = randi_range(1, 5)
	get_child(3).start()

func _on_attack_timer_timeout() -> void:
	print("Attack = " + str(attack))
	#get_tree().paused = true
	if attack == 1:
		get_parent().get_child(1).on_timer_executed()
	else:
		get_parent().get_child(1).on_timer_not_executed()
	if attack == 2:
		get_parent().get_child(2).on_timer_executed()
	else:
		get_parent().get_child(2).on_timer_not_executed()
	bossBattle()
