from cx_Freeze import setup, Executable

# Dependencies are automatically detected, but it might need
# fine tuning.
build_options = {
    'packages': ['chirp.drivers'],
    'excludes': []
}

import sys

base = 'Win32GUI' if sys.platform == 'win32' else None

executables = [
    Executable('chirpwx.py', base=base, target_name='CHIRP_K5CN', icon='chirp/share/chirp.ico')
]

setup(name='CHIRP K5CN',
      version='0.4',
      description='modfied CHIRP with UV-K5 CN firmware driver',
      options={'build_exe': build_options},
      executables=executables)
