Set-ExecutionPolicy Unrestricted
$CompsInComps = Get-ADComputer -Filter * -SearchBase "CN=Computers, DC=, DC=, DC="
foreach($Comp in $CompsInComps){
    if($Comp.SamAccountName[0] -eq "P"){
        Set-ADComputer $Comp -Description "Auto relocated by Mover. Physical Machine."
        $Comp | Move-ADObject -TargetPath ‘OU=, OU=, OU=, DC=, DC=, DC=’
    }
    elseif($Comp.SamAccountName[0] -eq "V"){
        Set-ADComputer $Comp -Description "Auto relocated by Mover. Virtual Machine."
        $Comp | Move-ADObject -TargetPath ‘OU=, OU=, OU=, DC=, DC=, DC=’
    }
}

exit
