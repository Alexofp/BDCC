extends TFEffect

var howMuch:int = 1

func _init():
	id = "BreastSizeInc"

func initArgs(_args:Array):
	if(_args.size() > 0):
		howMuch = _args[0]

func applyEffect(_data:Dictionary) -> Dictionary:
	var origSize = _data["size"] if _data.has("size") else BreastsSize.FLAT
	
	if(_data.has("size")):
		_data["size"] += howMuch
	else:
		_data["size"] = BreastsSize.FLAT + howMuch
	
	return {
		origSize = origSize,
		size = _data["size"],
		success = true,
	}
	
func onReplace(_otherEffect):
	howMuch += _otherEffect.howMuch

func generateTransformText(_result:Dictionary):
	var origSize:int = _result["origSize"]
	var size:int = _result["size"]
	
	#addText("Increased breast size from "+str(origSize)+" up to "+str(size)+". {npc.YourHis} breasts are now {npc.breasts}.")
	addText(describeBreastTransformation(origSize, size))


func breastSizeToString(size:int) -> String:
	if(size <= BreastsSize.FLAT):
		return "flat"
	if(size <= BreastsSize.A):
		return "small"
	if(size <= BreastsSize.C):
		return "medium"
	if(size <= BreastsSize.G):
		return "big"
	return "huge"

