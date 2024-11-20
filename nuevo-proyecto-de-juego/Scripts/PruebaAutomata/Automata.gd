extends Node


@onready var Opc1 = $Control/Button1
@onready var Opc2 = $Control/Button2
@onready var Opc3 = $Control/Button3

@onready var L1Btn = $Control/L1
@onready var L2Btn = $Control/L2
@onready var L3Btn = $Control/L3
@onready var L4Btn = $Control/L4

@onready var Lider1 = $Lider1
@onready var Lider2 = $Lider2
@onready var Lider3 = $Lider3
@onready var Lider4 = $Lider4


#Estados automata
enum Estado {CONF,INICIO,POSITIVO,NEUTRAL,NEGATIVO,VICTORIA,DERROTA}
var estado_actual: Estado = Estado.CONF
var palabra: Array = []

#Pila  
var pila :Array = []

var Context = 0

func _ready() -> void:
	manejar_victoria(" ")

#func passAutomata(decision:String)->void:
	#match Context:
		#1:
			#match decision:
				#"1":
					#Lider1.manejar_deciciones("0")
				#"2":
					#Lider1.manejar_deciciones("1")
				#"3":
					#Lider1.manejar_deciciones("2")
		#2:
			#match decision:
				#"1":
					#Lider2.manejar_deciciones("0")
				#"2":
					#Lider2.manejar_deciciones("1")
				#"3":
					#Lider2.manejar_deciciones("2")
		#3:
			#match decision:
				#"1":
					#Lider3.manejar_deciciones("0")
				#"2":
					#Lider3.manejar_deciciones("1")
				#"3":
					#Lider3.manejar_deciciones("2")
		#4:
			#match decision:
				#"1":
					#Lider4.manejar_deciciones("0")
				#"2":
					#Lider4.manejar_deciciones("1")
				#"3":
					#Lider4.manejar_deciciones("2")
	#


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
				"2" when pila[0] == "P":
					palabra.append(decision)
					pila.pop_front()
				"2" when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("#")
					pila.push_front("N")
					estado_actual = Estado.NEGATIVO
				" " when pila[0] == "P":
					palabra.append(decision)
					pila.pop_front()
					estado_actual =Estado.VICTORIA
					print("FINAL VICTORIA")
					MusicaFondo.cambiarFondo("Bueno")
					Transicion.transition()
					await Transicion.on_transition_finished
					get_tree().change_scene_to_file("res://Escenas/final_bueno.tscn")
				" " when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
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
				"1" when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
				"1" when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("#")
					pila.push_front("P")
					estado_actual = Estado.POSITIVO
				" " when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
					estado_actual =Estado.DERROTA
					print("FINAL DERROTA")
					MusicaFondo.cambiarFondo("Malo")
					Transicion.transition()
					await Transicion.on_transition_finished
					get_tree().change_scene_to_file("res://Escenas/final_malo.tscn")
				" " when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					estado_actual =Estado.NEUTRAL
					print("FINAL NEUTRAL")
					MusicaFondo.cambiarFondo("Neutral")
					Transicion.transition()
					await Transicion.on_transition_finished
					get_tree().change_scene_to_file("res://Escenas/final_neutral.tscn")
					
					
#func _on_button_1_pressed() -> void:
	#passAutomata("1")
	#manejar_victoria("1")
#
#
#func _on_button_2_pressed() -> void:
	#passAutomata("2")
	#manejar_victoria("2")
#
#
#func _on_button_3_pressed() -> void:
	#passAutomata("3")
#
#
#func _on_l_1_pressed() -> void:
	#Context = 1
	#print("L1 SELECT")
#
#
#func _on_l_2_pressed() -> void:
	#Context = 2
	#print("L2 SELECT")
#
#
#func _on_l_3_pressed() -> void:
	#Context = 3
	#print("L3 SELECT")
#
#
#func _on_l_4_pressed() -> void:
	#Context = 4
	#print("L4 SELECT")
#
#
#func _on_button_4_pressed() -> void:
	#manejar_victoria(" ")
