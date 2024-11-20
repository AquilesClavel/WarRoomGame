extends Node

@onready var Computadora = get_node("/root/Control")

#Estados del Automata
enum Estados {
	Inicial,
	Negativo,
	Positivo,
	MuyPositivo,
	ExtremadamentePositivo,
	MuyNegativo,
	ExtremadamenteNegativo,
	Bloqueado
}

#Estado Inicial del Lider
var estado_actual = Estados.Inicial

var pila = []

func transcionar (entrada):
	#Si la entrada es B: Buena
	if entrada == "B":
		match estado_actual:
			#Estados Negativos
			Estados.Negativo:
				estado_actual = Estados.Positivo
				pila.pop_front()
				pila.append("P")
			Estados.MuyNegativo:
				estado_actual = Estados.Negativo
				pila.pop_front()
				pila.append("MN")
			Estados.ExtremadamenteNegativo:
				estado_actual = Estados.MuyNegativo
				pila.pop_front()
				pila.append("EN")
				
			#Estados Positivos
			Estados.Positivo:
				estado_actual = Estados.MuyPositivo
				pila.pop_front()
				pila.append("MP")
			Estados.MuyPositivo:
				estado_actual = Estados.ExtremadamentePositivo
				pila.pop_front()
				pila.append("EP")
			Estados.ExtremadamentePositivo:
				estado_actual = Estados.Bloqueado
				pila.pop_front()
				pila.append("EP")
				
				
	elif entrada == "M":
		match estado_actual:
			#Estados Negativos
			Estados.Negativo:
				estado_actual = Estados.MuyNegativo
				pila.pop_front()
				pila.append("MN")
			Estados.MuyNegativo:
				estado_actual = Estados.ExtremadamenteNegativo
				pila.pop_front()
				pila.append("EN")
			Estados.ExtremadamenteNegativo:
				estado_actual = Estados.Bloqueado
				pila.pop_front()
				pila.append("EN")
				
			#Estados Positivos
			Estados.Positivo:
				estado_actual = Estados.Negativo
				pila.pop_front()
				pila.append("N")
			Estados.MuyPositivo:
				estado_actual = Estados.Positivo
				pila.pop_front()
				pila.append("P")
			Estados.ExtremadamentePositivo:
				estado_actual = Estados.MuyPositivo
				pila.pop_front()
				pila.append("MP")
		
			#Estado Neutral
			Estados.Inicial:
				estado_actual = Estados.Negativo
				pila.append("N")

func obtener_estado():
	match estado_actual:
		Estados.Negativo:
			return "Estado Negativo"
		Estados.Positivo:
			return "Estado Positivo"
		Estados.MuyPositivo:
			return "Estado Muy Positivo"
		Estados.ExtremadamentePositivo:
			return "Estado Extremadamente Positivo"
		Estados.MuyNegativo:
			return "Estado Muy Negativo"
		Estados.ExtremadamenteNegativo:
			return "Estado Extremadamente Negativo"
		Estados.Bloqueado:
			return "Estado Bloqueado"
		_:
			return "Estado desconocido"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transcionar("M")
	Dialogic.signal_event.connect(Evento)
	

func Evento(decision:String):
	if decision == "negativaChenCH":
		transcionar("M")
		Computadora.manejar_victoria("2")
		print("negatvo")
	
	if decision == "positivaChenCH":
		transcionar("B")
		Computadora.manejar_victoria("1")
		print("positivo")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
