extends Node
@onready var Musica = $MusicaFondo
var Malo = load("res://Assets/Finales/Adagio.mp3")
var Bueno = load("res://Assets/Finales/FinalBueno.mp3")
var Neutral = load("res://Assets/Finales/Clair de Lune (Studio Version) [ ezmp3.cc ].mp3")
var Menu = load("res://Assets/MusicaFondo.mp3")
func cambiarFondo(fondo:String = "Reset")->void:
	match fondo:
		"Malo":
			Musica.set_stream(Malo)
			Musica.play()
		"Bueno":
			Musica.set_stream(Bueno)
			Musica.play()
		"Neutral":
			Musica.set_stream(Neutral)
			Musica.play()
		"Reset":
			Musica.set_stream(Menu)
			Musica.play()
			
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Musica.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
