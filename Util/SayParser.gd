extends Reference
class_name SayParser
enum TagType {Text, Tag, CloseTag}

# This thing parses [say=pc]text[/say] commands while ignoring all other tags. Its messy but it works

#input: text text [say=pc]hello world[/say] text
#output: [[TEXT, text text ], [TAG, say, pc], [TEXT, hello world], [CLOSETAG, say], [TEXT,  text]]
func findTags(text: String):
	var savedText = ""
	var savedTag = ""
	var result = []
	
	var pos = 0
	while pos < text.length():
		if(text[pos] == "["):
			pos += 1
			var isCloseTag = false
			if(text[pos] == "/"):
				isCloseTag = true
				pos += 1
			
			if(savedText != ""):
				result.append([TagType.Text, savedText])
				savedText = ""
			
			while pos < text.length():
				if(text[pos] == "]"):
					if(!isCloseTag):
						var argStarts = savedTag.find("=")
						var arg = ""
						if(argStarts >= 0):
							arg = savedTag.substr(argStarts+1)
							savedTag = savedTag.substr(0, argStarts)
						
						result.append([TagType.Tag, savedTag, arg])
					else:
						result.append([TagType.CloseTag, savedTag])
					savedTag = ""
					pos += 1
					break
				else:
					savedTag += text[pos]
					pos += 1
					
			if(savedTag != ""):
				Log.printerr("findTags(): Error: tag wasn't closed")
				result.append([TagType.Text, savedTag])
				savedTag = ""
		else:
			savedText += text[pos]
			pos += 1
			
	if(savedText != ""):
		result.append([TagType.Text, savedText])
		
	return result

func combineTags(tags: Array):
	var result = []
	var pos = 0
	var processThese = {
		"say": true,
		"sayShowName": true,
		"sayMale": true,
		"sayFemale": true,
		"sayAndro": true,
		"sayOther": true,
	}
	
	while pos < tags.size():
		var tag = tags[pos]
		if(tag[0] == TagType.Text):
			result.append(tag)
			pos += 1
			
		elif(tag[0] == TagType.CloseTag):
			result.append([TagType.Text, "[/"+tag[1]+"]"])
			pos += 1
		
		elif(tag[0] == TagType.Tag):
			if(processThese.has(tag[1])):
				var tagCommand = tag[1]
				var tagArg = tag[2]
				var tagText = ""
				pos += 1

				while pos < tags.size():
					if(tags[pos][0] == TagType.Text):
						tagText += tags[pos][1]
						pos += 1
					elif(tags[pos][0] == TagType.Tag):
						if(tags[pos][2] == ""):
							tagText += "["+tags[pos][1]+"]"
						else:
							tagText += "["+tags[pos][1]+"="+tags[pos][2]+"]"
						pos += 1
					elif(tags[pos][0] == TagType.CloseTag):
						if(tags[pos][1] == tagCommand || tags[pos][1] == ""):
							result.append([TagType.Tag, tagCommand, tagArg, tagText])
							pos += 1
							break
						else:
							tagText += "[/"+tags[pos][1]+"]"
							pos += 1
					else:
						pos += 1
			else:
				if(tag[2] == ""):
					result.append([TagType.Text, "["+tag[1]+"]"])
				else:
					result.append([TagType.Text, "["+tag[1]+"="+tag[2]+"]"])
				pos += 1
		else:
			pos += 1

	return result

func processString(text: String, overrides: Dictionary = {}):
	var tags = findTags(text)
	var combinedTags = combineTags(tags)
	var result = ""
	
	for tag in combinedTags:
		if(tag[0] == TagType.Text):
			result += tag[1]
		if(tag[0] == TagType.Tag):
			result += processTag(tag[1], tag[2], tag[3], overrides)
			
	return result

func processTag(tag, arg, text, overrides: Dictionary = {}):
	if(tag == "say" || tag == "sayShowName"):
		if(overrides.has(arg)):
			arg = overrides[arg]
		
		var resolvedName = GM.main.resolveCustomCharacterName(arg)
		if(resolvedName != null):
			arg = resolvedName
		
		var object = null
		if(arg == "pc"):
			object = GM.pc
		elif(GlobalRegistry.getCharacter(arg) != null):
			object = GlobalRegistry.getCharacter(arg)
		
		if(object == null):
			return "!Error: "+arg+" character is not found to say text: "+text+"!"
		
		var prefix = ""
		if(OPTIONS.shouldShowSpeakerName() || tag == "sayShowName"):
			prefix = "[b]"+object.getName()+"[/b]: "
		
		return prefix+object.formatSay(text)
	if(tag == "sayMale"):
		var prefix = ""
		if(OPTIONS.shouldShowSpeakerName()):
			prefix = "[b]Someone[/b]: "
		
		return prefix+Util.sayMale(text)
	if(tag == "sayFemale"):
		var prefix = ""
		if(OPTIONS.shouldShowSpeakerName()):
			prefix = "[b]Someone[/b]: "
			
		return prefix+Util.sayFemale(text)
	if(tag == "sayAndro"):
		var prefix = ""
		if(OPTIONS.shouldShowSpeakerName()):
			prefix = "[b]Someone[/b]: "
			
		return prefix+Util.sayAndro(text)
	if(tag == "sayOther"):
		var prefix = ""
		if(OPTIONS.shouldShowSpeakerName()):
			prefix = "[b]Someone[/b]: "
			
		return prefix+Util.sayOther(text)
	
	return "!"+tag+"="+arg+":"+text+"!"
