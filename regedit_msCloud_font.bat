:: Created by:		Brad Arrowood
:: Created on:		2022.09.29
:: Last updated:	2022.09.29
:: Script name:		regedit_msCloud_font.bat
:: Description:		An unknown number of company computers currently do not render Microsoft Cloud Fonts properly. After discovering
::                      Windows has a registry sub-key which blocks any fonts outside of the %windir%/Fonts folder this script was
::                      made to change the value from blocking other fonts it would allow yet audit them.
::
:: Prerequisites:	Run the script as admin
::
:: References:
:: https://learn.microsoft.com/en-US/troubleshoot/windows-client/shell-experience/feature-to-block-untrusted-fonts

@ECHO off

:: changes the sub-key value from blocking to audit, replaces existing sub-key should one exist
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MitigationOptions /t REG_QWORD /d 3000000001000 /f

:: adding a delay before reboot
timeout 5

:: a reboot is needed for the resolve to take affect
shutdown /r /t 0