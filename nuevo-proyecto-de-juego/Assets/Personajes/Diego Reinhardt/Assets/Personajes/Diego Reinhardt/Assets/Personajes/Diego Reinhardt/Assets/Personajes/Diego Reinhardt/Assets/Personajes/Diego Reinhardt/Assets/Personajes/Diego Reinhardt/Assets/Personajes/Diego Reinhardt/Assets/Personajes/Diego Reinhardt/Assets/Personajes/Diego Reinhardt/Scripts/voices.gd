extends Node2D
@onready var Chat1 = $Chat1
@onready var Chat2 = $Chat2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if !Chat1.is_playing():
		Chat1.play()
	else:
		if !Chat2.is_playing():
			Chat2.play()
