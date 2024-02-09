Write-Output "Welcome to our interactive PowerShell menu"
Write-Output "Please select a number from the list below"
Write-Output "1. View the system information"
Write-Output "2. Do some file operations"
Write-Output "3. Use some network tools"
Write-Output "4. Operate on processes"
Write-Output "5. Have some data analysis operations"
Write-Output "6. Exit"
$choice = Read-Host "Please enter your choice:"

if ($choice -eq 1) {
    Write-Output "Please choose an option from the list below:"
    Write-Output "1. View configuration information about the computer and the operating system"
    Write-Output "2. Get basic information about the computer serial number, caption, codeset, buildnumber "
    Write-Output "3. Get information about the processor"
    Write-Output "4. Get information about the installed memory"
    Write-Output "5. Get information about the disk drives"
    Write-Output "6. Display the host name portion of the full computer name"
    Write-Output "7. Display TCP/IP network configuration information"
    Write-Output "8. Display the current date and time"

    $choice = Read-Host "Please enter your choice:"

    if ($choice -eq 1) {
        Write-Output "The system information is as follows:"
        Get-ComputerInfo
    }
    elseif ($choice -eq 2) {
        Write-Output "The serial number, caption, codeset, buildnumber are: "
        Get-CimInstance Win32_OperatingSystem | Select-Object Caption, CodeSet, BuildNumber,SerialNumber
    }
    elseif ($choice -eq 3) {
        Write-Output "The processor information are:"
        Get-WMIObject win32_Processor | Select-Object name
    }
    elseif ($choice -eq 4) {
        Write-Output "The installed memory is:"
        Get-WmiObject Win32_PhysicalMemory
    }
    elseif ($choice -eq 5) {
        Write-Output "The disk drives information are:"
        Get-WmiObject -Class Win32_LogicalDisk
    }
    elseif ($choice -eq 6) {
        Write-Output "The host name is:"
        Get-ComputerInfo -Property CSName
    }
    elseif ($choice -eq 7) {
        Write-Output "The TCP/IP configurations are as follow:"
        Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Select-Object -Property IPAddress, DefaultIPGateway, DNSServerSearchOrder
    }
    elseif ($choice -eq 8) {
        Write-Output "The current date and time are:"
        Get-Date
    }
    else {
        Write-Output "Invalid choice"
    }
}
elseif ($choice -eq 2) {
    Write-Output "Please choose an option from the list below:"
    Write-Output "1. Display or change file attributes"
    Write-Output "2. Display the name of the current directory"
    Write-Output "3. Change the name of the current directory"
    Write-Output "4. Copy files to another location"
    Write-Output "5. Delete one or more files"
    Write-Output "6. Display a list of files and subdirectories in a directory"
    Write-Output "7. Create a new directory"
    Write-Output "8. Move one or more files from a directory to another"
    Write-Output "9. Remove a directory"
    Write-Output "10. Rename a file"
    Write-Output "11. Save the current directory then change it"
    Write-Output "12. Remove subdirectories"
    Write-Output "13. Replace a file"
    Write-Output "14. Display the directory structure"
    Write-Output "15. Copy files and directory trees"
    
    $choice = Read-Host "Please enter your choice:"
    
    if ($choice -eq 1) {
        Write-Output "The file attributes are:"
        Get-ChildItem | Format-Table -Property Name, Attributes
    }

    elseif ($choice -eq 2) {
        Write-Output "The name of the current directory is:"
        Get-Location
    }
    elseif ($choice -eq 3) {
        $newDir = Read-Host "Please enter the new directory name:"
        Rename-Item -Path . -NewName $newDir
    }

    elseif ($choice -eq 4) {
        $source = Read-Host "Please enter the source file name:"
        $destination = Read-Host "Please enter the destination file name:"
        Copy-Item -Path $source -Destination $destination
    }

    elseif ($choice -eq 5) {
        $file = Read-Host "Please enter the file name to be deleted:"
        Remove-Item -Path $file
    }

    elseif ($choice -eq 6) {
        Write-Output "The list of files and subdirectories in the current directory are:"
        Get-ChildItem
    }

    elseif ($choice -eq 7) {
        $newDir = Read-Host "Please enter the new directory name:"
        New-Item -ItemType Directory -Path $newDir
    }

    elseif ($choice -eq 8) {
        $source = Read-Host "Please enter the source file name:"
        $destination = Read-Host "Please enter the destination file name:"
        Move-Item -Path $source -Destination $destination
    }

    elseif ($choice -eq 9) {
        $dir = Read-Host "Please enter the directory name to be removed:"
        Remove-Item -Path $dir
    }

    elseif ($choice -eq 10) {
        $file = Read-Host "Please enter the file name to be renamed:"
        $newFile = Read-Host "Please enter the new file name:"
        Rename-Item -Path $file -NewName $newFile
    }

    elseif ($choice -eq 11) {
        Write-Output "The current directory is saved and changed"
        Push-Location
    }

    elseif ($choice -eq 12) {
        $dir = Read-Host "Please enter the directory name to be removed:"
        Remove-Item -Path $dir -Recurse
    }

    elseif ($choice -eq 13) {
        $source = Read-Host "Please enter the source file name:"
        $destination = Read-Host "Please enter the destination file name:"
        Copy-Item -Path $source -Destination $destination -Force
    }

    elseif ($choice -eq 14) {
        Write-Output "The directory structure is as follows:"
        Get-ChildItem -Recurse
    }

    elseif ($choice -eq 15) {
        $source = Read-Host "Please enter the source file name:"
        $destination = Read-Host "Please enter the destination file name:"
        Copy-Item -Path $source -Destination $destination -Recurse
    }
    
    else {
        Write-Output "Invalid choice"
    }
}
elseif ($choice -eq 3) {

    Write-Output "Please choose an option from the list below:"
    Write-Output "1. View the current password & logon restrictions for the computer"
    Write-Output "2. Display your current server or workgroup settings"
    Write-Output "3. Add a computer attached to the windows domain controller"
    Write-Output "4. Remove a computer attached to the windows domain controller"
    Write-Output "5. View the details of a particular user account."
    Write-Output "6. View the details of a particular group account."
    Write-Output "7. Stop a particular service."
    Write-Output "8. Start a particular service."
    Write-Output "9. Display network statistics of the workstation or server"
    Write-Output "10. Connect your computer from a shared resource or display information about your connections"
    Write-Output "11. Disconnect your computer from a shared resource or display information about your connections"

    $choice = Read-Host "Please enter your choice:"

    if($choice -eq 1) {
        Write-Output "The current password & logon restrictions for the computer are:"
        Get-WmiObject Win32_UserAccount
    }

    elseif($choice -eq 2) {
        Write-Output "The current server or workgroup settings are:"
        Get-WmiObject Win32_ComputerSystem
    }

    elseif($choice -eq 3) {
        $computer = Read-Host "Please enter the computer name to be added to the domain controller:"
        Add-Computer -DomainName $computer
    }

    elseif($choice -eq 4) {
        $computer = Read-Host "Please enter the computer name to be removed from the domain controller:"
        Remove-Computer -UnjoinDomainCredential $computer
    }

    elseif($choice -eq 5) {
        $user = Read-Host "Please enter the user account name:"
        Get-WmiObject Win32_UserAccount -Filter "Name='$user'"
    }

    elseif($choice -eq 6) {
        $group = Read-Host "Please enter the group account name:"
        Get-WmiObject Win32_Group -Filter "Name='$group'"
    }

    elseif($choice -eq 7) {
        $service = Read-Host "Please enter the service name to be stopped:"
        Stop-Service -Name $service
    }

    elseif($choice -eq 8) {
        $service = Read-Host "Please enter the service name to be started:"
        Start-Service -Name $service
    }

    elseif($choice -eq 9) {
        Write-Output "The network statistics of the workstation or server are:"
        Get-NetTCPConnection
    }

    elseif($choice -eq 10) {
        $resource = Read-Host "Please enter the shared resource name:"
        New-PSDrive -Name "Z" -PSProvider FileSystem -Root "\\$resource\c$" -Persist
    }

    elseif($choice -eq 11) {
        $resource = Read-Host "Please enter the shared resource name:"
        Remove-PSDrive -Name "Z"
    }

    else {
        Write-Output "Invalid choice"
    }

}

