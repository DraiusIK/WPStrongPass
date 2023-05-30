function Generate-Password {
    param (
        [int]$passNumber,
        [int]$passLength
    )

    $chars = [char[]]([char]'a'..[char]'z' + [char]'A'..[char]'Z' + [char]'0'..[char]'9' + [char[]]([char]'!', [char]'"', [char]'#', [char]'$', [char]'%', [char]'&', [char]"'", [char]'(', [char])', [char]'*', [char]'+', [char]',', [char]'-'))

    for ($i = 0; $i -lt $passNumber; $i++) {
        $password = -join ($chars | Get-Random -Count $passLength)
        Write-Output "SENHA $($i+1) GERADA: $password"
    }
}

function Banner {
    Write-Output "****************************************"
    Write-Output "$                                      $"
    Write-Output "$              WinPass                 $"
    Write-Output "$                                      $"
    Write-Output "****************************************"
}

Banner
$passNumber = Read-Host "NÚMERO DE SENHAS GERADAS: "
$passLength = Read-Host "QUANTIDADE DE CARACTERES: "

if ([int]$passLength -lt 1 -or [int]$passNumber -lt 1) {
    Write-Output "SOMENTE NÚMEROS"
}
else {
    Generate-Password -passNumber [int]$passNumber -passLength [int]$passLength
}
