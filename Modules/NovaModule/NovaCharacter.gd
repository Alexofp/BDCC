extends Character

func _init():
	id = "nova"
	
func _getName():
	return "Nova"

func getGender():
	return Character.Gender.Androgynous
	
func getPronounGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "Gray husky that wears hi-tech guard armor. Medium height, fit body"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["stunbatonAttack", "stunbatonOverchargeAttack", "AIHumiliateMommy", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	var mes = "Nova’s power armor lights up as she grabs her trusty stun baton and directs her attention to you."
	mes += "\n\n"
	return mes+formatSay("You have no right to remain silent, anything I say will be used against you. Come here, sweetie~")
