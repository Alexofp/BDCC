extends MarkovNameGenerator
class_name MarkovNameGeneratorWeighted


func train(names: Array) -> void:
	chain.clear()
	start_sequences.clear()
	
	for name in names:
		var processed_name = "^" + name.to_lower() + "$"
		
		start_sequences.append(processed_name.substr(0, order))
		
		for i in range(processed_name.length() - order):
			var gram = processed_name.substr(i, order)
			var next_char = processed_name[i + order]
			
			if not chain.has(gram):
				chain[gram] = {}
			
			if not chain[gram].has(next_char):
				chain[gram][next_char] = 0
			
			chain[gram][next_char] += 1


func weighted_choice(choices: Dictionary) -> String:
	var total = 0
	for weight in choices.values():
		total += weight
	
	var rnd = randi() % total
	var cumulative = 0
	
	for character in choices.keys():
		cumulative += choices[character]
		if rnd < cumulative:
			return character
	
	return choices.keys()[0] # fallback


func generateName(max_length: int = 12) -> String:
	if start_sequences.empty():
		return ""
	
	var current_gram = start_sequences[randi() % start_sequences.size()]
	var result = current_gram
	
	while true:
		if not chain.has(current_gram):
			break
		
		var next_char = weighted_choice(chain[current_gram])
		result += next_char
		
		if next_char == "$" or result.length() >= max_length:
			break
		
		current_gram = result.substr(result.length() - order, order)
	
	result = result.replace("^", "").replace("$", "")
	
	if result.length() > 0:
		result = result.substr(0, 1).to_upper() + result.substr(1)
	
	return result
