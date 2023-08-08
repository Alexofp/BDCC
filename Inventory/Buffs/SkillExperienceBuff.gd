extends BuffBase

var skill = ""
var amount = 0

func _init():
	id = Buff.SkillExperienceBuff

func initBuff(_args):
	skill = _args[0]
	amount = _args[1]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	
	var skillObject:SkillBase = GlobalRegistry.createSkill(skill)
		
	return skillObject.getVisibleName()+" experience "+text+"%"

func apply(_buffHolder):
	if(!_buffHolder.skillsExperience.has(skill)):
		_buffHolder.skillsExperience[skill] = 0.0
	_buffHolder.skillsExperience[skill] += (amount/100.0)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return DamageType.getColor(DamageType.Stamina)

func saveData():
	var data = .saveData()
	
	data["skill"] = skill
	data["amount"] = amount

	return data
	
func loadData(_data):
	.loadData(_data)
	skill = SAVE.loadVar(_data, "skill", "")
	amount = SAVE.loadVar(_data, "amount", 0)

func canCombine(_otherBuff):
	if(_otherBuff.skill != skill):
		return false
	return true

func combine(_otherBuff):
	if(_otherBuff.amount > amount):
		amount = _otherBuff.amount
