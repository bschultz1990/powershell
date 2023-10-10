. $PSScriptRoot\vfpaths.ps1
function fileme2 {
  $confirmed = $false
  while ($confirmed -eq $false) {
    Write-Host "=== IMPORTANT! Complete all of the following before continuing:===`n"
    "[ ] Remove all Starlike orders that are USDC`n"
    
    $response = Read-Host "Have you completed all of the above? (yes/no)"
    
    if ($response.ToLower() -eq 'no') {
      return
    }
    elseif ($response.ToLower() -eq 'yes') {
      $confirmed = $true
      Write-Host ""
    }
    else {
      Write-Host "Invalid input. Please enter 'yes' or 'no'."
    }
  }
  
  # if the backup directory doesn't exist, create one.
  if (-not (Test-Path backup)) { mkdir backup }
  Copy-Item *.pdf "./backup"
  
  foreach ($key in $bpaths.Keys) {
    if (Test-Path -Path $bpaths.$key.search -PathType leaf) {
      Write-Host "Moving" $bpaths.$key.search "to" $bpaths.$key.dest
      Move-Item $bpaths.$key.search $bpaths.$key.dest
      if ($bpaths.$key.action -eq "folder") {
        folderme $bpaths.$key.dest $bpaths.$key.fd1 $bpaths.$key.fd2
      }

    }
  }

}

$bpaths = @{
  "_abdulwahab"          = @{
    "search" = "./*ABDULWAHAB*.pdf"
    "dest"   = "$invoices/Ali Abdulwahab Al Mutawa"
    "action" = "archive"
  }
  "_vans_forus"          = @{
    "search" = "./*VN*FORUS*.pdf"
    "dest"   = $vans_forus
    "action" = "archive"
  }
  "_jansport_forus"      = @{
    "search" = "./*JS*FORUS*.pdf"
    "dest"   = $jansport_forus
    "action" = "archive"
  }
  "_jansport_save"       = @{
    "search" = "./*JS*SAVE COMERCIAL E IMPORTADORA LTDA*.pdf"
    "dest"   = $jansport_save
    "action" = "archive"
  }
  "_jansport_smash"      = @{
    "search" = "./*JS*SMASH TRADING*.pdf"
    "dest"   = "$invoices/SMASH TRADING"
    "action" = "edit"
  }
  "_tnf_komax_chile"     = @{
    "search" = "./*KOMAX*SA *.pdf"
    "dest"   = $tnf_komax_chile
    "action" = "archive"
  }
  "_tnf_komax_peru"      = @{
    "search" = "./*KOMAX*PERU *.pdf"
    "dest"   = $tnf_komax_peru
    "action" = "archive"
  }
  "_smartwool_lostarrow" = @{
    "search" = "./SW*LOST ARROW*.pdf"
    "dest"   = $smartwool_lostarrow_edit
    "action" = "edit"
  }
  "_smartwool_starlike"  = @{
    "search" = "./*STARLIKE*.pdf"
    "dest"   = $smartwool_starlike_edit
    "action" = "edit"
  }
  "_vans_grimuru"        = @{
    "search" = "./*VN*GRIMURU*.pdf"
    "dest"   = $vans_grimuru_edit
    "action" = "folder"
    "fd1"    = "vans"
    "fd2"    = "grimuru"
  }
  "_tnf_importadora"     = @{
    "search" = "./*TNF*IMPORTADORA*.pdf"
    "dest"   = $tnf_comercial_edit
    "action" = "folder"
    "fd1"    = "tnf"
    "fd2"    = "comercial"
  }
  "_vans_arezzo"         = @{
    "search" = "./*VN*AREZZO*.pdf"
    "dest"   = $vans_arezzo_edit
    "action" = "folder"
    "fd1"    = "vans"
    "fd2"    = "arezzo"
  }
  "_tnf_justus"          = @{
    "search" = "./TNF*JUST*US*"
    "dest"   = $justus_edit
    "action" = "folder"
    "fd1"    = "tnf"
    "fd2"    = "justus"
  }
  "_vans_grimoldi"       = @{
    "search" = "./VN*GRIMOLDI*"
    "dest"   = $vans_grimoldi_edit
    "action" = "folder"
    "fd1"    = "vans"
    "fd2"    = "grimoldi"
  }
}