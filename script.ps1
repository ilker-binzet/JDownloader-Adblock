Write-Output "--------------------"
Write-Output "|EASY JDL ADBLOCKER|"
Write-Output "|  @GNUWood  2024  |"
Write-Output "--------------------"
Write-Output ""

$kullaniciSecimi = Read-Host "Devam et?(e/h)"

switch($kullaniciSecimi)
{
	e {
		$jsonYolu = $env:LOCALAPPDATA + '/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json'
		try {
			$jsonVerisi = Get-Content -Path $jsonYolu | ConvertFrom-Json
		}
		catch {
			Write-Error "org.jdownloader.settings.GraphicalUserInterfaceSettings.json Dosya Bulunamadı"
			Start-Sleep 3
			exit
		}
		$jsonVerisi.premiumalertetacolumnenabled = $false
		$jsonVerisi.premiumalertspeedcolumnenabled = $false
		$jsonVerisi.premiumalertetacolumnenabled = $false
		$jsonVerisi.specialdealoboomdialogvisibleonstartup = $false
		$jsonVerisi.specialdealsenabled = $false
		$jsonVerisi.donatebuttonstate = "CUSTOM_HIDDEN"
		$jsonVerisi.bannerenabled = $false
		$jsonString = $jsonVerisi | ConvertTo-Json
		$jsonString | Set-Content -Path $jsonYolu
		Write-Output "Reklam Engelleme Tamamlandı."
		Start-Sleep 3
	}
	h {exit}
	default {Write-Output ("Gecersiz arguman. Cevap e veya h olmalı.")}
}
