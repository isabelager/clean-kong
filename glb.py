import sys
import os
import bpy

def convertGLB(og_path, clean_path):

    bpy.ops.wm.read_factory_settings(use_empty=True)

    bpy.ops.import_scene.gltf(filepath=og_path)

    bpy.ops.export_scene.gltf(filepath=clean_path, export_format='GLB', export_yup=True)


def main():
    # allows python to read arguments passed to blender
    argv = sys.argv
    # get all args after "--"
    # argv is list of str
    argv = argv[argv.index("--") + 1:]

    srcpath = argv[0]
    dstpath = argv[1]
    url = argv[2]
    num = url.split('.glb')[0].split('/')[-1]
    # required for how blender rigged at moment
    abs_path = '/Users/iag/Dev/Blenderer/clean-kong'

    og_glb = os.path.join(abs_path, '{0}/{1}.glb'.format(srcpath, num))
    print("og_glb: {0}".format(og_glb))

    clean_glb = os.path.join(abs_path, "{0}/{1}_clean.glb".format(dstpath, num))
    print("clean_glb: {0}".format(clean_glb))

    convertGLB(og_glb, clean_glb)

if __name__ == "__main__":
    main()
