extends Node2D

var video_loop = load("res://Assets/Finales/FinalMaloLoop.ogv")
var finalMalo = load("res://Assets/Finales/final-malo.ogv")
@onready var vidplayer = $Control/VideoStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func resetVidPlayer()->void:
	vidplayer.set_stream(finalMalo)
	vidplayer.play()
	vidplayer.set_loop(false)



func _on_video_stream_player_finished() -> void:
	Transicion.transition()
	await Transicion.on_transition_finished
	vidplayer.set_stream(video_loop)
	vidplayer.play()
	vidplayer.set_loop(true)
	Dialogic.start("FinalMalo")
	

func _on_button_pressed() -> void:
	Transicion.transition()
	await Transicion.on_transition_finished
	MusicaFondo.cambiarFondo()
	get_tree().change_scene_to_file("res://Escenas/sala_guerra.tscn")
