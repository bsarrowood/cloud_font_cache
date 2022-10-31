# Created by:           Brad Arrowood
# Created on:		2022.10.27
# Last updated:         2022.10.27
# Script name:		regedit_MSCloud_font.ps1
# Description:		All company Windows workstations and servers currently block fonts not installed under the default %windir%/Fonts folder
#                       per a set CIS GPO. This unfortunately means the Microsoft Cloud Fonts, which are cached under AppData\Local are
#                       also blocked. While changing the Windows registry can correct this, it goes against the GPO. Alternatively,
#                       pulling the font files and using admin privilege, they can be installed in the default folder to work.
#
# Prerequisites:	Run the script as admin
#                       Fonts need to be in the same folder as the script
#
# References:
# https://learn.microsoft.com/en-US/troubleshoot/windows-client/shell-experience/feature-to-block-untrusted-fonts
# https://www.jordanmalcolm.com/deploying-windows-10-fonts-at-scale/
# https://social.technet.microsoft.com/Forums/ie/en-US/827f1d0c-4d99-4f08-8d45-faec42450521/write-a-registry-entry-with-binary-value?forum=winserverpowershell


# This is to revert anyone who had the previous fix applied back to the current set standard
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" -Name MitigationOptions -Value 0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 -Type Binar

# This sets the source font folder as the root folder the script is running from and pulls all font files to be installed
# For each font file, it is copied into the default Windows\Fonts folder then registered in Windows registry
# No reboot is required and the results are immediate
# If any MSOffice programs are running, they will need to be closed and launched again for the font to work properly
$FontItem = Get-Item -Path $PSScriptRoot
$FontList = Get-ChildItem -Path "$FontItem\*" -Include ('*.fon','*.otf','*.ttc','*.ttf')

foreach ($Font in $FontList) {
        Write-Host 'Installing font -' $Font.BaseName
        Copy-Item $Font "C:\Windows\Fonts"
        New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name         
}