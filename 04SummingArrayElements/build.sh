#!/bin/bash
WINEPREFIX=~/wine-masm wine 'C:\masm32\bin\ml.exe' /c /Cx /coff /Zf /Zi /nologo main.asm
WINEPREFIX=~/wine-masm wine 'C:\masm32\bin\link.exe' main.obj /SUBSYSTEM:console /out:main.exe /entry:start