import bpy
from pathlib import Path
import json

# This messy blender script can load godot's skeleton2d data and create a blender armature based on it with all the bones

#path = some_object.filepath # as declared by props
path = "//test.txt"  # a blender relative path

filepath = Path(bpy.path.abspath(path)) # make a path object of abs path

print("START")

def addBone(data, parent):
    print(data["name"])
    
    eb = ebs.new(data["name"])
    eb.head = (data["posx"]/100.0, 0, -data["posy"]/100.0) # if the head and tail are the same, the bone is deleted
    eb.tail = (data["posxend"]/100.0, 0, -data["posyend"]/100.0)    # upon returning to object mode
    eb.parent = parent
    
    for sub in data["child_bones"]:
        addBone(sub, eb)

if filepath.exists():
    #print(f.read_text()) # read and print.
    with open(filepath,'r') as f: 
        j=json.load(f) 
        #print(j)
        print(j["name"])
        
        arm = bpy.ops.object.armature_add(enter_editmode=False, align='WORLD', location=(0, 0, 0), scale=(1, 1, 1))
        obArm = bpy.context.active_object 
        bpy.ops.object.mode_set(mode='EDIT', toggle=False)
        ebs = obArm.data.edit_bones
        
        #eb = ebs.new("TestBone")
        #eb.head = (0, 1, 1) # if the head and tail are the same, the bone is deleted
        #eb.tail = (0, 1, 2)    # upon returning to object mode
        
        #print(ebs)
        for sub in j["child_bones"]:
            addBone(sub, ebs[0])