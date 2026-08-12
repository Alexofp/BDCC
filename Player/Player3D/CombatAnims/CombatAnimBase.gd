extends Reference
class_name CombatAnimBase

const REACTION_HURT := 0
const REACTION_NOTHING := 1

var id:String = ""
var animName:String = ""
var animNameKnockedDown:String = ""

var fadeIn:float = 0.25
var fadeOut:float = 0.25

#var transitionTo:String = "IDLE"
var isLooped:bool = false

var hitDelay:float = 0.3
var hitDelayKnockedDown:float = -1.0
var hitReaction:int = REACTION_HURT

var fists:bool = false
var weaponLeft:String = ""
var weaponRight:String = ""

var weaponOverrideLeft:bool = false

var allowStateReuse:bool = false
