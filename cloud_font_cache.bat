:: Created by:		Brad Arrowood
:: Created on:		2022.09.08
:: Last updated:    2022.09.08
:: Script name:		cloud_font_cache.bat
:: Description:		Script to clear the cloud font cache folder
:: References:
::                  https://presentyourstory.com/identifying-and-resetting-microsoft-cloud-fonts/
::                  https://docs.microsoft.com/en-us/typography/fonts/windows_10_font_list#-pan-european-supplemental-fonts
::                  https://docs.microsoft.com/en-us/typography/font-list/neue-haas-grotesk-text-pro

@ECHO off
RMDIR "C:\Users\%USERNAME%\AppData\Local\Microsoft\FontCache\4\CloudFonts" /S /Q
