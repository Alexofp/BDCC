extends Object
class_name SocialEventType

# Target perspective

const LostFight = 0 # Actor won, Target lost
const GotRefused = 1 # Actor was the one who refused, Target got refused
const GotTalkedTo = 2 # Actor started the talk, Target got talked to
const BeganGettingEnslaved = 3 # Actor began enslaving, Target is the one being enslaved
const GotImpregnated = 4 # Actor did the impregnation, Target is the one who got impregnated
const GotScammed = 5 # Actor did the scam, Target got scammed

const AwfulSex = 6
const GreatSex = 7

# How much does this event make the target hate the actor.
# 1.0 = fight loss
# 0.2 = rude talk
# 5.0 = enslavement attempt
const HATE_MULT = {
	LostFight: 1.0,
	GotRefused: 0.2,
	BeganGettingEnslaved: 5.0,
	GotImpregnated: 3.0,
	GotScammed: 2.0,
	AwfulSex: 1.0,
}

const AFFECTION_BONUS = { #Higher number = less chance of nemesis
	LostFight: 0.3,
	GotRefused: 0.4,
	BeganGettingEnslaved: -0.3,
	GotImpregnated: 0.0,
	GotScammed: -0.1,
	AwfulSex: -0.4,
}
