extends Control

@onready var btnChenCH = $ColorRect/CHENCH
@onready var btnEthanUS = $ColorRect/ETHANUS
@onready var btnKimKR = $ColorRect/KIMKR
@onready var btnDimitriRU = $ColorRect/DIMITRIRU

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

@onready var caratristeGen =$ColorRect/Estatus/ColorRect/caratriste
@onready var carafelizGen = $ColorRect/Estatus/ColorRect/carafeliz
@onready var caraneutraGen =$ColorRect/Estatus/ColorRect/caraneutra

@onready var lideres = get_node("/root/Lideres")

#Estados automata
enum Estado {CONF,INICIO,POSITIVO,NEUTRAL,NEGATIVO,VICTORIA,DERROTA}
var estado_actual: Estado = Estado.CONF
var palabra: Array = []

#Pila  
var pila :Array = []

#banderasPresentaciones
var primeraCH = false
var primeraRU = false
var primeraKR = false
var primeraUS = false

func _ready() -> void:
	hide()
	manejar_victoria(" ")
	manejar_victoria("2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_ayuda_computadora_pressed() -> void:
	Dialogic.start("AyudaComputadora")


func _on_btn_ayuda_gobernantes_pressed() -> void:
	Dialogic.start("AyudaGobernantes1")


func _on_btn_regresar_pressed() -> void:
	hide()
	lideres.CamaraCompu.set_enabled(false)
	lideres.CamaraGeneral.set_enabled(true)

#FUNCIONES KIM
func _on_kimkr_pressed() -> void:
	CallKim.show()
	if primeraKR == false:
		Dialogic.start("KimIntroduccion")
		primeraKR = true
	else:
		escogerTimelineCoreano()
	Dialogic.timeline_ended.connect(terminoCoreano)

func terminoCoreano():
	actualizarEstatusKimKR()
	CallKim.hide()

func actualizarEstatusKimKR():
	var estatusKR = btnKimKR.obtener_estado()

	match estatusKR:
		"Estado Negativo":
			print("estado negativo chino")
			carafelizKim.hide()
			caratristeKim.show()
			plusKim.set_self_modulate("ffffff1f")
			plusplusKim.set_self_modulate("ffffff1f")
		"Estado Positivo":
			print("estado !negativo chino")
			carafelizKim.show()
			caratristeKim.hide()
			plusKim.set_self_modulate("ffffff1f")
			plusplusKim.set_self_modulate("ffffff1f")
		"Estado Muy Positivo":
			carafelizKim.show()
			caratristeKim.hide()
			plusKim.set_self_modulate("ffffff")
			plusplusKim.set_self_modulate("ffffff1f")
		"Estado Extremadamente Positivo":
			carafelizKim.show()
			caratristeKim.hide()
			plusKim.set_self_modulate("ffffff")
			plusplusKim.set_self_modulate("ffffff")
		"Estado Muy Negativo":
			carafelizKim.hide()
			caratristeKim.show()
			plusKim.set_self_modulate("ffffff")
			plusplusKim.set_self_modulate("ffffff1f")
		"Estado Extremadamente Negativo":
			carafelizKim.hide()
			caratristeKim.show()
			plusKim.set_self_modulate("ffffff")
			plusplusKim.set_self_modulate("ffffff")
		"Estado Bloqueado":
			carafelizKim.hide()
			caratristeKim.hide()
			caraneutraKim.show()
			plusKim.set_self_modulate("ffffff1f")
			plusplusKim.set_self_modulate("ffffff1f")
			
	
	print(estado_actual)

var last_timelineKR = ""

func escogerTimelineCoreano():
	var estatusKR = btnKimKR.obtener_estado()
	match estatusKR:
		"Estado Negativo":
			last_timelineKR = escoger_random(["KimNegativo1", "KimNegativo2"], last_timelineKR)
		"Estado Positivo":
			last_timelineKR = escoger_random(["KimPositivo1", "KimPositivo2"], last_timelineKR)
		"Estado Muy Positivo":
			last_timelineKR = escoger_random(["KimMuyPositivo1", "KimMuyPositivo2"], last_timelineKR)
		"Estado Extremadamente Positivo":
			last_timelineKR = escoger_random(["KimExtremadamentePositivo1", "KimExtremadamentePositivo2"], last_timelineKR)
		"Estado Muy Negativo":
			last_timelineKR = escoger_random(["KimMuyNegativo1", "KimMuyNegativo2"], last_timelineKR)
		"Estado Extremadamente Negativo":
			last_timelineKR = escoger_random(["KimExtremadamenteNegativo1", "KimExtremadamenteNegativo2"], last_timelineKR)
		"Estado Bloqueado":
			last_timelineKR = escoger_random(["KimBloqueado1", "KimBloqueado2"], last_timelineKR)

	print("Timeline seleccionado: ", last_timelineRU)
	Dialogic.start(last_timelineRU)


#FUNCIONES DIMITRI
func _on_dimitriru_pressed() -> void:
	CallDimitri.show()
	if primeraRU == false:
		Dialogic.start("DimitriIntroduccion")
		primeraRU = true
	else:
		escogerTimelineRuso()
	Dialogic.timeline_ended.connect(terminoRuso)

func terminoRuso():
	actualizarEstatusDimitriRU()
	CallDimitri.hide()

func actualizarEstatusDimitriRU():
	var estatusRU = btnDimitriRU.obtener_estado()

	match estatusRU:
		"Estado Negativo":
			print("estado negativo chino")
			carafelizDimitri.hide()
			caratristeDimitri.show()
			plusDimitri.set_self_modulate("ffffff1f")
			plusplusDimitri.set_self_modulate("ffffff1f")
		"Estado Positivo":
			print("estado !negativo chino")
			carafelizDimitri.show()
			caratristeDimitri.hide()
			plusDimitri.set_self_modulate("ffffff1f")
			plusplusDimitri.set_self_modulate("ffffff1f")
		"Estado Muy Positivo":
			carafelizDimitri.show()
			caratristeDimitri.hide()
			plusDimitri.set_self_modulate("ffffff")
			plusplusDimitri.set_self_modulate("ffffff1f")
		"Estado Extremadamente Positivo":
			carafelizDimitri.show()
			caratristeDimitri.hide()
			plusDimitri.set_self_modulate("ffffff")
			plusplusDimitri.set_self_modulate("ffffff")
		"Estado Muy Negativo":
			carafelizDimitri.hide()
			caratristeDimitri.show()
			plusDimitri.set_self_modulate("ffffff")
			plusplusDimitri.set_self_modulate("ffffff1f")
		"Estado Extremadamente Negativo":
			carafelizDimitri.hide()
			caratristeDimitri.show()
			plusDimitri.set_self_modulate("ffffff")
			plusplusDimitri.set_self_modulate("ffffff")
		"Estado Bloqueado":
			carafelizDimitri.hide()
			caratristeDimitri.hide()
			caraneutraDimitri.show()
			plusDimitri.set_self_modulate("ffffff1f")
			plusplusDimitri.set_self_modulate("ffffff1f")
			
	
	print(estado_actual)

var last_timelineRU = ""

func escogerTimelineRuso():
	var estatusRU = btnDimitriRU.obtener_estado()
	match estatusRU:
		"Estado Negativo":
			last_timelineRU = escoger_random(["DimitriNegativo1", "DimitriNegativo2"], last_timelineRU)
		"Estado Positivo":
			last_timelineRU = escoger_random(["DimitriPositivo1", "DimitriPositivo2"], last_timelineRU)
		"Estado Muy Positivo":
			last_timelineRU = escoger_random(["DimitriMuyPositivo1", "DimitriMuyPositivo2"], last_timelineRU)
		"Estado Extremadamente Positivo":
			last_timelineRU = escoger_random(["DimitriExtremadamentePositivo1", "DimitriExtremadamentePositivo2"], last_timelineRU)
		"Estado Muy Negativo":
			last_timelineRU = escoger_random(["DimitriMuyNegativo1", "DimitriMuyNegativo2"], last_timelineRU)
		"Estado Extremadamente Negativo":
			last_timelineRU = escoger_random(["DimitriExtremadamenteNegativo1", "DimitriExtremadamenteNegativo2"], last_timelineRU)
		"Estado Bloqueado":
			last_timelineRU = escoger_random(["DimitriBloqueado1", "DimitriBloqueado2"], last_timelineRU)

	print("Timeline seleccionado: ", last_timelineRU)
	Dialogic.start(last_timelineRU)


#FUNCIONES ETHAN
func _on_ethanus_pressed() -> void:
	CallChen.show()
	if primeraUS == false:
		Dialogic.start("EthanIntroduccion")
		primeraUS = true
	else:
		escogerTimelineGringo()
	Dialogic.timeline_ended.connect(terminoGringo)

func terminoGringo():
	actualizarEstatusEthanUS()
	CallEthan.hide()

func actualizarEstatusEthanUS():
	var estatusUS = btnEthanUS.obtener_estado()

	match estatusUS:
		"Estado Negativo":
			print("estado negativo chino")
			carafelizEthan.hide()
			caratristeEthan.show()
			plusEthan.set_self_modulate("ffffff1f")
			plusplusEthan.set_self_modulate("ffffff1f")
		"Estado Positivo":
			print("estado !negativo chino")
			carafelizEthan.show()
			caratristeEthan.hide()
			plusEthan.set_self_modulate("ffffff1f")
			plusplusEthan.set_self_modulate("ffffff1f")
		"Estado Muy Positivo":
			carafelizEthan.show()
			caratristeEthan.hide()
			plusEthan.set_self_modulate("ffffff")
			plusplusEthan.set_self_modulate("ffffff1f")
		"Estado Extremadamente Positivo":
			carafelizEthan.show()
			caratristeEthan.hide()
			plusEthan.set_self_modulate("ffffff")
			plusplusEthan.set_self_modulate("ffffff")
		"Estado Muy Negativo":
			carafelizEthan.hide()
			caratristeEthan.show()
			plusEthan.set_self_modulate("ffffff")
			plusplusEthan.set_self_modulate("ffffff1f")
		"Estado Extremadamente Negativo":
			carafelizEthan.hide()
			caratristeEthan.show()
			plusEthan.set_self_modulate("ffffff")
			plusplusEthan.set_self_modulate("ffffff")
		"Estado Bloqueado":
			carafelizEthan.hide()
			caratristeEthan.hide()
			caraneutraEthan.show()
			plusEthan.set_self_modulate("ffffff1f")
			plusplusEthan.set_self_modulate("ffffff1f")
			
	
	print(estado_actual)

var last_timelineUS = ""

func escogerTimelineGringo():
	var estatusUS = btnEthanUS.obtener_estado()
	match estatusUS:
		"Estado Negativo":
			last_timelineUS = escoger_random(["EthanNegativo1", "EthanNegativo2"], last_timelineUS)
		"Estado Positivo":
			last_timelineUS = escoger_random(["EthanPositivo1", "EthanPositivo2"], last_timelineUS)
		"Estado Muy Positivo":
			last_timelineUS = escoger_random(["EthanMuyPositivo1", "EthanMuyPositivo2"], last_timelineUS)
		"Estado Extremadamente Positivo":
			last_timelineUS = escoger_random(["EthanExtremadamentePositivo1", "EthanExtremadamentePositivo2"], last_timelineUS)
		"Estado Muy Negativo":
			last_timelineUS = escoger_random(["EthanMuyNegativo1", "EthanMuyNegativo2"], last_timelineUS)
		"Estado Extremadamente Negativo":
			last_timelineUS = escoger_random(["EthanExtremadamenteNegativo1", "EthanExtremadamenteNegativo2"], last_timelineUS)
		"Estado Bloqueado":
			last_timelineUS = escoger_random(["EthanBloqueado1", "EthanBloqueado2"], last_timelineUS)

	print("Timeline seleccionado: ", last_timelineUS)
	Dialogic.start(last_timelineUS)
#AQUI TERMINA FUNCIONES ETHAN

#FUNCIONES CHEN 
func _on_chench_pressed() -> void:
	CallChen.show()
	if primeraCH == false:
		Dialogic.start("ChenIntroduccion")
		primeraCH = true
	else:
		escogerTimelineChino()
	Dialogic.timeline_ended.connect(terminoChino)
	


func terminoChino():
	actualizarEstatusChenCH()
	CallChen.hide()
#
func actualizarEstatusChenCH():
	var estatusCH = btnChenCH.obtener_estado()

	match estatusCH:
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
		"Estado Muy Positivo":
			carafelizChen.show()
			caratristeChen.hide()
			plusChen.set_self_modulate("ffffff")
			plusplusChen.set_self_modulate("ffffff1f")
		"Estado Extremadamente Positivo":
			carafelizChen.show()
			caratristeChen.hide()
			plusChen.set_self_modulate("ffffff")
			plusplusChen.set_self_modulate("ffffff")
		"Estado Muy Negativo":
			carafelizChen.hide()
			caratristeChen.show()
			plusChen.set_self_modulate("ffffff")
			plusplusChen.set_self_modulate("ffffff1f")
		"Estado Extremadamente Negativo":
			carafelizChen.hide()
			caratristeChen.show()
			plusChen.set_self_modulate("ffffff")
			plusplusChen.set_self_modulate("ffffff")
		"Estado Bloqueado":
			carafelizChen.hide()
			caratristeChen.hide()
			caraneutraChen.show()
			plusChen.set_self_modulate("ffffff1f")
			plusplusChen.set_self_modulate("ffffff1f")
			
	
	print(estado_actual)

var last_timelineCH = ""

func escogerTimelineChino():
	var estatusCH = btnChenCH.obtener_estado()
	match estatusCH:
		"Estado Negativo":
			last_timelineCH = escoger_random(["ChenNegativo1", "ChenNegativo2"], last_timelineCH)
		"Estado Positivo":
			last_timelineCH = escoger_random(["ChenPositivo1", "ChenPositivo2"], last_timelineCH)
		"Estado Muy Positivo":
			last_timelineCH = escoger_random(["ChenMuyPositivo1", "ChenMuyPositivo2"], last_timelineCH)
		"Estado Extremadamente Positivo":
			last_timelineCH = escoger_random(["ChenExtremadamentePositivo1", "ChenExtremadamentePositivo2"], last_timelineCH)
		"Estado Muy Negativo":
			last_timelineCH = escoger_random(["ChenMuyNegativo1", "ChenMuyNegativo2"], last_timelineCH)
		"Estado Extremadamente Negativo":
			last_timelineCH = escoger_random(["ChenExtremadamenteNegativo1", "ChenExtremadamenteNegativo2"], last_timelineCH)
		"Estado Bloqueado":
			last_timelineCH = escoger_random(["ChenBloqueado1", "ChenBloqueado2"], last_timelineCH)

	print("Timeline seleccionado: ", last_timelineCH)
	Dialogic.start(last_timelineCH)
	
#AQUI TERMINA FUNCIONES CHEN
	
func escoger_random(opciones, ultima_opcion):
	var nuevo_timeline = ultima_opcion
	while nuevo_timeline == ultima_opcion:
		nuevo_timeline = opciones[randi() % opciones.size()]
	return nuevo_timeline


func manejar_victoria(decision:String)->void:
	match estado_actual:
		Estado.CONF:
			match decision:
				" ":
					palabra.append(decision)
					pila.push_front("#")
					estado_actual = Estado.INICIO
		Estado.INICIO:
			match decision:
				"1":
					palabra.append(decision)
					pila.push_front("P")
					estado_actual = Estado.POSITIVO
				"2":
					palabra.append(decision)
					pila.push_front("N")
					estado_actual = Estado.NEGATIVO
		Estado.POSITIVO:
			match decision:
				"1":
					palabra.append(decision)
					pila.push_front("P")
					caratristeGen.hide()
					carafelizGen.show()
					caraneutraGen.hide()
					
				"2" when pila[0] == "P":
					palabra.append(decision)
					pila.pop_front()
					caratristeGen.hide()
					carafelizGen.show()
					caraneutraGen.hide()
				"2" when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("#")
					pila.push_front("N")
					estado_actual = Estado.NEGATIVO
					caratristeGen.show()
					carafelizGen.hide()
					caraneutraGen.hide()
				" " when pila[0] == "P":
					palabra.append(decision)
					pila.pop_front()
					caratristeGen.hide()
					carafelizGen.show()
					caraneutraGen.hide()
					estado_actual =Estado.VICTORIA
					print("FINAL VICTORIA")
					MusicaFondo.cambiarFondo("Bueno")
					Transicion.transition()
					await Transicion.on_transition_finished
					get_tree().change_scene_to_file("res://Escenas/final_bueno.tscn")
				" " when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					caratristeGen.hide()
					carafelizGen.hide()
					caraneutraGen.show()
					estado_actual =Estado.NEUTRAL
					print("FINAL NEUTRAL")
					MusicaFondo.cambiarFondo("Neutral")
					Transicion.transition()
					await Transicion.on_transition_finished
					get_tree().change_scene_to_file("res://Escenas/final_neutral.tscn")
		Estado.NEGATIVO:
			match decision:
				"2":
					palabra.append(decision)
					pila.push_front("N")
					caratristeGen.show()
					carafelizGen.hide()
					caraneutraGen.hide()
					
				"1" when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
					caratristeGen.show()
					carafelizGen.hide()
					caraneutraGen.hide()
				"1" when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("#")
					pila.push_front("P")
					caratristeGen.hide()
					carafelizGen.show()
					caraneutraGen.hide()
					estado_actual = Estado.POSITIVO
				" " when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
					caratristeGen.show()
					carafelizGen.hide()
					caraneutraGen.hide()
					estado_actual =Estado.DERROTA
					print("FINAL DERROTA")
					MusicaFondo.cambiarFondo("Malo")
					Transicion.transition()
					await Transicion.on_transition_finished
					get_tree().change_scene_to_file("res://Escenas/final_malo.tscn")
				" " when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					caratristeGen.hide()
					carafelizGen.hide()
					caraneutraGen.show()
					estado_actual =Estado.NEUTRAL
					print("FINAL NEUTRAL")
					MusicaFondo.cambiarFondo("Neutral")
					Transicion.transition()
					await Transicion.on_transition_finished
					get_tree().change_scene_to_file("res://Escenas/final_neutral.tscn")
