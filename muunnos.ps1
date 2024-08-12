# Kysy alkuperäisen tiedoston nimi
$alkuperainenTiedosto = Read-Host "Anna alkuperäisen tiedoston nimi (esim. video.mp4):"

# Kysy bittivirta (esim. 8000kb/s)
$bittivirta = Read-Host "Anna bittivirta (esim. 8000kb/s tai 80M):"
$uusiTiedosto = $alkuperainenTiedosto -replace '\.mp4$', '_ffmpeg.mp4'

# Suorita FFmpeg-muunnos alkuperäisestä uuteen tiedostoon
ffmpeg -i $alkuperainenTiedosto -c:v hevc_nvenc -b:v $bittivirta -c:a copy $uusiTiedosto

# Kopioi MediaCreateDate sekä MediaModifyDate alkuperäisestä tiedostosta

exiftool -overwrite_original -api QuickTimeUTC -ExtractEmbedded -TagsFromFile $alkuperainenTiedosto "-DateTimeOriginal<DateTimeOriginal" "-MediaCreateDate<CreateDate" "-MediaModifyDate<ModifyDate" $uusiTiedosto

# Päivitä tiedoston luonti ja muokkauspäivä tiedostojärjestelmässä
Set-ItemProperty -Path $uusiTiedosto -Name CreationTime -Value (Get-Item $alkuperainenTiedosto).LastWriteTime
Set-ItemProperty -Path $uusiTiedosto -Name LastWriteTime -Value (Get-Item $alkuperainenTiedosto).LastWriteTime

Write-Host "Uusi tiedosto luotu: $uusiTiedosto"