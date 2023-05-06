extends Area2D

signal coletada

func _ready():
	pass # Replace with function body.

func _on_Coins_body_entered(body):
	queue_free()
	emit_signal("coletada")
