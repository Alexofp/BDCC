extends ComputerBase

func _init():
	id = "TaviEngineeringComputer"

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	if(_command == "help"):
		if(_args.size() == 1):
			var tolearn = _args[0]
			if(tolearn == "help"):
				return "This command outputs all other commands and can also provide help for certain command by typing 'help <COMMAND>'"
			elif(tolearn == "ls"):
				return "This command outputs the contents of your harddrive"
			elif(tolearn == "cat"):
				return "This command outputs file's contents into the console.\nSyntax 'cat <FILE INDEX>' where file index is a number that can be obtained by using the ls command"
			elif(tolearn == "connect"):
				return "This command lets you connect to the remote server by using its ip.\nSyntax 'connect <IP>'. An example of an ip is 127.1"
			else:
				return "Couldn't find command '"+str(tolearn)+"'. To see all the avaiable commands type 'help'"
			
		elif(_args.size() == 0):
			learnCommand("help")
			learnCommand("ls")
			learnCommand("cat")
			learnCommand("connect")
			return "Avaiable commands are: ls, cat, connect, help.\nTo learn more about a command type 'help <COMMAND>'"
		else:
			learnCommand("help")
			return "'help' expects 0 or 1 arguments"
		
	learnCommand("help")
	return "Error, unknown command. Use 'help' to list all avaiable commands"

func saveData():
	var data = .saveData()
	
	return data
	
func loadData(data):
	.loadData(data)
	
