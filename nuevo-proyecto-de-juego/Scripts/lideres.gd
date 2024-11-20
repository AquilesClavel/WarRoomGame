extends Node2D
@onready var CamaraGeneral = $CameraGeneral



var primeraVez = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CamaraGeneral.set_enabled(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_pcmenu_pressed() -> void:
	var result;
	result=get_tree().change_scene_to_file("res://Escenas/Computadora.tscn")
	print(result)
