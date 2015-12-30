Add-Type -Assembly "System.IO.Compression.Filesystem"

Function global:Extract-ZipFile ([Parameter(Mandatory=$true)][string]$ZipFile, [string]$Destination, [switch]$CreateDirectory)
{
<#
.SYNOPSIS
Extract a ZIP File

.DESCRIPTION
The CMDLET extracts a ZipFile into a given destination and can create a directory to store the zip file contents in there.

.PARAMETER ZipFile
A relative or absolute path to the zip file that should be extracted.

.PARAMETER Destination
A relative or absolute path where you want to store the extracted contents.

.PARAMETER CreateDirectory
With -CreateDirectory the CMDLED creates a directory named like the zip file to store the contents of it in there.

.INPUTS
Nothing.

.OUTPUTS
A information about what file was extracted to which directory will be written to the output stream.

.EXAMPLE
C:\Users\JohnDoe\Downloads PS> Extract-ZipFile .\file.zip

Extract contents to working directory.

.EXAMPLE
C:\Users\JohnDoe\Downloads PS> Extract-ZipFile -ZipFile .\file.zip

Extract contents to working directory.

.EXAMPLE
C:\Users\JohnDoe\Downloads PS> Extract-ZipFile -ZipFile .\file.zip -Destination ..\

Extract contents to C:\Users\JohnDoe\.

.EXAMPLE
C:\Users\JohnDoe\Downloads PS> Extract-ZipFile -ZipFile .\file.zip -CreateDirectory

Extract contents to C:\Users\JohnDoe\Downloads\file\.

.EXAMPLE
C:\Users\JohnDoe\Downloads PS> Extract-ZipFile -ZipFile .\file.zip -Destination ..\ -CreateDirectory

Extract contents to C:\Users\JohnDoe\file\

.COMPONENT
NET-Assembly System.IO.Compression.Filesystem

.NOTES
Easy to use:
C:\Users\JohnDoe\Downloads PS> Extract-ZipFile file.zip 
will extract to contents to working directory (current directory ~\Downloads\)

.LINK
https://github.com/maikwoehl/PowerShell-Modules

.LINK
http://blogs.technet.com/b/heyscriptingguy/archive/2015/03/11/use-powershell-to-extract-zipped-files.aspx
#>

    $ZipFullPath = Resolve-Path $ZipFile
    $ZipDirectoryPath = ""
    $ZipFullDirectoryPath = ""
    
    
    if( ([string]::IsNullOrEmpty($Destination)))
    {
        $ZipDirectoryPath = $ZipFullPath | Split-Path    
    }
    else 
    {
        $ZipDirectoryPath = $Destination | Resolve-Path
    }

    if ($CreateDirectory)
    {
        $ZipDirectoryName = $ZipFullPath | Split-Path -Leaf
        
        $ZipFullDirectoryPath = "$($ZipDirectoryPath)\$(($ZipDirectoryName.TrimEnd(".zip")))"
        

        New-Item -ItemType Directory -Path $ZipFullDirectoryPath
    }
    else
    {
        $ZipFullDirectoryPath = $ZipDirectoryPath
    }

    Write-Host "Extract file $($ZipFile) to $($ZipFullDirectoryPath)"

    [io.compression.zipfile]::ExtractToDirectory($ZipFullPath, $ZipFullDirectoryPath)
}

Export-ModuleMember -function Extract-ZipFile