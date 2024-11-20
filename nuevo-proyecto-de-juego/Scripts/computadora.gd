extends Control

@onready var btnChenCH = $ColorRect/CHENCH
@onready var btnEthanUS = $ColorRect/ETHANUS
@onready var btnKimKR = $ColorRect/KIMKR
@onready var DimitriRU = $ColorRect/DIMITRIRU

@onready var caraneutraChen = $ColorRect/EstatusChen/ColorRect/caraneutra
@onready var caratristeChen =$ColorRect/EstatusChen/ColorRect/caratriste
@onready var carafelizChen =$ColorRect/EstatusChen/ColorRect/carafeliz
@onready var plusChen = $ColorRect/EstatusChen/ColorRect/plus1
@onready var plusplusChen = $ColorRect/EstatusChen/ColorRect/plus2

@onready var caraneutraDimitri = $ColorRect/EstatusDimitri/ColorRect/caraneutra
@onready var caratristeDimitri =$ColorRect/EstatusDimitri/ColorRect/caratriste
@onready var carafelizDimitri =$ColorRect/EstatusDimitri/ColorRect/carafeliz
@onready var plusDimitri = $ColorRect/EstatusDimitri/ColorRect/plus1
@onready var plusplusDimitri = $ColorRect/EstatusDimitri/ColorRect/plus2

@onready var caraneutraEthan = $ColorRect/EstatusEthan/ColorRect/caraneutra
@onready var caratristeEthan =$ColorRect/EstatusEthan/ColorRect/caratriste
@onready var carafelizEthan =$ColorRect/EstatusEthan/ColorRect/carafeliz
@onready var plusEthan = $ColorRect/EstatusEthan/ColorRect/plus1
@onready var plusplusEthan = $ColorRect/EstatusEthan/ColorRect/plus2

@onready var caraneutraKim = $ColorRect/EstatusKim/ColorRect/caraneutra
@onready var caratristeKim =$ColorRect/EstatusKim/ColorRect/caratriste
@onready var carafelizKim =$ColorRect/EstatusKim/ColorRect/carafeliz
@onready var plusKim = $ColorRect/EstatusKim/ColorRect/plus1
@onready var plusplusKim = $ColorRect/EstatusKim/ColorRect/plus2

@onready var CallKim = $ColorRect/LlamandoKim
@onready var CallEthan = $ColorRect/LlamandoEthan
@onready var CallDimitri = $ColorRect/LlamandoDimitri
@onready var CallChen = $ColorRect/LlamandoChen

@onready var btnRegresar = $ColorRect/btnRegresar
@onready var btnAyudaGob = $ColorRect/btnAyudaGobernantes
@onready var btnAyudaCom =$ColorRect/btnAyudaComputadora
var primeraVez = MusicaFondo.primeraVez

func _ready() -> void:
	if primeraVez == false:
		Dialogic.start("AyudaComputadora")
	MusicaFondo.primeraVez = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_ayuda_computadora_pressed() -> void:
	Dialogic.start("AyudaComputadora")


func _on_btn_ayuda_gobernantes_pressed() -> void:
	Dialogic.start("AyudaGobernantes1")


func _on_btn_regresar_pressed() -> void:
	var result;
	result=get_tree().change_scene_to_file("res://Escenas/lideres.tscn")
	print(result)


func _on_chench_pressed() -> void:
	CallChen.show()
	Dialogic.start("ChenIntroduccion")
	CallChen.hide()
	Dialogic.timeline_ended.connect(terminoChino)
	

func terminoChino():
	actualizarEstatusChenCH()

func actualizarEstatusChenCH():
 
	var estatus = btnChenCH.obtener_estado()
	
	match estatus:
		"Estado Negativo":
			print("estado negativo chino")
			carafelizChen.hide()
			caratristeChen.show()
			plusChen.set_self_modulate("ffffff1f")
			plusplusChen.set_self_modulate("ffffff1f")
		"Estado Positivo":
			print("estado !negativo chino")
			carafelizChen.show()
			caratristeChen.hide()
			plusChen.set_self_modulate("ffffff1f")
			plusplusChen.set_self_modulate("ffffff1f")
