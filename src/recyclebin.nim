when defined(windows):
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

when defined(linux):
  import os, strformat

  proc recycleGio*(path: string): bool =
    return 0 == execShellCmd(&"gio trash \'{path}\'")

  proc recycle*(path: string): bool =
    let gioPath = findExe("gio")
    if gioPath.len > 0:
      return recycleGio(path)
    # TODO add other methods on linux

  when isMainModule:
    echo recycle("/home/david/Downloads/test123")
