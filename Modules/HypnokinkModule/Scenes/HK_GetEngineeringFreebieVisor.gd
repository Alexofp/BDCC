extends SceneBase

func _init():
	sceneID = "GetEngineeringFreebieVisor"
	
func _initScene(_args = []):
	pass

func _run():
	if(state == ""):
		saynn("Huh. There is a package here, it has a note attached to it.")
		
		saynn("[b]CARGO MANIFEST[/b]")
		
		sayn("From: BDCC Cargo Bay")
		saynn("To: Biotech Research Lab")
		
		sayn("Contents:")
		sayn("1x Medical Augmented Reality (AR) Visor")
		saynn("Description: An affordable cut-down version of an AR visor designed for medical procedures. Equipped with advanced imaging capabilities, real-time data integration, and augmented reality visualization for enhanced medical diagnostics and surgeries.")
		
		sayn("Handling Instructions:")
		sayn("This package contains delicate medical equipment. Handle with care to prevent damage.")
		sayn("Make sure to hand the package to Dr. Quinn or anyone else with a higher access level. Make sure to get recipient's signature.")
		saynn("Bring this manifest back to cargo bay.")
		
		sayn("Recipient Acknowledgement:")
		sayn("Please sign and date upon receiving the package, confirming that the contents are in satisfactory condition.")
		saynn("Recipient Signature: ____________")
		
		sayn("No one even signed it.. so they probably wouldn't even mind it going missing.")
		
		saynn("You take it and unwrap it. Yeah, there is some kind of visor inside.")
		
		addButton("Yoink", "Finders keepers", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		addMessage("You received a hypnovisor")
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("HypnovisorMk0"))
		endScene()
		return
		
	setState(_action)
