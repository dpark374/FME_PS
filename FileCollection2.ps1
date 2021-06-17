
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


$path="N:\HPD\HPD Implementation\Product\Current Editions\1 Overview" 
$NoOfDirs=Get-ChildItem $path | Where-Object {$_.PSIsContainer -eq $True} 

ForEach($dir in $NoOfDirs )
{
	 $bDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'base*'}   
     $uDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'update*'} 
     
     if ($uDirs.Count -eq 1){
         
         $directoryInfo = Get-ChildItem $path\$dir\$uDirs | Measure-Object
             
             if ($directoryInfo.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$uDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
              
              Get-ChildItem  "$path\$dir\$uDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $ovPath
              
             }

             elseif($bDirs.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$bDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1

              Get-ChildItem  "$path\$dir\$bDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $ovPath
             
             }
               
     } else
     { 
        $NoOfSubDirs=Get-ChildItem  "$path\$dir\" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
                           Get-ChildItem  "$path\$dir\" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $ovPath
     }
     
   
   

}


##########

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


$path="N:\HPD\HPD Implementation\Product\Current Editions\2 General" 
$NoOfDirs=Get-ChildItem $path | Where-Object {$_.PSIsContainer -eq $True} 

ForEach($dir in $NoOfDirs )
{
	 $bDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'base*'}   
     $uDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'update*'} 
     
     if ($uDirs.Count -eq 1){
         
         $directoryInfo = Get-ChildItem $path\$dir\$uDirs | Measure-Object
             
             if ($directoryInfo.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$uDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
              
              Get-ChildItem  "$path\$dir\$uDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $gePath
              
             }

             elseif($bDirs.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$bDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1

              Get-ChildItem  "$path\$dir\$bDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $gePath
             
             }
               
     } else
     { 
        $NoOfSubDirs=Get-ChildItem  "$path\$dir\" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
                           Get-ChildItem  "$path\$dir\" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $gePath
     }
     
   
   

}

##################

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



$path="N:\HPD\HPD Implementation\Product\Current Editions\3 Coastal" 
$NoOfDirs=Get-ChildItem $path | Where-Object {$_.PSIsContainer -eq $True} 

ForEach($dir in $NoOfDirs )
{
	 $bDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'base*'}   
     $uDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'update*'} 
     
     if ($uDirs.Count -eq 1){
         
         $directoryInfo = Get-ChildItem $path\$dir\$uDirs | Measure-Object
             
             if ($directoryInfo.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$uDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
              
              Get-ChildItem  "$path\$dir\$uDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $coPath
              
             }

             elseif($bDirs.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$bDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1

              Get-ChildItem  "$path\$dir\$bDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $coPath
             
             }
               
     } else
     { 
        $NoOfSubDirs=Get-ChildItem  "$path\$dir\" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
                           Get-ChildItem  "$path\$dir\" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $coPath
     }
     
   
   

}

##################

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


$path="N:\HPD\HPD Implementation\Product\Current Editions\4 Approach" 
$NoOfDirs=Get-ChildItem $path | Where-Object {$_.PSIsContainer -eq $True} 

ForEach($dir in $NoOfDirs )
{
	 $bDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'base*'}   
     $uDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'update*'} 
     
     if ($uDirs.Count -eq 1){
         
         $directoryInfo = Get-ChildItem $path\$dir\$uDirs | Measure-Object
             
             if ($directoryInfo.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$uDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
              
              Get-ChildItem  "$path\$dir\$uDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $apPath
              
             }

             elseif($bDirs.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$bDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1

              Get-ChildItem  "$path\$dir\$bDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $apPath
             
             }
               
     } else
     { 
        $NoOfSubDirs=Get-ChildItem  "$path\$dir\" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
                           Get-ChildItem  "$path\$dir\" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $apPath
     }
     
   
   

}

##########################

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


$path="N:\HPD\HPD Implementation\Product\Current Editions\5 Harbour" 
$NoOfDirs=Get-ChildItem $path | Where-Object {$_.PSIsContainer -eq $True} 

ForEach($dir in $NoOfDirs )
{
	 $bDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'base*'}   
     $uDirs=Get-ChildItem  "$path\$($dir.name)" | Where-Object {$_.name -like 'update*'} 
     
     if ($uDirs.Count -eq 1){
         
         $directoryInfo = Get-ChildItem $path\$dir\$uDirs | Measure-Object
             
             if ($directoryInfo.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$uDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
              
              Get-ChildItem  "$path\$dir\$uDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $haPath
              
             }

             elseif($bDirs.Count -gt 0){

             $NoOfSubDirs=Get-ChildItem  "$path\$dir\$bDirs" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1

              Get-ChildItem  "$path\$dir\$bDirs" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $haPath
             
             }
               
     } else
     { 
        $NoOfSubDirs=Get-ChildItem  "$path\$dir\" | Where { $_.PSIsContainer  -and  $_.FullName -inotmatch 'Exchange*' } | Sort CreationTime -Descending | Select -First 1
                           Get-ChildItem  "$path\$dir\" -Include *.000, *.00? -Recurse | 
	                    Where-Object {$_.PSIsContainer -eq $False -and  $_.FullName -inotmatch 'Exchange*'} -ErrorAction SilentlyContinue | Copy-Item -Destination $haPath
     }
     
   
   

}

#스크립트 #####박대현########