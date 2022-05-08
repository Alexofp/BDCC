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
const Penis = "penis"

static func getAll():
	return [Hair, Horns, Ears, Head, Body, Breasts, Arms, Penis, Tail, Legs]

const Registry = {
	Hair: {
		"Bald": "res://Player/Limbs/hair/HairBase.tscn",
		"Ponytail": "res://Player/Limbs/hair/PonytailHair.tscn",
		"Ferri": "res://Player/Limbs/hair/FerriHair.tscn",
		"Messy": "res://Player/Limbs/hair/MessyHair.tscn",
		"Simple": "res://Player/Limbs/hair/SimpleHair.tscn",
		"Long": "res://Player/Limbs/hair/LongHair.tscn",
		"CombedBack": "res://Player/Limbs/hair/CombedBackHair.tscn",
		"Mohawk": "res://Player/Limbs/hair/MohawkHair.tscn",
	},
	Horns: {
		"Nothing": "res://Player/Limbs/horns/HornsBase.tscn",
		"Dragon": "res://Player/Limbs/horns/DragonHorns.tscn",
		"Dragon2": "res://Player/Limbs/horns/DragonHorns2.tscn",
	},
	Ears: {
		"Human": "res://Player/Limbs/ear/HumanEars.tscn",
		"Cat": "res://Player/Limbs/ear/CatEars.tscn",
		"Lynx": "res://Player/Limbs/ear/LynxEars.tscn",
		"Lynx2": "res://Player/Limbs/ear/LynxEars2.tscn",
		"Canine": "res://Player/Limbs/ear/CanineEars.tscn",
		"Wolf": "res://Player/Limbs/ear/WolfEars.tscn",
		"Dragon": "res://Player/Limbs/ear/DragonEars.tscn",
		"Dragon2": "res://Player/Limbs/ear/DragonEars2.tscn",
	},
	Head: {
		"Human": "res://Player/Limbs/head/HumanHead.tscn",
		"Cat": "res://Player/Limbs/head/CatHead.tscn",
		"Canine": "res://Player/Limbs/head/CanineHead.tscn",
		"Fox": "res://Player/Limbs/head/FoxHead.tscn",
		"Wolf": "res://Player/Limbs/head/WolfHead.tscn",
		"Dragon": "res://Player/Limbs/head/DragonHead.tscn",
	},
	Body: {
		"Human": "res://Player/Limbs/body/HumanBody.tscn",
	},
	Breasts: {
		"Flat": "res://Player/Limbs/breasts/BreastsFlat.tscn",
		"Small": "res://Player/Limbs/breasts/BreastsSmall.tscn",
		"Medium": "res://Player/Limbs/breasts/BreastsMedium.tscn",
		"Curvy": "res://Player/Limbs/breasts/BreastsCurvy.tscn",
		"Big": "res://Player/Limbs/breasts/BreastsBig.tscn",
	},
	Arms: {
		"Human": "res://Player/Limbs/arm/HumanArms.tscn",
	},
	Penis: {
		"Nothing": "res://Player/Limbs/penis/PenisBase.tscn",
		"Human": "res://Player/Limbs/penis/HumanPenis.tscn",
		"Canine": "res://Player/Limbs/penis/CaninePenis.tscn",
		"Dragon": "res://Player/Limbs/penis/DragonPenis.tscn",
	},
	Tail: {
		"Nothing": "res://Player/Limbs/tail/TailBase.tscn",
		"Cat": "res://Player/Limbs/tail/CatTail.tscn",
		"Dragon": "res://Player/Limbs/tail/DragonTail.tscn",
		"Short": "res://Player/Limbs/tail/ShortTail.tscn",
		"Canine": "res://Player/Limbs/tail/CanineTail.tscn",
		"Husky": "res://Player/Limbs/tail/HuskyTail.tscn",
	},
	Legs: {
		"Human": "res://Player/Limbs/leg/HumanLeg.tscn",
		"Digi": "res://Player/Limbs/leg/DigiLeg.tscn",
	}
}
