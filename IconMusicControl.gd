extends Button


var change_img = false
var sound_on = preload("res://art/sound-on.png")
var sound_off = preload("res://art/sound-off.png")



func _ready():
	pass
func _process(delta):
	pass
	#var change_img = $"/root/MusicPlayer".stream_paused

func _on_MusicControl_pressed():
	if change_img:
		
		$".".set_button_icon(sound_on)
		change_img = !change_img
	else:
		$".".set_button_icon(sound_off)
		change_img = !change_img
		

