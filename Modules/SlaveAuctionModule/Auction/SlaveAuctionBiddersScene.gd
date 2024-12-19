extends SceneBase

func _init():
	sceneID = "SlaveAuctionBiddersScene"

func _run():
	if(state == ""):
		saynn("Next bidders will have these preferences:")

		saynn(""+str(getModule("SlaveAuctionModule").getBidderInfo())+"")

		addButton("Close", "Enough peeking", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
