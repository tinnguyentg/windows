# Windows

[![GitHub license](http://img.shields.io/github/license/tinnguyentg/windows)](https://github.com/tinnguyentg/windows/blob/master/LICENSE)

This repository provides a simple PowerShell script to uninstall and install packages from apps.json using Winget.

## Usage

Fork or clone this repository, edit apps.json with the packages you want to install/uninstall, and then run the script with PowerShell.

## Example

The following will uninstall Bloatware and then install Chrome and Notepad++:

```json
{
  "to_uninstall": [
    "Microsoft.BingNews",
    "Microsoft.BingSports",
    "Microsoft.BingWeather",
    "Microsoft.Getstarted",
    "Microsoft.Office.OneNote",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCalculator",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo"
  ],
  "to_install": [
    "Google.Chrome",
    "NotepadPlusPlus.NotepadPlusPlus"
  ]
}
```

To run the script, open PowerShell and run the following command:

```powershell
.\Start.ps1 -Verbose
```
