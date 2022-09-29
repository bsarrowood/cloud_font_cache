# ms_cloud_fonts_blocked
There was an issue with PowerPoint not rendering the Microsoft Cloud fonts and would instead use standard local fonts as a substitution. However, while PowerPoint might not render them properly, they would work just fine in Word. The previous line of thinking was to clear the cached font folder where the cloud fonts were located, and forcing new copied to be cached. This worked momentarily at best until you changed slides before the issue would surface again.

The resolution was discovered after finding out of a Windows registry value which can block, allow but audit, or allow any font outside the %windir%/Fonts folder to be used. In this case, I made a script to replace the sub-key with the audit value and reboot the machine to resolve the issue.


regedit_msCloud_font.bat - This script resolves the issue by replacing the registry sub-key

cloud_font_cache.bat - This script is being left for historical purpose, but should no longer be needed
