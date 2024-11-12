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

var Context = 0

func passAutomata(decision:String)->void:
	match Context:
		1:
			match decision:
				"1":
					Lider1.manejar_deciciones("0")
				"2":
					Lider1.manejar_deciciones("1")
				"3":
					Lider1.manejar_deciciones("2")
		2:
			match decision:
				"1":
					Lider2.manejar_deciciones("0")
				"2":
					Lider2.manejar_deciciones("1")
				"3":
					Lider2.manejar_deciciones("2")
		3:
			match decision:
				"1":
					Lider3.manejar_deciciones("0")
				"2":
					Lider3.manejar_deciciones("1")
				"3":
					Lider3.manejar_deciciones("2")
		4:
			match decision:
				"1":
					Lider4.manejar_deciciones("0")
				"2":
					Lider4.manejar_deciciones("1")
				"3":
					Lider4.manejar_deciciones("2")
	


func _on_button_1_pressed() -> void:
	passAutomata("1")


func _on_button_2_pressed() -> void:
	passAutomata("2")


func _on_button_3_pressed() -> void:
	passAutomata("3")


func _on_l_1_pressed() -> void:
	Context = 1
	print("L1 SELECT")


func _on_l_2_pressed() -> void:
	Context = 2
	print("L2 SELECT")


func _on_l_3_pressed() -> void:
	Context = 3
	print("L3 SELECT")


func _on_l_4_pressed() -> void:
	Context = 4
	print("L4 SELECT")
