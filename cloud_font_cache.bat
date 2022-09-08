:: Created by:		Brad Arrowood
:: Created on:		2022.09.08
:: Last updated:    2022.09.08
:: Script name:		cloud_font_cache.bat
:: Description:		Script to clear the cloud font cache folder

@ECHO off
RMDIR "C:\Users\%USERNAME%\AppData\Local\Microsoft\FontCache\4\CloudFonts" /S /Q