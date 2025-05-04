extends TFEffect

var howMuch:int = 1

func _init():
	id = "BreastSizeChange"

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
	var breastsCovered:bool = (getChar().getFirstItemThatCoversBodypart(BodypartSlot.Breasts) != null)
	
	#addText("Increased breast size from "+str(origSize)+" up to "+str(size)+". {npc.YourHis} breasts are now {npc.breasts}.")
	addText(describeBreastTransformation(origSize, size, breastsCovered))
	addText(describeNewSize(origSize, size, breastsCovered))

func generateShortTransformText(_result:Dictionary):
	var origSize:int = _result["origSize"]
	var size:int = _result["size"]
	var breastsCovered:bool = (getChar().getFirstItemThatCoversBodypart(BodypartSlot.Breasts) != null)
	
	addText(describeBreastTransformation(origSize, size, breastsCovered))

func describeNewSize(origSize:int, size:int, _breastsCovered:bool = false) -> String:
	var nowOrStill := "now"
	if(size <= origSize || ((origSize in [BreastsSize.FLAT, BreastsSize.FOREVER_FLAT]) && (size in [BreastsSize.FLAT, BreastsSize.FOREVER_FLAT]))):
		nowOrStill = "still"
	
	if(size <= BreastsSize.FLAT):
		return RNG.pick([
			"{npc.YourHis} chest is "+nowOrStill+" completely flat, smooth and {npc.masc}. The absence of curves gives {npc.youHim} a sleek, streamlined appearance, emphasizing {npc.yourHis} other features. {npc.YouHe} {npc.youVerb('feel')} a sense of freedom, unencumbered by weight.",
		])
	if(size <= BreastsSize.A):
		return RNG.pick([
			"{npc.YourHis} breasts are "+nowOrStill+" modestly rounded and perky, sitting high on {npc.yourHis} chest. The gentle curve adds a hint of femininity, drawing attention to {npc.yourHis} collarbone and shoulders, enhancing {npc.yourHis} overall allure.",
		])
	if(size <= BreastsSize.B):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " quite obvious and soft, with a lovely shape that bounces ever so slightly with {npc.yourHis} movements. The gentle curves create a more pronounced silhouette, making {npc.youHim} feel both sexy and confident.",
		])
	if(size <= BreastsSize.C):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " voluptuous and full, swelling with a delightful weight that creates a captivating sight. The soft curves invite touch, and {npc.youHim} can feel the warmth radiating from {npc.yourHis} chest, enhancing {npc.yourHis} sensuality.",
		])
	if(size <= BreastsSize.D):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " generous and heavy, with a tantalizing fullness that pulls gently at {npc.yourHis} chest. The deep, inviting cleavage is accentuated by {npc.yourHis} more pronounced nipples, which are sensitive to the slightest touch.",
		])
	if(size <= BreastsSize.DD):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " impressively overflowing with softness and allure. They are undeniably eye-catching, with voluptuous shapes that demand attention. The weight and fullness create a seductive bounce, making every movement feel intoxicating.",
		])
	if(size <= BreastsSize.DDD):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " strikingly full and curvaceous, sitting proudly on {npc.yourHis} chest. The dramatic silhouette is both alluring and overwhelming, and the weight of them is intoxicating, with sensitive nipples eager for attention.",
		])
	if(size <= BreastsSize.G):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " stunningly large and captivating, heavy and full with a deep valley of cleavage that is both inviting and provocative. The sheer size draws all eyes to {npc.youHim}, and {npc.youHim} can feel the power of {npc.yourHis} curves.",
		])
	if(size <= BreastsSize.H):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " eye-poppingly voluptuous and commanding, swaying with every movement. The breathtaking curves and prominent nipples beg for attention, teasing with their sensitivity.",
		])
	if(size <= BreastsSize.I):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " astonishingly full, a marvel of softness and allure. They are heavy and round, creating a dramatic presence that is impossible to ignore, with sensitive nipples eager for touch.",
		])
	if(size <= BreastsSize.J):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " jaw-droppingly large and undeniably sexy, overflowing with softness and creating a deep, inviting cleavage. The sheer size and weight make {npc.youHim} feel powerful, radiating confidence.",
		])
	if(size <= BreastsSize.K):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " breathtakingly voluptuous, heavy and full with a stunning silhouette that captivates all who gaze upon {npc.youHim}. The weight is intoxicating, and {npc.yourHis} sensitive nipples crave attention.",
		])
	if(size <= BreastsSize.L):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " extraordinarily large, a marvel of curves and softness. They create a dramatic presence that is both alluring and overwhelming, making {npc.youHim} feel incredibly sexy and confident.",
		])
	if(size <= BreastsSize.M):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " magnificent, a true spectacle of voluptuousness. They are heavy and round, creating a deep valley of cleavage that is both inviting and provocative, drawing all eyes to {npc.youHim}.",
		])
	if(size <= BreastsSize.N):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " astonishingly full, a breathtaking display of softness and allure. They create a dramatic silhouette that captivates all who gaze upon {npc.youHim}, radiating confidence and power.",
		])
	if(size == BreastsSize.O || true):
		return RNG.pick([
			"{npc.YourHis} breasts are " + nowOrStill + " incredible, a true marvel of size and sensuality. They are heavy and full, creating a stunning presence that is impossible to ignore, making {npc.youHim} feel powerful and alluring.",
		])
	
	return ""

