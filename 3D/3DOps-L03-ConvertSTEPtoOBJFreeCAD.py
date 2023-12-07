import sys

# if python cannot find the FreeCAD stuff add the path here
sys.path.append("C:\\Program Files\\FreeCAD 0.20\\bin")

file_in  = sys.argv[1]
file_out = sys.argv[2]

import FreeCAD
import Part
import Mesh
import MeshPart
import Import

print("Input file: ",file_in)
print("Output file: ",file_out)

data=Import.open(file_in)
shape = data[0][0].Shape
shape_colors = data[0][1]

mesh = MeshPart.meshFromShape(Shape=shape, LinearDeflection=0.1, Segments=True)

face_colors=[(0,0,0)] * mesh.CountFacets
for i in range(mesh.countSegments()):
    color = shape_colors[i]
    segm = mesh.getSegment(i)
    for j in segm:
        face_colors[j] = color

mesh.write(Filename=file_out, Material=face_colors, Format="obj")