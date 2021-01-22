$sizes = 100, 125, 150, 175, 200
$path = "$HOME/Desktop/Files"

New-Item -ItemType -Directory -Path $path -Force 

foreach ($size in $sizes) {

    $file = New-Object -TypeName System.IO.FileStream -ArgumentList "$path/$size`KB.txt", Create, ReadWrite
    $file.SetLength($size * 1KB)
    $file.Close()

}