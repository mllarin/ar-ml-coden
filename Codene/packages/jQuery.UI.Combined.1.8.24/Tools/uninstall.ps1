<<<<<<< HEAD
param($installPath, $toolsPath, $package, $project)

. (Join-Path $toolsPath common.ps1)

# Update the _references.js file
=======
param($installPath, $toolsPath, $package, $project)

. (Join-Path $toolsPath common.ps1)

# Update the _references.js file
>>>>>>> refs/remotes/origin/mllarin
Remove-Reference $scriptsFolderProjectItem $juiFileNameRegEx