func describeBreastTransformation(origSize:int, size:int) -> String:
	# Define descriptive terms for breast sizes
	var initial_size:String = breastSizeToString(origSize)
	var target_size:String = breastSizeToString(size)

	# Handle cases where sizes are the same
	if initial_size == target_size:
		if(origSize == size):
			return RNG.pick([
				"There is a slight tingle in {npc.yourHis} breasts but their size didn't seem to change.",
				"A faint warmth spreads through {npc.yourHis} chest, but no noticeable changes occur."
			])
		if(size > origSize):
			return RNG.pick([
				"There is a slight tingle in {npc.yourHis} breasts as they get slightly fuller and heavier.",
				"A gentle warmth flows through {npc.yourHis} chest as the breasts subtly grow fuller."
			])
		else:
			return RNG.pick([
				"There is a slight tingle in {npc.yourHis} breasts as they get slightly smaller and less heavy.",
				"A faint sensation of lightness spreads as {npc.yourHis} breasts reduce slightly in size."
			])

	# Build the transformation description
	var transformation_desc = ""

	# Enlargement transformations
	if initial_size == "flat" and target_size == "small":
		transformation_desc = RNG.pick([
			"A faint tingling begins as {npc.yourHis} flat chest starts to swell into petite and modest breasts.",
			"A gentle warmth radiates from {npc.yourHis} chest, causing it to swell slightly into a modest shape."
		])
	elif initial_size == "flat" and target_size == "medium":
		transformation_desc = RNG.pick([
			"{npc.YourHis} flat chest quickly grows, blossoming into pleasantly rounded breasts.",
			"A surge of energy flows through {npc.yourHis} chest, expanding it into a pleasant, rounded shape."
		])
	elif initial_size == "flat" and target_size == "big":
		transformation_desc = RNG.pick([
			"{npc.YourHis} flat chest surges outward, expanding dramatically into large and full breasts.",
			"An intense heat courses through {npc.yourHis} chest, swelling it rapidly into full and heavy curves."
		])
	elif initial_size == "flat" and target_size == "huge":
		transformation_desc = RNG.pick([
			"An intense warmth spreads as {npc.yourHis} flat chest transforms, swelling massively into overwhelming breasts.",
			"A deep pulse of energy engulfs {npc.yourHis} chest, inflating it into an awe-inspiring, massive size."
		])
	elif initial_size == "small" and target_size == "medium":
		transformation_desc = RNG.pick([
			"{npc.YourHis} petite breasts fill out further, becoming pleasantly rounded and fuller.",
			"A gentle tingling causes {npc.yourHis} modest chest to swell into a fuller, more rounded shape."
		])
	elif initial_size == "small" and target_size == "big":
		transformation_desc = RNG.pick([
			"{npc.YourHis} modest breasts expand rapidly, taking on a large and full shape.",
			"A wave of heat radiates through {npc.yourHis} chest, swelling it into large and heavy curves."
		])
	elif initial_size == "small" and target_size == "huge":
		transformation_desc = RNG.pick([
			"A deep pulse of energy swells {npc.yourHis} modest breasts into massive, overwhelming proportions.",
			"A surge of warmth engulfs {npc.yourHis} chest, inflating it into an almost impossible, massive size."
		])
	elif initial_size == "medium" and target_size == "big":
		transformation_desc = RNG.pick([
			"{npc.YourHis} rounded breasts push outward, growing larger and fuller.",
			"A tingling sensation fills {npc.yourHis} chest as it expands into a fuller and heavier shape."
		])
	elif initial_size == "medium" and target_size == "huge":
		transformation_desc = RNG.pick([
			"{npc.YourHis} pleasantly rounded breasts surge dramatically, transforming into massive, awe-inspiring proportions.",
			"A powerful heat courses through {npc.yourHis} chest, inflating it to an overwhelming size."
		])
	elif initial_size == "big" and target_size == "huge":
		transformation_desc = RNG.pick([
			"{npc.YourHis} already large breasts swell further, becoming nearly overwhelming in size.",
			"A heavy warmth overtakes {npc.yourHis} chest, inflating it into massive, eye-catching proportions."
		])

	# Reduction transformations
	elif initial_size == "small" and target_size == "flat":
		transformation_desc = RNG.pick([
			"{npc.YourHis} petite breasts slowly shrink, leaving a perfectly flat chest behind.",
			"A cool sensation spreads through {npc.yourHis} chest as it flattens completely."
		])
	elif initial_size == "medium" and target_size == "small":
		transformation_desc = RNG.pick([
			"{npc.YourHis} pleasantly rounded breasts reduce in size, becoming petite and modest.",
			"A soft tingling causes {npc.yourHis} full chest to shrink into a more modest shape."
		])
	elif initial_size == "medium" and target_size == "flat":
		transformation_desc = RNG.pick([
			"{npc.YourHis} rounded breasts shrink away entirely, leaving a flat chest.",
			"A cooling wave engulfs {npc.yourHis} chest, reducing it to a perfectly flat form."
		])
	elif initial_size == "big" and target_size == "medium":
		transformation_desc = RNG.pick([
			"{npc.YourHis} large breasts recede slightly, settling into a pleasantly rounded size.",
			"A faint lightness spreads through {npc.yourHis} chest as it shrinks into a more manageable size."
		])
	elif initial_size == "big" and target_size == "small":
		transformation_desc = RNG.pick([
			"{npc.YourHis} full breasts shrink down dramatically, leaving a modest and petite shape.",
			"A noticeable cooling sensation flows through {npc.yourHis} chest, reducing it significantly."
		])
	elif initial_size == "big" and target_size == "flat":
		transformation_desc = RNG.pick([
			"{npc.YourHis} large breasts shrink away entirely, leaving a flat chest.",
			"An intense cooling spreads through {npc.yourHis} chest, erasing its fullness completely."
		])
	elif initial_size == "huge" and target_size == "big":
		transformation_desc = RNG.pick([
			"{npc.YourHis} massive breasts decrease in size, while still staying large and full.",
			"A heavy warmth fades slightly, leaving {npc.yourHis} chest large but less overwhelming."
		])
	elif initial_size == "huge" and target_size == "medium":
		transformation_desc = RNG.pick([
			"{npc.YourHis} overwhelming breasts shrink significantly but still leaving a pleasantly rounded size.",
			"A cooling wave flows through {npc.yourHis} chest, reducing it to a more manageable but full shape."
		])
	elif initial_size == "huge" and target_size == "small":
		transformation_desc = RNG.pick([
			"{npc.YourHis} massive breasts deflate dramatically, leaving a modest and petite shape.",
			"A noticeable cooling sensation causes {npc.yourHis} chest to shrink into a modest size."
		])
	elif initial_size == "huge" and target_size == "flat":
		transformation_desc = RNG.pick([
			"{npc.YourHis} massive breasts shrink away completely, leaving a flat chest.",
			"An intense chill spreads through {npc.yourHis} chest, reducing it to a flat surface."
		])

	# Default case for unexpected input
	if transformation_desc == "":
		transformation_desc = RNG.pick([
			"{npc.YourHis} breasts tingle but nothing about their size seems to have changed.",
			"A faint energy flows through {npc.yourHis} chest, but no noticeable difference is apparent."
		])

	return transformation_desc
