extends Object
class_name RNG

# generates an [from,to] int, both are inclusive
static func randi_range(from: int, to: int) -> int:
	assert(to >= from)
	return from + (randi() % (to - from + 1))

# chance(100) will always be true
# chance(3) will be true 3% of the time
static func chance(ch: float) -> bool:
	var randValue = randf() * 100
	if(ch >= randValue):
		return true
	return false
	
# picks a random element from an array or a random key from a dictionary
static func pick(ar):	
	if(ar is Dictionary):
		ar = ar.keys()
		
	if(ar.empty()):
		return null
	
	return ar[randi() % ar.size()]

# RNG.pickWeighted(["a", "b", "c"], [10, 100, 10]) # 'b' will show up 10 times more
static func pickWeighted(ar, weights: Array):
	if(ar is Dictionary):
		ar = ar.keys()
		
	assert(ar.size() == weights.size(), "Weights array doesn't have the same amount of elements as array")
	
	if(ar.empty()):
		return null
	
	var sum = 0.0
	for w in weights:
		sum += w
	
	var r = rand_range(0.0, sum) # Should it be from 1.0 or 0.0?
	for i in range(weights.size()):
		r -= weights[i]
		if r <= 0.0:
			return ar[i]
			
	return ar[0]
