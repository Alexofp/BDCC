extends ItemBase

var chastity:bool = true

func _init():
	id = "LatexStraitjacket"

func getVisibleName():
	return "Latex Straitjacket"

func getDescription():
	if(chastity):
		return "A very fashionable straitjacket with included chastity belt and holes for breasts\nChastity belt: [b]Enabled[/b]"
	return "A very fashionable straitjacket holes for breasts.\nChastity belt: [b]Disabled[/b]"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	if(chastity):
		return [
			buff(Buff.BlockedHandsBuff),
			buff(Buff.RestrainedArmsBuff),
			buff(Buff.ChastityVaginaBuff),
			buff(Buff.ChastityPenisBuff),
			]
	return [
		buff(Buff.BlockedHandsBuff),
		buff(Buff.RestrainedArmsBuff),
		]

func getTags():
	return [ItemTag.BDSMRestraint]

func getPrice():
	return 30

func getSellPrice():
	return 25

func isRestraint():
	return true

func coversBodyparts():
	if(chastity):
		return {
			BodypartSlot.Body: true,
			BodypartSlot.Vagina: true,
			BodypartSlot.Penis: true,
			}
	return {
		BodypartSlot.Body: true,
		}

func generateRestraintData():
	restraintData = RestraintStraitjacket.new()
	restraintData.setLevel(5)

func getRiggedParts(_character):
	if(chastity):
		return {
			"straitjacket": "res://Inventory/RiggedModels/StraitJacket/StraitJacket.tscn",
		}
	return {
		"straitjacket": "res://Inventory/RiggedModels/StraitJacket/StraitJacketNoBelt.tscn",
	}

func getHidesParts(_character):
	if(chastity):
		return {
			BodypartSlot.Penis: true,
			BodypartSlot.Arms: true,
		}
	return {
		BodypartSlot.Arms: true,
	}

func getHidesAttachments(_character):
	return {
		"wrist.R": true,
		"wrist.L": true,
	}

func getInventoryImage():
	return "res://Images/Items/bdsm/jacket.png"

func getPossibleActions():
	if(isWornByWearer()): # Can only toggle the belt off if we're not wearing the thing
		return []
	return [
		{
			"name": "Toggle belt",
			"scene": "UseItemLikeInCombatScene",
			"description": "Choose if you want to combo the straitjacket with a chastity belt",
		},
	]

func useInCombat(_attacker, _receiver):
	var text:String= ""
	chastity = !chastity
	if(chastity):
		text = "You will now wear a chastity belt together with this straitjacket!"
	else:
		text = "You will not wear a chastity belt together with this straitjacket."
	
	if(isWornByWearer()):
		updateWearerAppearance()
	
	return text
