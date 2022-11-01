extends Object
class_name FetishInterest

const Hates = "Hates"
const ReallyDislikes = "ReallyDislikes"
const Dislikes = "Dislikes"
const SlighlyDislikes = "SlighlyDislikes"
const Neutral = "Neutral"
const SlightlyLikes = "SlightlyLikes"
const Likes = "Likes"
const ReallyLikes = "ReallyLikes"
const Loves = "Loves"

static func getScore(interest):
	match(interest):
		Hates:
			return -1.0
		ReallyDislikes:
			return -0.75
		Dislikes:
			return -0.5
		SlighlyDislikes:
			return -0.25
		Neutral:
			return 0.0
		SlightlyLikes:
			return 0.25
		Likes:
			return 0.5
		ReallyLikes:
			return 0.75
		Loves:
			return 1.0
	return 0.0
		
static func getAll():
	return [Hates, ReallyDislikes, Dislikes, SlighlyDislikes, Neutral, SlightlyLikes, Likes, ReallyLikes, Loves]
