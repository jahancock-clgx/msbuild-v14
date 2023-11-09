
$ErrorActionPreference = 'Stop' # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileAdd =  Join-Path $toolsDir 'msBuild14.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE' #only one of these: exe, msi, msu
  file          = $fileAdd
  silentArgs    = '/quiet /norestart' # Replace Item1, Item2, etc. with the actual IDs of the components you want to install.
  softwareName  = 'msbuild-v14*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '243EACE2D62A208048F562C7F6FFED1912DBFD254D7F9EE00C7D760B36B42416'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
            
  validExitCodes= @(0) #please insert other valid exit codes here
}

Install-ChocolateyInstallPackage @packageArgs # https://docs.chocolatey.org/en-us/create/functions/install-chocolateypackage
