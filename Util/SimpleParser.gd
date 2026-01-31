extends Reference
class_name SimpleParser
# This is not a full blown scripting language, this is just a runtime substitute for godot's missing string interpolation

enum Token {WORD, DOT, OPENBRACKET, CLOSEBRACKET, COMMA, STRING, NUMBER, EOF}

# Finds {} expressions inside a string like {pc.say('meow')}
func getExpressionsFromText(text: String):
	var result = []
	var currentExpr = ""
	var currentText = ""
	
	var inExpr = false
	var inString = false   # For single quotes
	var inString2 = false  # For double quotes
	var escaped = false
	
	for letter in text:
		# 1. Handle Escaped Characters
		if escaped:
			if inExpr:
				currentExpr += letter
			else:
				currentText += letter
			escaped = false
			continue
		
		# 2. Check for the Escape Slash
		if letter == "\\":
			escaped = true
			if inExpr: currentExpr += letter # Keep slash inside expressions
			continue
		
		# 3. Inside Expression Logic
		if inExpr:
			# Handle Quote States
			if letter in ["'", "’", "‘"]:
				if not inString2: inString = !inString
			elif letter == "\"":
				if not inString: inString2 = !inString2
			
			# Check for Closing Brace (only if not inside a string)
			if letter == '}' and not inString and not inString2:
				result.append(["expr", currentExpr])
				currentExpr = ""
				inExpr = false
			else:
				currentExpr += letter
				
		# 4. Outside Expression (Plain Text) Logic
		else:
			if letter == '{':
				if not currentText.empty():
					result.append(["text", currentText])
					currentText = ""
				inExpr = true
			else:
				currentText += letter
	
	# 5. Flush remaining text
	if not currentText.empty():
		result.append(["text", currentText])
	
	return result

var regex = RegEx.new()

func _init():
	# Pattern captures: Words/IDs, Strings (single/double), Numbers, and Symbols
	regex.compile("([a-zA-Z_][a-zA-Z0-9_:]*)|'([^']*)'|\"([^\"]*)\"|(-?\\d+\\.?\\d*)|([(),.])")

func getLexems(text: String) -> Array:
	var tokens = []
	for result in regex.search_all(text):
		if result.get_string(1): # WORD
			tokens.append([Token.WORD, result.get_string(1)])
		elif result.get_string(2) or result.get_string(3): # STRING
			tokens.append([Token.STRING, result.get_string(2) + result.get_string(3)])
		elif result.get_string(4): # NUMBER
			var n = result.get_string(4)
			tokens.append([Token.NUMBER, n.to_float() if "." in n else n.to_int()])
		elif result.get_string(5): # SYMBOLS
			match result.get_string(5):
				"(": tokens.append([Token.OPENBRACKET])
				")": tokens.append([Token.CLOSEBRACKET])
				".": tokens.append([Token.DOT])
				",": tokens.append([Token.COMMA])
	
	tokens.append([Token.EOF])
	return tokens

func runLexems(lexems: Array, overrides: Dictionary = {}):
	var pos = 0
	
	# Early exit for empty input
	if lexems[pos][0] == Token.EOF:
		return ""
	
	# 1. Parse the first identifier
	var first = lexems[pos][1]
	pos += 1
	
	var second = ""
	var is_object_call = false
	
	# 2. Check for dot access: "obj.cmd"
	if lexems[pos][0] == Token.DOT:
		is_object_call = true
		pos += 1
		if lexems[pos][0] == Token.WORD:
			second = lexems[pos][1]
			pos += 1
			
	# 3. Parse arguments if brackets exist: "(arg1, arg2)"
	var arguments = []
	if lexems[pos][0] == Token.OPENBRACKET:
		pos += 1
		while lexems[pos][0] != Token.CLOSEBRACKET and lexems[pos][0] != Token.EOF:
			# Collect valid data types
			if lexems[pos][0] in [Token.STRING, Token.NUMBER]:
				arguments.append(lexems[pos][1])
			
			pos += 1
			# Skip comma separator if present
			if lexems[pos][0] == Token.COMMA:
				pos += 1
		
		# Move past the closing bracket
		if lexems[pos][0] == Token.CLOSEBRACKET:
			pos += 1

	# 4. Final execution dispatch
	if is_object_call:
		return [true, callObjectFunc(first, second, arguments, overrides)]
	
	return [true, callFunc(first, arguments)]
			
func executeString(text: String, overrides: Dictionary = {}):
	var expressions = getExpressionsFromText(text)
	var result = ""
	for expr in expressions:
		if(expr[0] == "text"):
			result += expr[1]
		if(expr[0] == "expr"):
			var lexems = getLexems(expr[1])
			var exprResult = runLexems(lexems, overrides)
			if(exprResult[0]):
				result += exprResult[1]
			else:
				result += "!SYNTAX ERROR IN: "+expr[1]+"!"
	return result
			
func callFunc(_command: String, _args: Array):
	return "!callFunc "+_command+" "+str(_args)+"!"
	
func callObjectFunc(_obj: String, _command: String, _args: Array, _overrides: Dictionary = {}) -> String:
	return "!callObjectFunc "+_obj+"."+_command+" "+str(_args)+"!"
