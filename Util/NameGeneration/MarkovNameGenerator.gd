extends NameGenerator
class_name MarkovNameGenerator

# train with names
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
				chain[gram] = []
			chain[gram].append(next_char)


func generateName(max_length: int = 12) -> String:
	if start_sequences.empty():
		return ""
	
	var current_gram = start_sequences[randi() % start_sequences.size()]
	var result = current_gram
	
	while true:
		if not chain.has(current_gram):
			break
		
		var possible_next = chain[current_gram]
		var next_char = possible_next[randi() % possible_next.size()]
		result += next_char
		
		if next_char == "$" or result.length() >= max_length:
			break
		
		current_gram = result.substr(result.length() - order, order)
	
	result = result.strip_edges()
	result = result.replace("^", "").replace("$", "")
	
	if result.length() > 0:
		result = result.substr(0, 1).to_upper() + result.substr(1)
	
	return result