func describeBreastTransformation(origSize:int, size:int, breastsCovered:bool = false) -> String:
	if(origSize == size):
		return RNG.pick([
			"There is a slight warm tingle in {npc.yourHis} breasts, a gentle pulse that radiates through {npc.yourHis} chest. As the sensation washes over, {npc.youHe} {npc.youVerb('expect')} something to happen, but nothing about them seems to be changing. The familiar weight remains.",
			"A soft warmth envelops {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('sense')} a shift in energy, but the size remains unchanged. The tingling sensation lingers, teasing {npc.youHim} with the possibility of change, yet {npc.yourHis} breasts hold their familiar shape. {npc.YouHe} {npc.youAre} left feeling both relieved and oddly unsatisfied as the moment passes.",
			"A gentle warmth spreads through {npc.yourHis} chest, and for a moment, {npc.youHe} {npc.youVerb('think')} something might happen. But as the sensation fades, {npc.youHe} {npc.youVerb('realize')} {npc.yourHis} breasts are just as they were. Same size and same volume.",
			"A soft tingling sensation courses through {npc.yourHis} chest, and {npc.youHe} {npc.youVerb('brace')} for a change. But as the warmth fades, {npc.youHe} {npc.youVerb('realize')} that {npc.yourHis} breasts are still the same, their size and weight unchanged.",
		])
	var diff:int = size - origSize
	if(diff == 1):
		return RNG.pick([
			"A warm sensation begins to spread through {npc.yourHis} breasts, a gentle pulse that hints at a change. {npc.youHe} {npc.youVerb('feel')} a slight pressure building, and as the warmth intensifies, {npc.youHe} {npc.youVerb('realize')} {npc.yourHis} breasts are swelling just a bit. {npc.yourHis} breasts now look and feel slightly heavier.",
			"{npc.YouHe} {npc.youVerb('sense')} a soft warmth enveloping {npc.yourHis} chest, and a gentle tingling begins to take hold. As the sensation grows, {npc.youHe} {npc.youVerb('feel')} {npc.yourHis} breasts expanding slightly, the change subtle yet undeniable. The added weight settles in" + (", making {npc.yourHis} clothes feel a little tighter" if breastsCovered else "") + ".",
			"A gentle warmth radiates through {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('feel')} a slight tug as they begin to swell. The transformation is gradual, but soon {npc.youHe} {npc.youVerb('realize')} they’ve grown just enough to feel a bit heavier.",
			"{npc.YouHe} {npc.youVerb('feel')} a warm pulse coursing through {npc.yourHis} chest, and as it intensifies, {npc.yourHis} breasts begin to expand. The change is slight but noticeable, the added weight creating a new sensation that draws {npc.yourHis} attention.",
			"A soft tingling sensation envelops {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('brace')} for the change. As the warmth spreads, {npc.youHe} {npc.youVerb('feel')} them swell slightly, the weight becoming more pronounced. {npc.yourHis} breasts are now fuller and more gropable than before.",
		])
	if(diff > 1):
		return RNG.pick([
			"A powerful surge of warmth engulfs {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('gasp')} as they begin to swell significantly. The sensation is intense, a deep pulsing that pulls at {npc.yourHis} " + ("clothing" if breastsCovered else "bare chest") + " as {npc.yourHis} breasts expand dramatically. The weight settles heavily on {npc.yourHis} chest, creating a new sexy silhouette.",
			"{npc.YouHe} {npc.youVerb('feel')} an overwhelming warmth radiating through {npc.yourHis} breasts, and the change is immediate and striking. They swell with a force that leaves {npc.youHim} breathless, the weight becoming substantial as they grow larger.",
			"A wave of heat washes over {npc.yourHis} body, and {npc.yourHis} breasts inflate with a powerful surge. The sensation is intoxicating as they grow noticeably larger, the weight shifting {npc.yourHis} balance.",
			"{npc.YouHe} {npc.youVerb('sense')} a strong tingling as {npc.yourHis} breasts expand, the transformation unfolding rapidly. The weight becomes heavy and full, pulling at {npc.yourHis} " + ("clothing" if breastsCovered else "bare chest") + " and altering {npc.yourHis} posture. The change is significant, requiring {npc.youHim} to adjust to {npc.yourHis} new, much bigger size.",
			"A deep warmth radiates through {npc.yourHis} chest, and {npc.youHe} {npc.youVerb('feel')} {npc.yourHis} breasts swell to an impressive size. The transformation is overwhelming, the weight settling heavily on {npc.yourHis} frame, leaving a very obvious change.",
		])
	if(diff == -1):
		return RNG.pick([
			"A cool sensation washes over {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('feel')} a gentle pull as they begin to shrink just a bit. The warmth that enveloped {npc.youHim} moments ago slowly fades, leaving a subtle lightness in its wake. {npc.YouHe} {npc.youVerb('notice')} {npc.yourHis} breasts getting smaller, creating a more streamlined shape.",
			"{npc.YouHe} {npc.youVerb('sense')} a soft chill enveloping {npc.yourHis} chest, and as the sensation deepens, {npc.yourHis} breasts begin to diminish slightly. The change is subtle, but {npc.youHe} can feel the weight easing, {npc.yourHis} breasts becoming a bit smaller.",
			"A gentle tingling sensation courses through {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('brace')} for the change. As the warmth dissipates, {npc.youHe} {npc.youVerb('realize')} they’ve shrunk slightly, the weight reduced enough to notice.",
			"{npc.YouHe} {npc.youVerb('feel')} a soft pulse in {npc.yourHis} chest, and as it intensifies, {npc.yourHis} breasts begin to shrink, gradually losing their weight and shape.",
			"A light tingling sensation courses through {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('sense')} a shift as they become slightly smaller. The familiar weight is reduced, leaving {npc.youHim} with a more delicate shape."
		])
	if(diff < -1):
		return RNG.pick([
			"A sharp coolness spreads through {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('gasp')} as they shrink significantly. The sensation is jarring, a sudden lightness that leaves {npc.youHim} feeling unbalanced. As the weight vanishes, {npc.youHe} {npc.youAre} left with a strikingly different silhouette, {npc.yourHis} breasts losing a lot of their volume.",
			"{npc.YouHe} {npc.youVerb('feel')} a wave of chill enveloping {npc.yourHis} chest, and {npc.yourHis} breasts begin to deflate dramatically. The transformation is swift, and {npc.youHe} can’t help but notice how much lighter they look and feel now.",
			"A deep chill courses through {npc.yourHis} breasts, and {npc.youHe} {npc.youVerb('sense')} a significant reduction in size. The weight that once pulled at {npc.yourHis} " + ("clothing" if breastsCovered else "bare chest") + " is gone, leaving {npc.youHim} feeling almost weightless.",
			"{npc.YouHe} {npc.youVerb('sense')} a strong tingling as {npc.yourHis} breasts shrink rapidly, the change leaving {npc.youHim} breathless. The volume of {npc.yourHis} breasts goes down a lot, creating a very different appearance.",
			"A sudden chill washes over {npc.yourHis} chest, and {npc.youHe} {npc.youVerb('feel')} {npc.yourHis} breasts gradually getting smaller and smaller, shrinking to a size that feels almost foreign.",
		])
	return "something went wrong"

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

func describeBreastTransformationOld(origSize:int, size:int) -> String:
	var initial_size:String = breastSizeToString(origSize)
	var target_size:String = breastSizeToString(size)

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

	var transformation_desc = ""

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

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["howMuch"] = howMuch
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	howMuch = SAVE.loadVar(_data, "howMuch", 1)
