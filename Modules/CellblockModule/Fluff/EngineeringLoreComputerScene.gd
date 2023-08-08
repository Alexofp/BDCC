extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "EngineeringLoreComputerScene"

func _run():

	if(state == ""):
		saynn("The screen displays the following information:")

		sayn("-------------")

		sayn("[b]Life Support Systems:[/b]")

		sayn("- Oxygen Level: 98%")

		sayn("- Carbon Dioxide Level: 0.05%")

		sayn("- Unknown gases: 2%")

		sayn("- Temperature: 72°F")

		sayn("- Humidity: 50%")

		saynn("Warning: Air scrubbers require maintenance")

		sayn("[b]Power Systems:[/b]")

		sayn("- Energy level: 80%")

		sayn("- Generator status: Online")

		sayn("- Solar panels status: Online")

		saynn("Warning: BT Batteries damaged or removed")

		sayn("[b]Propulsion Systems:[/b]")

		sayn("- Orbit: Stable")

		saynn("- Star System: <ERROR, ACCESS DENIED>")

		sayn("[b]Resource Monitoring:[/b]")

		sayn("- Total Prisoners: 5300")

		sayn("- Staff Members: 1800")

		sayn("- Nursery: "+str(120+GM.CS.getChildrenAmountOf("pc")))

		saynn("- Uranium Supply: Sufficient")

		sayn("[b]Communication Systems:[/b]")

		sayn("- Status: Connected")

		sayn("- Incoming/Outgoing Transmissions: None")

		sayn("- Bluespace Crystal Frequency: <ERROR, ACCESS DENIED>")

		sayn("- Backup Crystal Frequency: <CAPTAIN ACCESS REQUIRED>")

		saynn("- Inmate Collar Frequency: 457bfe76-7618-404c")

		addButton("Documents", "Check the documents folder", "documents")
		addButton("Leave", "Time to go", "endthescene")

	if(state == "documents"):
		saynn("The monitor shows that there are 2 documents stored.")

		sayn("1. Job Posting v1.0 final corrected (2) copy.pdf")
		saynn("2. corrections.html")

		addButton("Document 1", "Check the first document", "document_1")
		addButton("Document 2", "Check the second document", "document_2")
		addButton("Back", "Go to the previous menu", "")


	if(state == "document_1"):
		saynn("Available positions: Maintenance Engineer, Telecoms Engineer, (Any) Engineer")

		saynn("Location: Broken Dreams Correctional Center, Asteroid XJ-blalalaa")

		sayn("Job Description:")

		saynn("We are seeking highly skilled and experienced engineers to join our team at the space station Broken Dreams Correctional Center (Or BDCC for short). As you may have noticed, BDCC is a prison facility, housing thousands of the most dangerous criminals from all corners of our galaxy. Have no worry because you will be protected from any dangers by our huge team of professional guards. The location of this prison is classified so you will have to be relocated for semi-permanent living but AlphaCorp will provide everything necessary, including your transit. In exchange, you will be paid at least a minimal salary, enough to cover your living needs and much more. As an engineer, you will be responsible for the smooth operation and maintenance of all systems on board, including advanced resource excavation systems, life support, and security measures.")

		sayn("Responsibilities:")

		sayn("- Maintain and repair the exterior of the station to withstand the constant exposure to solar radiation and extreme temperatures.")

		sayn("- Oversee the resource excavation systems, which are crucial for maintaining the asteroid's orbit and for power generation.")

		sayn("- Monitor and troubleshoot the security systems to prevent any attempts at escape or sabotage.")

		sayn("- Coordinate with the prison staff and oversee the daily operations of the prison.")

		saynn("- Monitor the prisoners and ensure their basic needs are met.")

		sayn("Qualifications:")

		sayn("- Bachelor's degree in engineering or related field (Would be a great plus)")

		sayn("- At least 5 years of experience in a similar role (Not strictly required)")

		sayn("- Strong knowledge of propulsion systems, life support systems, and security systems (We will teach you everything, just apply!)")

		sayn("- Experience working in a remote or isolated environment (It’s not that bad, really)")

		sayn("- Strong problem-solving and analytical skills (Being strong would help you a lot, yes)")

		sayn("- Excellent communication and interpersonal skills (If you can talk, we can talk)")

		saynn("- This is an excellent opportunity to work in a challenging and unique environment, where you will be responsible for ensuring the safety and security of one of the galaxy's most high-security prisons. If you have a passion for engineering and are up for the challenge, we encourage you to apply. (PLEASE)")

		sayn("Application:")

		sayn("If you meet the qualifications and are interested in applying for this position, please submit your resume and cover letter for consideration.")

		saynn("We thank all applicants for their interest in this position, however, only those selected for an interview will be contacted.")

		saynn("End of document.")
		
		addButton("Back", "Go to the previous menu", "documents")


	if(state == "document_2"):
		saynn("<Warning!> Unable to display hypertext, outputting raw data instead")

		sayn("<Head>")

		sayn("Email conversation with Alex Rynard")

		sayn("</Head>")

		sayn("<Body>")

		sayn("<message from=Alex Rynard>Hey, do we really have to lie in our job postings? They will know that there is nothing advanced in the way we mine resources. There is nothing advanced about this prison at all.</message>")

		sayn("<message from=John, HR>no one is gonna sign up otherwise. relax, they won’t be able to tell anyone anyway</message>")

		sayn("<message from=Alex Rynard>Yeah, it’s still scummy, you know? And also. Guards protecting us? Really? Everyone is out for themselves out here.</message>")

		sayn("<message from=John, HR>just let me do my job, I don’t get paid enough to care about this shit</message>")

		sayn("<message from=Alex Rynard>*Sigh*. Everything else should be fine. Remove the asteroid name from the location before posting it. Okay?</message>")

		sayn("<message from=John, HR>fine, jeeez</message>")

		sayn("<message from=Alex Rynard>Remove the non-funny additions to the Qualifications too. Yes, we’re desperate for more engineers but no need to beg.</message>")

		sayn("<message from=John, HR>oh cmon. fine, I will do it when I can, I’m on a break</message>")

		sayn("</Body>")
		
		addButton("Back", "Go to the previous menu", "documents")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

