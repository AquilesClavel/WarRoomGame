extends Node2D

#Estados automata
enum Estado {COMIENZO,NEUTRAL,POSITIVO,NEGATIVO,ESCALADO,GUERRA}
var estado_actual: Estado = Estado.COMIENZO
var palabra: Array = []

#Pila  
var pila :Array = []

#Manejar transiciones
func manejar_deciciones(decision)->void:
	match estado_actual:
		Estado.COMIENZO:
			match decision:
				"":
					palabra.append(decision)
					pila.push_front("#")
					estado_actual = Estado.NEUTRAL
		Estado.NEUTRAL:
			match decision:
				"0":
					palabra.append(decision)
					pila.push_front("P")
					estado_actual = Estado.POSITIVO
				"1":
					palabra.append(decision)
					pila.push_front("N")
					estado_actual = Estado.NEGATIVO
				"2":#Neutral
					palabra.append("2")
		Estado.POSITIVO:
			match decision:
				"0" when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("P")
				"0" when pila[0] == "P":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("P")
				"1" when pila[0] == "P":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("N")
					estado_actual = Estado.NEGATIVO
				"2":#Neutral
					palabra.append("2")
		Estado.NEGATIVO:
			match decision:
				"1" when pila[0] == "P":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("N")
				"1" when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("N")
					estado_actual = Estado.ESCALADO
				"0" when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("P")
					estado_actual = Estado.POSITIVO
				"2":#Neutral
					palabra.append("2")
		Estado.ESCALADO:
			match decision:
				"1" when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
				"0" when pila[0] == "N":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("N")
					estado_actual = Estado.NEGATIVO
				"0" when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					pila.push_front("#")
					pila.push_front("N")
				"1" when pila[0] == "#":
					palabra.append(decision)
					pila.pop_front()
					estado_actual = Estado.GUERRA
				"2":#Neutral
					palabra.append("2")
		Estado.GUERRA:
			print("GUERRA")
	print("L2 Estado Actual: ",estado_actual," || L2 pila: ",pila)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	manejar_deciciones("")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
