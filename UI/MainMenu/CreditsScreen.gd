extends Control

signal onClosePressed

export(Resource) var donationInfo

func _ready():
	if(donationInfo != null):
		$VBoxContainer/ScrollContainer/ScrollVBox/ContentContainer/DonationsLabel.bbcode_text = donationInfo.richText

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")

func _on_SupportRahiButton_pressed():
	var _ok = OS.shell_open("https://subscribestar.adult/rahi")


func _on_RichTextLabel_meta_clicked(meta):
	var _ok = OS.shell_open(meta)
