extends Reference
class_name ModEntry

var id:String = ""
var name:String = "Test mod"
var author:String = "Someone"
var authorsData:Dictionary = { authors = ["Someone"], preferredSeparator = ", " }
var description:String = ""
var modversion:String = "1.0"
var gameversion:String = "*"
var download:String = ""
var index:int = 0
var hasAI:bool = false
var previewLink:String = ""
var reqs:Array # Requirements, Array of IDs
var categories:Array # Array of category names
var deleteOnDownload:Array # Array of filenames. Every existing filename that STARTS with one of these will be deleted
#deleteOnDownload = ["Test"] means Test1.1.zip, Test.zip, TestTest.zip, etc will be deleted
