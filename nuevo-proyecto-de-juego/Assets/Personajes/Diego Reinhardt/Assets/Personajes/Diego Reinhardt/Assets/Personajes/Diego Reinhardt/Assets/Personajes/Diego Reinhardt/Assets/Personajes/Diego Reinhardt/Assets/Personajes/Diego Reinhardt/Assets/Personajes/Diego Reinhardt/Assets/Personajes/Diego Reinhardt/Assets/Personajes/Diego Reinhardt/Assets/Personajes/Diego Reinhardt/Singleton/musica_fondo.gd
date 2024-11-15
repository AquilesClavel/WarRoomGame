extends Node
@onready var Musica = $MusicaFondo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Musica.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
