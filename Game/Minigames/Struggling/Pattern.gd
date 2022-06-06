extends Node2D

export(bool) var supportsVerticalFlip = true
export(bool) var supportsHorizontalFlip = true

func canFlipV():
	return supportsVerticalFlip

func canFlipH():
	return supportsHorizontalFlip

