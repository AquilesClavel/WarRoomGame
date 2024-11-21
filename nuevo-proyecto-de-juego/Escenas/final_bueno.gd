extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("FinalBueno")




func _on_button_pressed() -> void:
	Transicion.transition()
	await Transicion.on_transition_finished
	MusicaFondo.cambiarFondo()
	get_tree().change_scene_to_file("res://Escenas/sala_guerra.tscn")
