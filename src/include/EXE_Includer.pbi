


Structure FILEENTRY
bUsed.i
sFilename.s{64}
iCompressedSize.i
iSize.i
bIsCompressed.i
EndStructure


Procedure __GetAttachedEXEBlock()
File.s = ProgramFilename()

iFile = ReadFile(#PB_Any,File)

If iFile
  iSize = Lof(iFile)
  If iSize > 4
    FileSeek(iFile, iSize - 4)
    iBlockSize = ReadLong(iFile)
    
    If iBlockSize > 0
      *Mem = AllocateMemory(iBlockSize)
      If *Mem
        FileSeek(iFile, iSize - 4 - iBlockSize)
        ReadData(iFile, *Mem, iBlockSize)
      EndIf
    EndIf
  EndIf
  
  CloseFile(iFile)
EndIf
ProcedureReturn *Mem
EndProcedure


Global AttachedBlockSize.i

Procedure __AttachBlockToExe(sEXEFile.s, sFile.s, *Mem, iSize)
If *Mem
iFile = OpenFile(#PB_Any, sEXEFile)
If iFile
  FileSeek(iFile, Lof(iFile))
  
  *TempMem = AllocateMemory(iSize + 4096)
  If *TempMem
    iPackedSize = PackMemory(*Mem, *TempMem, iSize, 9)
    
    tmp.FILEENTRY
    tmp\bUsed = #True
    tmp\sFilename = GetFilePart(sFile)
    tmp\iCompressedSize = iPackedSize
    tmp\iSize = iSize
    If iPackedSize
      tmp\bIsCompressed = #True     
      WriteData(iFile, tmp, SizeOf(FILEENTRY))
      WriteData(iFile, *TempMem, iPackedSize)
    Else
      iPackedSize= iSize
      tmp\iCompressedSize = iSize
      tmp\bIsCompressed = #False
      WriteData(iFile, tmp, SizeOf(FILEENTRY))
      WriteData(iFile, *Mem, iSize)     
      MessageRequester("Warning","Can't pack file: " +sFile , #MB_ICONWARNING)
    EndIf

    FreeMemory(*TempMem)
    AttachedBlockSize + iPackedSize + SizeOf(FILEENTRY)
    
  EndIf
CloseFile(iFile)
EndIf
FreeMemory(*Mem)
EndIf
EndProcedure


Procedure AttachFileToExe(sExeFile.s, sFile.s)
iFile = ReadFile(#PB_Any, sFile)
If iFile
  iSize = Lof(iFile)
  If iSize > 0
    *Mem = AllocateMemory(iSize)
    ReadData(iFile, *Mem, iSize)
    __AttachBlockToExe(sExeFile, sFile, *Mem, iSize)
  EndIf
  CloseFile(iFile)
EndIf
EndProcedure

Procedure EndAttachToExe(sExeFile.s)
iFile = OpenFile(#PB_Any, sExeFile)
If iFile
  FileSeek(iFile, Lof(iFile))
  tmp.FILEENTRY
  WriteData(iFile,tmp, SizeOf(FILEENTRY))
  AttachedBlockSize + SizeOf(FILEENTRY)
  WriteLong(iFile, AttachedBlockSize)
  AttachedBlockSize = 0
  CloseFile(iFile)
EndIf
EndProcedure


Procedure __ExtractBlockToTemp(*Mem.FILEENTRY, sTmpPathName.s)
iSuccess = #True
If *Mem
  *OrgMem = *Mem
  If sTmpPathName <> ""
    If Right(sTmpPathName, 1) <> "\"
      sTmpPathName + "\"
    EndIf
  EndIf
  sTmpPathName =  GetTemporaryDirectory() + sTmpPathName 
  CreateDirectory(sTmpPathName)  
  Repeat
   If *Mem\bUsed
      sName.s = sTmpPathName + *Mem\sFilename
      iSize.i = *Mem\iSize
      iCompressedSize = *Mem\iCompressedSize
      bIsCompressed = *Mem\bIsCompressed
      
      ;MessageRequester("",sName + " size "+Str(iSize)+ "      compressed:"+Str(iCompressedSize))
      *Mem + SizeOf(FILEENTRY)
      *TmpMem = AllocateMemory(iSize)
      If *TmpMem
      
        If bIsCompressed
          UnpackMemory(*Mem, *TmpMem)
        Else
          CopyMemory(*Mem, *TmpMem, iSize) 
        EndIf
           
        If FileSize(sName) < 1
          iFile = CreateFile(#PB_Any, sName)
          If iFile
            WriteData(iFile, *TmpMem, iSize)
            CloseFile(iFile)
            MoveFileEx_(sName.s, "", #MOVEFILE_DELAY_UNTIL_REBOOT)
          Else
            iSuccess = #False
            MessageRequester("Error!","Can NOT extract file '" + sTmpPathName + *Mem\sFilename+"' !", #MB_ICONERROR)
          EndIf
        EndIf
        FreeMemory(*TmpMem)
        
      Else
        iSuccess = #False
        MessageRequester("Error!","Can NOT allocate memory block of size '" + Str(iCompressedSize) + "' !", #MB_ICONERROR)
      EndIf
      *Mem + iCompressedSize
   EndIf
  Until *Mem\bUsed = #False
  FreeMemory(*OrgMem)
  Else
  iSuccess = #False
EndIf
ProcedureReturn iSuccess
EndProcedure



Procedure ExtractTemporaryFiles(sSubPath.s = "")
*Mem = __GetAttachedEXEBlock()
ProcedureReturn __ExtractBlockToTemp(*Mem, sSubPath.s)
EndProcedure





 
; Setup the error handler.
;
;OnErrorCall(@ErrorHandler())
 






; 
; 
; 
; 
; ;MessageRequester("","Extractor")
; 
; ;ExtractTemporaryFiles("TempDirTest")
; 
; 
; If 1=1
; AttachFileToExe("Extract.exe", "HolzStamm.bmp")
; AttachFileToExe("Extract.exe", "Earth-Burning-512x512.png")
; AttachFileToExe("Extract.exe", "DXViewer.exe")
; AttachFileToExe("Extract.exe", "window-Protector.iss")
; AttachFileToExe("Extract.exe", "fire2.jpg")
; EndAttachToExe("Extract.exe")
; EndIf
; IDE Options = PureBasic 4.30 (Windows - x86)
; CursorPosition = 172
; FirstLine = 63
; Folding = Q-
; EnableXP
; EnableOnError
; Executable = Extract.exe