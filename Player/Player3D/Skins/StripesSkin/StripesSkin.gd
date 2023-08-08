extends SkinBase

func _init():
	id = "StripesSkin"

func getName():
	return "Stripes"

func getPatternTexture():
	return preload("res://Player/Player3D/Skins/StripesSkin/stripesSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}
