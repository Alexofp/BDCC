extends Object
class_name FetishInterest

const Hates = -1.0
const ReallyDislikes = -0.75
const Dislikes = -0.5
const SlightlyDislikes = -0.25
const Neutral = 0.0
const SlightlyLikes = 0.25
const Likes = 0.5
const ReallyLikes = 0.75
const Loves = 1.0

enum EnumList {
	Hates, ReallyDislikes, Dislikes, SlightlyDislikes, Neutral, SlightlyLikes, Likes, ReallyLikes, Loves,
}

static func textToNumber(interest:String) -> float:
	match(interest):
		"Hates":
			return -1.0
		"ReallyDislikes":
			return -0.75
		"Dislikes":
			return -0.5
		"SlightlyDislikes":
			return -0.25
		"Neutral":
			return 0.0
		"SlightlyLikes":
			return 0.25
		"Likes":
			return 0.5
		"ReallyLikes":
			return 0.75
		"Loves":
			return 1.0
	return 0.0

static func getAll():
	return [Hates, ReallyDislikes, Dislikes, SlightlyDislikes, Neutral, SlightlyLikes, Likes, ReallyLikes, Loves]

static func getAllText() -> Array:
	return ["Hates", "ReallyDislikes", "Dislikes", "SlightlyDislikes", "Neutral", "SlightlyLikes", "Likes", "ReallyLikes", "Loves"]

static func getColorString(theValue:float) -> String:
	if(theValue <= -0.875):
		return "#FF554C"
	elif(theValue <= -0.625):
		return "#FF837A"
	elif(theValue <= -0.375):
		return "#FFB0A0"
	elif(theValue <= -0.125):
		return "#FFCED2"
	elif(theValue <= 0.125):
		return "#D5CEFF"
	elif(theValue <= 0.375):
		return "#FFC9FE"
	elif(theValue <= 0.625):
		return "#FFBAF8"
	elif(theValue <= 0.875):
		return "#FF9EE3"
	return "#FF63E7"
	
static func getVisibleName(theValue:float) -> String:
	if(theValue <= -0.875):
		return "hates"
	elif(theValue <= -0.625):
		return "really dislikes"
	elif(theValue <= -0.375):
		return "dislikes"
	elif(theValue <= -0.125):
		return "slightly dislikes"
	elif(theValue <= 0.125):
		return "neutral"
	elif(theValue <= 0.375):
		return "kinda likes"
	elif(theValue <= 0.625):
		return "likes"
	elif(theValue <= 0.875):
		return "really likes"
	return "loves"

static func getEnumListValue(theValue:float) -> int:
	if(theValue <= -0.875):
		return EnumList.Hates
	elif(theValue <= -0.625):
		return EnumList.ReallyDislikes
	elif(theValue <= -0.375):
		return EnumList.Dislikes
	elif(theValue <= -0.125):
		return EnumList.SlightlyDislikes
	elif(theValue <= 0.125):
		return EnumList.Neutral
	elif(theValue <= 0.375):
		return EnumList.SlightlyLikes
	elif(theValue <= 0.625):
		return EnumList.Likes
	elif(theValue <= 0.875):
		return EnumList.ReallyLikes
	return EnumList.Loves

static func getChangeDesc(theValue:float) -> String:
	var theColorStr:String = getColorString(theValue)
	if(theValue <= -0.875):
		return "now [color="+theColorStr+"]hates[/color]"
	elif(theValue <= -0.625):
		return "now [color="+theColorStr+"]really dislikes[/color]"
	elif(theValue <= -0.375):
		return "now [color="+theColorStr+"]dislikes[/color]"
	elif(theValue <= -0.125):
		return "now [color="+theColorStr+"]slightly dislikes[/color]"
	elif(theValue <= 0.125):
		return "is now [color="+theColorStr+"]neutral[/color] towards"
	elif(theValue <= 0.375):
		return "now [color="+theColorStr+"]kinda likes[/color]"
	elif(theValue <= 0.625):
		return "now [color="+theColorStr+"]likes[/color]"
	elif(theValue <= 0.875):
		return "now [color="+theColorStr+"]really likes[/color]"
	return "now [color="+theColorStr+"]loves[/color]"
