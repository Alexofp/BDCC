extends Object
class_name LimbTypes

const Hair = "hair"
const Horns = "horns"
const Ears = "ears"
const Head = "head"
const Body = "body"
const Breasts = "breasts"
const Arms = "arms"
const Tail = "tail"
const Legs = "legs"

static func getAll():
	return [Hair, Horns, Ears, Head, Body, Breasts, Arms, Tail, Legs]

const Registry = {
	Hair: {
		"Bald": "res://Player/Limbs/hair/HairBase.tscn",
		"Ponytail": "res://Player/Limbs/hair/PonytailHair.tscn",
		"Ferri": "res://Player/Limbs/hair/FerriHair.tscn",
	},
	Horns: {
		"Nothing": "res://Player/Limbs/horns/HornsBase.tscn",
		"Dragon": "res://Player/Limbs/horns/DragonHorns.tscn",
	},
	Ears: {
		"Human": "res://Player/Limbs/ear/HumanEars.tscn",
		"Cat": "res://Player/Limbs/ear/CatEars.tscn",
	},
	Head: {
		"Human": "res://Player/Limbs/head/HumanHead.tscn",
		"Cat": "res://Player/Limbs/head/CatHead.tscn",
	},
	Body: {
		"Human": "res://Player/Limbs/body/HumanBody.tscn",
	},
	Breasts: {
		"Flat": "res://Player/Limbs/breasts/BreastsFlat.tscn",
		"Curvy": "res://Player/Limbs/breasts/BreastsCurvy.tscn",
	},
	Arms: {
		"Human": "res://Player/Limbs/arm/HumanArms.tscn",
	},
	Tail: {
		"Nothing": "res://Player/Limbs/tail/TailBase.tscn",
		"Cat": "res://Player/Limbs/tail/CatTail.tscn",
		"Dragon": "res://Player/Limbs/tail/DragonTail.tscn",
	},
	Legs: {
		"Human": "res://Player/Limbs/leg/HumanLeg.tscn",
		"Digi": "res://Player/Limbs/leg/DigiLeg.tscn",
	}
}
