extends Node

signal onDragStarted
signal onDragEnded

func emitOnDragStarted():
	emit_signal("onDragStarted")

func emitOnDragEnded():
	emit_signal("onDragEnded")
