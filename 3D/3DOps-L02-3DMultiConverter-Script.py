import bpy
import os
import sys
import argparse


class ArgumentParserForBlender(argparse.ArgumentParser):

    def _get_argv_after_doubledash(self):
        """
        Given the sys.argv as a list of strings, this method returns the
        sublist right after the '--' element (if present, otherwise returns
        an empty list).
        """
        try:
            idx = sys.argv.index("--")
            return sys.argv[idx+1:] # the list after '--'
        except ValueError as e: # '--' not in the list:
            return []

    # overrides superclass
    def parse_args(self):
        """
        This method is expected to behave identically as in the superclass,
        except that the sys.argv list will be pre-processed using
        _get_argv_after_doubledash before. See the docstring of the class for
        usage examples and details.
        """
        return super().parse_args(args=self._get_argv_after_doubledash())


parser = ArgumentParserForBlender()
parser.add_argument("-i", "--input", type=str, default='', help="Input file.")
parser.add_argument("-o", "--output", type=str, default='', help="Output file.")
parser.add_argument('-bimport', action='store_true', default=False)
parser.add_argument('-bexport', action='store_true', default=False)

args = parser.parse_args()

file_in = args.input
file_out = args.output
better_import = args.bimport
better_export = args.bexport

file_in_extension = os.path.splitext(file_in)[1]
file_out_extension = os.path.splitext(file_out)[1]
file_in_extension = file_in_extension.casefold()
file_out_extension = file_out_extension.casefold()

print(file_in_extension)
print(file_out_extension)

# Initialize Empty Scene

def reset_blend():
    
    scene = bpy.data.scenes[0]
    for ob in bpy.data.objects:
        bpy.data.objects.remove(ob)

print("Resetting blend file to an empty state.")
reset_blend()


# Import

if better_import:
    print("Import: Using Better FBX Importer", file_in)
    bpy.ops.better_import.fbx(filepath=file_in, use_triangulate=False, my_import_normal='Import', use_auto_smooth=True, use_reset_mesh_origin=True, use_edge_crease=True, my_edge_crease_scale=1.0, my_edge_smoothing='FBXSDK', use_import_materials=True)
else:
    if file_in_extension == ".fbx":
        print("Import: Using Native FBX Importer")
        bpy.ops.import_scene.fbx(filepath=file_in, global_scale=1.0, use_custom_normals=True, use_image_search=True, use_anim=True, anim_offset=1.0, use_subsurf=False, use_custom_props=True, use_custom_props_enum_as_string=True, primary_bone_axis='Y', secondary_bone_axis='X', use_prepost_rot=True, axis_forward='-Z', axis_up='Y')
    
    elif file_in_extension == ".obj":
        print("Import: Using Native OBJ Importer")
        bpy.ops.import_scene.obj(filepath=file_in, use_edges=True, use_smooth_groups=True, use_split_objects=True, use_split_groups=False, use_groups_as_vgroups=False, use_image_search=True, split_mode='ON', global_clamp_size=0.0, axis_forward='-Z', axis_up='Y')
        
    elif file_in_extension == ".dae":
        print("Import: Using Native DAE Importer")
        bpy.ops.wm.collada_import(filepath=file_in, import_units=False, fix_orientation=False, find_chains=False, auto_connect=False, min_chain_length=0, keep_bind_info=False)
        
    elif (file_in_extension == ".gltf") or (file_in_extension == ".glb"):
        print("Import: Using Native glTF 2.0 Importer")
        bpy.ops.import_scene.gltf(filepath=file_in, import_pack_images=True, merge_vertices=False, import_shading='NORMALS', bone_heuristic='TEMPERANCE', guess_original_bind_pose=True)
        
    elif file_in_extension == ".stl":
        print("Import: Using Native STL Importer")
        bpy.ops.import_mesh.stl(filepath=file_in, global_scale=1.0, use_scene_unit=False, use_facet_normal=False, axis_forward='Y', axis_up='Z')
        
    elif file_in_extension == ".blend":
        print("Import: Input is a blend file, so just opening the blend.")
        bpy.ops.wm.open_mainfile(filepath=file_in)
        
    else:
        print("Incorrect input conversion specified.")
        

# Export
if better_export:
    bpy.ops.better_export.fbx(filepath=file_out, my_file_type=file_out_extension, my_edge_smoothing='FBXSDK', use_embed_media=False, use_apply_modifiers=True)
else:
    if file_out_extension == ".obj":
        bpy.ops.export_scene.obj(filepath=file_out, use_selection=False, use_animation=False, use_mesh_modifiers=True, use_edges=True, use_smooth_groups=False, use_smooth_groups_bitflags=False, use_normals=True, use_uvs=True, use_materials=True, use_triangles=False, use_nurbs=False, use_vertex_groups=False, use_blen_objects=True, group_by_object=False, group_by_material=False, keep_vertex_order=False, global_scale=1.0, path_mode='AUTO', axis_forward='-Z', axis_up='Y')
        
    elif file_out_extension == ".fbx":
        bpy.ops.export_scene.fbx(filepath=file_out, global_scale=1.0, apply_unit_scale=True, apply_scale_options='FBX_SCALE_NONE', use_space_transform=True, object_types={'ARMATURE', 'CAMERA', 'EMPTY', 'LIGHT', 'MESH', 'OTHER'}, use_mesh_modifiers=True, use_mesh_modifiers_render=True, mesh_smooth_type='OFF', use_subsurf=False, use_mesh_edges=False, use_tspace=False, use_custom_props=False, add_leaf_bones=True, primary_bone_axis='Y', secondary_bone_axis='X', use_armature_deform_only=False, armature_nodetype='NULL', bake_anim=True, bake_anim_use_all_bones=True, bake_anim_use_nla_strips=True, bake_anim_use_all_actions=True, bake_anim_force_startend_keying=True, bake_anim_step=1.0, bake_anim_simplify_factor=1.0, path_mode='COPY', embed_textures=True, batch_mode='OFF', use_batch_own_dir=True, use_metadata=True, axis_forward='-Z', axis_up='Y')
        
    elif file_out_extension == ".blend":
        bpy.ops.wm.save_as_mainfile(filepath=file_out, compress=False, relative_remap=True, copy=False)
        
    else:
        print("Incorrect output conversion specified.")
