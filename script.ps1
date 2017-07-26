$reader = [System.IO.File]::OpenText("password.txt")
$counter = 0

try 
{
    for()
    {
        $line = $reader.ReadLine()
        
        if ($line -eq $null) 
        { break }

        $SecureString = ConvertTo-SecureString $line -AsPlainText -Force

        if(Unlock-BitLocker -MountPoint "E:" -Password $SecureString)
        { break }

        $counter++
        write-host $counter
    }
}
finally
{
    $reader.Close()
}
