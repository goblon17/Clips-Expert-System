build:
	pyinstaller -F src/main.py --hidden-import=_cffi_backend