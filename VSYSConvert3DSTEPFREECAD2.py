import sys

# file_in = "C:/Users/futur/Desktop/Motherboard base.step"
# file_out = "C:/Users/futur/Desktop/test.obj"

# if python cannot find the FreeCAD stuff add the path here
sys.path.append("C:\\Program Files\\FreeCAD 0.20\\bin")

file_in  = sys.argv[1]
file_out = sys.argv[2]

import FreeCAD
import Part
import Mesh
import MeshPart
import Import

data=Import.open(file_in)
shape = data[0][0].Shape

mesh = MeshPart.meshFromShape(Shape=shape, LinearDeflection=0.1, Segments=True)
mesh.write(Filename=file_out, Format="obj")
