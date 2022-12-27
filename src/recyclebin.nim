import winim

proc recycle*(path: string): bool =
  ## Moves the given file or folder to the users recycle bin.
  var ff: SHFILEOPSTRUCT
  ff.wFunc = FO_DELETE
  ff.fFlags = FOF_ALLOWUNDO
  ff.pFrom = path
  return 0 == SHFileOperation(addr ff)

when isMainModule:
  echo recycle("""C:\Users\david\PUTMETOTRASH.txt""")
  echo recycle("""C:\Users\david\ALSOTRASH""")