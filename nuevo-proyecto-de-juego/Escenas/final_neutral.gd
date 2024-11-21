extends Node2D

@onready var vidplayer = $Control/VideoStreamPlayer
@onready var text_rect = $Control/TextureRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_button_pressed() -> void:
	Transicion.transition()
	await Transicion.on_transition_finished
	MusicaFondo.cambiarFondo()
	get_tree().change_scene_to_file("res://Escenas/sala_guerra.tscn")


func _on_video_stream_player_finished() -> void:
	Transicion.transition()
	await Transicion.on_transition_finished
	text_rect.visible = true
	Dialogic.start("FinalNeutral")
