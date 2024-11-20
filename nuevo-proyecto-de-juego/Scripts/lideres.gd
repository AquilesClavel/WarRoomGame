extends Node2D
@onready var CamaraGeneral = $CameraGeneral
@onready var Computadora =$Computadora
@onready var CamaraCompu = $CameraCompu


var primeraVez = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CamaraGeneral.set_enabled(true)
	Computadora.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_pcmenu_pressed() -> void:
	Computadora.show()
	CamaraGeneral.set_enabled(false)
	CamaraCompu.set_enabled(true)
