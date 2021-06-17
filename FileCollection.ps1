
$datefilter =$args[0]
#$datefilter ="16/06/2020"

$dirdate = (Get-Date).tostring("yyyyMMdd")

# Define where to store OV
[string]$ovPath = 'G:\LDS_vector_' + $dirdate + '\1 Overview' 

# Create folder if does not exist
if (!(Test-Path -Path $ovPath))
{
    $paramNewItem = @{
        Path      = $ovPath
        ItemType  = 'Directory'
        Force     = $true
    }

    New-Item @paramNewItem
}


Get-Childitem –Path 'N:\HPD\HPD Implementation\Product\Current Editions\1 Overview' -Include *.000, *.00? -File -Recurse | 
          Where-Object { $_.FullName -inotmatch 'Exchange*' -AND $_.LastWriteTime -gt (get-date $datefilter)} -ErrorAction SilentlyContinue | Copy-Item -Destination $ovPath



# Define where to store GE
[string]$gePath = 'G:\LDS_vector_' + $dirdate + '\2 General' 

# Create folder if does not exist
if (!(Test-Path -Path $gePath))
{
    $paramNewItem = @{
        Path      = $gePath
        ItemType  = 'Directory'
        Force     = $true
    }

    New-Item @paramNewItem
}


Get-Childitem –Path 'N:\HPD\HPD Implementation\Product\Current Editions\2 General' -Include *.000, *.00? -File -Recurse | 
          Where-Object { $_.FullName -inotmatch 'Exchange*' -AND $_.LastWriteTime -gt (get-date $datefilter)} -ErrorAction SilentlyContinue | Copy-Item -Destination $gePath



# Define where to store CO
[string]$coPath = 'G:\LDS_vector_' + $dirdate + '\3 Coastal' 

# Create folder if does not exist
if (!(Test-Path -Path $coPath))
{
    $paramNewItem = @{
        Path      = $coPath
        ItemType  = 'Directory'
        Force     = $true
    }

    New-Item @paramNewItem
}


Get-Childitem –Path 'N:\HPD\HPD Implementation\Product\Current Editions\3 Coastal' -Include *.000, *.00? -File -Recurse | 
          Where-Object { $_.FullName -inotmatch 'Exchange*' -AND $_.LastWriteTime -gt (get-date $datefilter)} -ErrorAction SilentlyContinue | Copy-Item -Destination $coPath


# Define where to store AP
[string]$apPath = 'G:\LDS_vector_' + $dirdate + '\4 Approach' 

# Create folder if does not exist
if (!(Test-Path -Path $apPath))
{
    $paramNewItem = @{
        Path      = $apPath
        ItemType  = 'Directory'
        Force     = $true
    }

    New-Item @paramNewItem
}


Get-Childitem –Path 'N:\HPD\HPD Implementation\Product\Current Editions\4 Approach' -Include *.000, *.00? -File -Recurse | 
          Where-Object { $_.FullName -inotmatch 'Exchange*' -AND $_.LastWriteTime -gt (get-date $datefilter)} -ErrorAction SilentlyContinue | Copy-Item -Destination $apPath



# Define where to store HA
[string]$haPath = 'G:\LDS_vector_' + $dirdate + '\5 Harbour' 

# Create folder if does not exist
if (!(Test-Path -Path $haPath))
{
    $paramNewItem = @{
        Path      = $haPath
        ItemType  = 'Directory'
        Force     = $true
    }

    New-Item @paramNewItem
}


Get-Childitem –Path 'N:\HPD\HPD Implementation\Product\Current Editions\5 Harbour' -Include *.000, *.00? -File -Recurse | 
          Where-Object { $_.FullName -inotmatch 'Exchange*' -AND $_.LastWriteTime -gt (get-date $datefilter)} -ErrorAction SilentlyContinue | Copy-Item -Destination $haPath
