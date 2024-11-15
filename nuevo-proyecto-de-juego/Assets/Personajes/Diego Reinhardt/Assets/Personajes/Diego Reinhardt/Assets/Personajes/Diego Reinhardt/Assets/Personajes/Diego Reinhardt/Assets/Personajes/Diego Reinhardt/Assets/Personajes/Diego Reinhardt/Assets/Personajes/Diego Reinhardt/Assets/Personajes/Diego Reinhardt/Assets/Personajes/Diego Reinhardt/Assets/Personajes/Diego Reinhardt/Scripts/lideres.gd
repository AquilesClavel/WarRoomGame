extends Node2D
@onready var CamaraGeneral = $CameraGeneral
@onready var CamaraLider1 = $CamaraLider1
@onready var CamaraLider2 = $CamaraLider2
@onready var CamaraLider3 = $CamaraLider3
@onready var CamaraLider4 = $CamaraLider4
@onready var btnLider1 = $Control/Lider1
@onready var btnLider2 = $Control/Lider2
@onready var btnLider3 = $Control/Lider3
@onready var btnLider4 = $Control/Lider4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CamaraGeneral.set_enabled(true)
	#btnLider1.set_enabled(false)
	#btnLider2.set_enabled(false)
	#btnLider3.set_enabled(false)
	#btnLider4.set_enabled(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lider_1_pressed() -> void:
	CamaraGeneral.set_enabled(false)
	CamaraLider1.set_enabled(true)


func _on_lider_2_pressed() -> void:
	CamaraGeneral.set_enabled(false)
	CamaraLider2.set_enabled(true)


func _on_lider_3_button_down() -> void:
	CamaraGeneral.set_enabled(false)
	CamaraLider3.set_enabled(true)


func _on_lider_4_button_down() -> void:
	CamaraGeneral.set_enabled(false)
	CamaraLider4.set_enabled(true)
