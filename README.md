# PowerShell-Modules
A collection of some PowerShell-Modules

## Extract-ZipFile

### NAME
Extract-ZipFile
    
### SYNOPSIS
Extract a ZIP File
    
    
### SYNTAX
Extract-ZipFile [-ZipFile] <String> [[-Destination] <String>] [-CreateDirectory] [<CommonParameters>]
    
    
### DESCRIPTION
The CMDLET extracts a ZipFile into a given destination and can create a directory to store the zip file contents 
in there.
    

### PARAMETER
    -ZipFile <String>
        A relative or absolute path to the zip file that should be extracted.
        
    -Destination <String>
        A relative or absolute path where you want to store the extracted contents.
        
    -CreateDirectory [<SwitchParameter>]
        With -CreateDirectory the CMDLED creates a directory named like the zip file to store the contents of it in 
        there.
        
    <CommonParameters>
        These cmdlet supports the following common parameters: "Verbose", "Debug",
        "ErrorAction", "ErrorVariable", "WarningAction", "WarningVariable",
        "OutBuffer", "PipelineVariable" und "OutVariable". You can find further information here: 
        "about_CommonParameters" (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### EXAMPLES
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\Users\JohnDoe\Downloads PS>Extract-ZipFile .\file.zip
    
    Extract contents to working directory.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\Users\JohnDoe\Downloads PS>Extract-ZipFile -ZipFile .\file.zip
    
    Extract contents to working directory.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\Users\JohnDoe\Downloads PS>Extract-ZipFile -ZipFile .\file.zip -Destination ..\
    
    Extract contents to C:\Users\JohnDoe\.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    C:\Users\JohnDoe\Downloads PS>Extract-ZipFile -ZipFile .\file.zip -CreateDirectory
    
    Extract contents to C:\Users\JohnDoe\Downloads\file\.
    
    
    
    
    -------------------------- EXAMPLE 5 --------------------------
    
    C:\Users\JohnDoe\Downloads PS>Extract-ZipFile -ZipFile .\file.zip -Destination ..\ -CreateDirectory
    
    Extract contents to C:\Users\JohnDoe\file\
 


