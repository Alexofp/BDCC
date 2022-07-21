extends Control

signal onClosePressed

func _ready():
	$VBoxContainer/ScrollContainer/ScrollVBox/ContentContainer/DonationsLabel.bbcode_text = GlobalRegistry.getDonationDataString()
	var _ok = GlobalRegistry.connect("donationDataUpdated", self, "updateDonationData")

func updateDonationData():
	$VBoxContainer/ScrollContainer/ScrollVBox/ContentContainer/DonationsLabel.bbcode_text = GlobalRegistry.getDonationDataString()

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")

func _on_SupportRahiButton_pressed():
	var _ok = OS.shell_open("https://subscribestar.adult/rahi")


func _on_RichTextLabel_meta_clicked(meta):
	var _ok = OS.shell_open(meta)
