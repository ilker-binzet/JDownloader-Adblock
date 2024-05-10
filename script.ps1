Write-Output "--------------------"
Write-Output "|EASY JDL ADBLOCKER|"
Write-Output "|  @GNUWood  2024  |"
Write-Output "--------------------"
Write-Output ""

$kullaniciSecimi = Read-Host "Devam et?(e/h)"

switch($kullaniciSecimi)
{
	e {
		$jsonYolu = "$env:LOCALAPPDATA\JDownloader 2.0\cfg\org.jdownloader.settings.GraphicalUserInterfaceSettings.json"
		try {
			$jsonVerisi = Get-Content -Path $jsonYolu | ConvertFrom-Json
		}
		catch {
			Write-Error "org.jdownloader.settings.GraphicalUserInterfaceSettings.json dosyası bulunamadı"
			Start-Sleep 3
			exit
		}
		$jsonVerisi.statusbaraddpremiumbuttonvisible = $false
		$jsonVerisi.premiumalertspeedcolumnenabled = $false

		$jsonString = $jsonVerisi | ConvertTo-Json
		$jsonString | Set-Content -Path $jsonYolu
		Write-Output "Ayarlar başarıyla güncellendi."
		Start-Sleep 3
	}
	h {exit}
	default {Write-Output ("Geçersiz argüman. Cevap e veya h olmalı.")}
}

