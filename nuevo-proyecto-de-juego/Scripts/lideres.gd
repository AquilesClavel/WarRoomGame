extends Node2D
@onready var CamaraGeneral = $CameraGeneral
@onready var CamaraLider1 = $CamaraLider1
@onready var CamaraLider2 = $CamaraLider2
@onready var CamaraLider3 = $CamaraLider3
@onready var CamaraLider4 = $CamaraLider4

@onready var BtnVolverL1 = $CamaraLider1/BtnVolver1
@onready var BtnVolverL2 = $CamaraLider2/BtnVolver2
@onready var BtnVolverL3 = $CamaraLider3/BtnVolver3
@onready var BtnVolverL4 = $CamaraLider4/BtnVolver4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CamaraGeneral.set_enabled(true)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lider_1_pressed() -> void:
	BtnVolverL1.set_disabled(false)
	BtnVolverL1.visible = true
	CamaraGeneral.set_enabled(false)
	CamaraLider1.set_enabled(true)


func _on_lider_2_pressed() -> void:
	BtnVolverL2.set_disabled(false)
	BtnVolverL2.visible = true
	CamaraGeneral.set_enabled(false)
	CamaraLider2.set_enabled(true)


func _on_lider_3_button_down() -> void:
	BtnVolverL3.set_disabled(false)
	BtnVolverL3.visible = true
	CamaraGeneral.set_enabled(false)
	CamaraLider3.set_enabled(true)


func _on_lider_4_button_down() -> void:
	BtnVolverL4.set_disabled(false)
	BtnVolverL4.visible = true
	CamaraGeneral.set_enabled(false)
	CamaraLider4.set_enabled(true)

func _on_btn_volver_1_pressed() -> void:
	CamaraLider1.set_enabled(false)
	CamaraGeneral.set_enabled(true)
	BtnVolverL1.set_disabled(true)
	BtnVolverL1.visible = false
	
	


func _on_btn_volver_2_pressed() -> void:
	CamaraLider2.set_enabled(false)
	CamaraGeneral.set_enabled(true)
	BtnVolverL2.set_disabled(true)
	BtnVolverL2.visible = false


func _on_btn_volver_3_pressed() -> void:
	CamaraLider3.set_enabled(false)
	CamaraGeneral.set_enabled(true)
	BtnVolverL3.set_disabled(true)
	BtnVolverL3.visible = false


func _on_btn_volver_4_pressed() -> void:
	CamaraLider4.set_enabled(false)
	CamaraGeneral.set_enabled(true)
	BtnVolverL4.set_disabled(true)
	BtnVolverL4.visible = false
