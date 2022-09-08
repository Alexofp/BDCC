extends Control

func _ready():
	$VBoxContainer/ScrollContainer/ScrollVBox/ContentContainer/DonationsLabel.bbcode_text = GlobalRegistry.getDonationDataString()
	var _ok = GlobalRegistry.connect("donationDataUpdated", self, "updateDonationData")

func updateDonationData():
	$VBoxContainer/ScrollContainer/ScrollVBox/ContentContainer/DonationsLabel.bbcode_text = GlobalRegistry.getDonationDataString()

func _on_RichTextLabel_meta_clicked(meta):
	var _ok = OS.shell_open(meta)
