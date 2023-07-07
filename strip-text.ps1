# Set the path to the input and output files
$inputFile = "video.html"
$outputFile = "video.txt"

# Read the input file and extract the text in the yt-formatted-string tags
$html = Get-Content $inputFile -Raw
#$html = '<yt-formatted-string class="segment-text style-scope ytd-transcript-segment-renderer" aria-hidden="true" tabindex="-1">on November 1st to be the beginning of the period of performance</yt-formatted-string>'
#$regex = '<yt-formatted-string class="segment-text style-scope ytd-transcript-segment-renderer" aria-hidden="true" tabindex="-1">(.*?)</yt-formatted-string>'
$regex = '<yt-formatted-string[^>]*>(.*?)</yt-formatted-string>'
$text = [regex]::Matches($html, $regex) | ForEach-Object { $_.Groups[1].Value }

# Write the extracted text to the output file
$text | Out-File $outputFile