<#
.SYNOPSIS
This script will uninstall and install packages from apps.json using winget.

.DESCRIPTION
This script will read apps.json and execute winget to uninstall and install packages.

.PARAMETER Type
Type of operation.
Allowed values: Install, Uninstall, empty string.
Default: empty string

.EXAMPLE
Start.ps1
Uninstalls packages in app.json then install packages in app.json

.EXAMPLE
Start.ps1 -Type Install
Only install packages in app.json

.EXAMPLE
Start.ps1 -Type Uninstall
Only uninstall packages in app.json

.INPUTS
None

.OUTPUTS
None

.LINK
https://github.com/tinnguyentg/windows
#>

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("Install", "Uninstall")]
    [string]$Type
)

$apps_json = Get-Content -Path .\apps.json | ConvertFrom-Json

function Install-Packages([string[]]$packages)
{
    foreach ($package in $packages) {
        Write-Verbose "Installing $package..."
        winget install -e --id $package
    }
}

function Uninstall-Packages([string[]]$packages)
{
    foreach ($package in $packages) {
        Write-Verbose "Uninstalling $package..."
        winget uninstall -e --id $package
    }
}

if ($Type) {
	switch ($Type)
	{
		"Install" { Install-Packages $apps_json.to_install }
		"Uninstall" { Uninstall-Packages $apps_json.to_uninstall }
	}
}
else {
	Uninstall-Packages $apps_json.to_uninstall; Install-Packages $apps_json.to_install
}
