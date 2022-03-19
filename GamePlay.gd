extends CanvasLayer

signal level_changed(level_name)

export (String) var level_name = "level"


func _on_ChangeSceneButton_pressed() -> void:
	$ChangeSceneButton.disabled = true
	emit_signal("level_changed", level_name)
