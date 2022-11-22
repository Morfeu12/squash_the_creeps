extends Node

export (PackedScene) var mob_scene

#var change_img = false
#var sound_on = preload("res://art/sound-on.png")
#var sound_off = preload("res://art/sound-off.png")

func _ready():
	randomize()
	$UserInterface/Retry.hide()

func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()
	

	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# And give it a random offset.
	mob_spawn_location.unit_offset = randf()

	var player_position = $Player.transform.origin
	mob.initialize(mob_spawn_location.translation, player_position)

	add_child(mob)
	
	# We connect the mob to the score label to update the score upon squashing one.
	mob.connect("squashed", $UserInterface/ScoreLabel, "_on_Mob_squashed")

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# This restarts the current scene.
		get_tree().reload_current_scene()


func _on_Player_hit():
	$MobTimer.stop()
	$UserInterface/Retry.show()


func _on_MusicControl_pressed():
	$"/root/MusicPlayer".stream_paused = !$"/root/MusicPlayer".stream_paused
	#if change_img:
		#$UserInterface/MusicControl.set_button_icon(sound_on)
		#change_img = !change_img
	#else:
		#$UserInterface/MusicControl.set_button_icon(sound_off)
		#change_img = !change_img
	
