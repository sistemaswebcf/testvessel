$url = "https://www.iss-foundation.org/api/public-vessels?publicListType=PVR"
$outputPath = "vessels.csv"

$userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
$jsonRaw = curl -s -A $userAgent -H "Accept: application/json" $url

if ($jsonRaw) {
    $data = $jsonRaw | ConvertFrom-Json
    $data | Export-Csv -Path $outputPath -Delimiter ';' -NoTypeInformation -Encoding UTF8
    Write-Host "CSV generado exitosamente con $($data.Count) registros."
} else {
    Write-Error "No se pudo obtener datos de la API."
    exit 1
}