elseif($choice -eq 4){
    Write-Output "Please choose an option from the list below:"
    Write-Output "1. Display the list of all the running  processes"
    Write-Output "2. Kill a particular process"
    Write-Output "3. Start a particular process"
    $choice= Read-Host "Please enter your choice:"

    if($choice -eq 1) {
        Write-Output "The list of all the running processes are:"
        Get-Process
    }

    elseif($choice -eq 2) {
        $process = Read-Host "Please enter the process name"
        Stop-Process -Name $process
}
        elseif($choice -eq 3) {
            $process = Read-Host "Please enter the process name"
            Start-Process -FilePath $process
        }
    
    else{
        Write-Output "Invalid choice"
    }        
}

elseif($choice -eq 5){
    Write-Output "Please choose an option from the list below:"
    Write-Output "1. Search for a string within a file"
    Write-Output "2. Sort the contents of a text file."
    Write-Output "3. Compare two files and display the differences."
    Write-Output "4. Display the contents of a file."
    Write-Output "5. Display the message Hello world."

    $choice= Read-Host "Please enter your choice:"

    if($choice -eq 1) {
        $file = Read-Host "Please enter the file name"
        $string = Read-Host "Please enter the string to be searched"
        Select-String -Path $file -Pattern $string
    }

    elseif ($choice -eq 2) {
        $file = Read-Host "Please enter the file name"
        $fileContent = Get-Content $file
        $sortedContent = $fileContent | Sort-Object
        $sortedContent
    }
    
    elseif($choice -eq 3) {
            $file1 = Read-Host "Please enter the first file name"
            $file2 = Read-Host "Please enter the second file name"
            Compare-Object -ReferenceObject $file1 -DifferenceObject $file2
    }

    elseif($choice -eq 4) {
        $file = Read-Host "Please enter the file name"
        Get-Content -Path $file
    }

    elseif($choice -eq 5) {
        Write-Output "Hello world"
    }
}

elseif($choice -eq 6){
    Write-Output "Exiting the program"
    exit
}

else {
    Write-Output "Invalid choice"
}
