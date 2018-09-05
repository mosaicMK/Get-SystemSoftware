Function Get-SystemSoftware{
    <#
    .SYNOPSIS
    Script to show or export installed software information

    .DESCRIPTION
    The script will display Software ID number, Name, Vendor and Version.

    .PARAMETER Computer
    With this parameter you cam run this on a remote computer

    .PARAMETER Export
    Allows you to export the information to a file

    .PARAMETER ExportFile
    Exportes the software info the a target file, If you do not specify a file then the export will be stored in the script root.

    .NOTES
    Created By: Kris Gross
    Contact: contact@mosaicmk.com
    Version: 3.0.0.0

    .LINK
    http://www.mosaicmk.com
    #>
    param([string]$ComputerName = $env:computername)

    $SFInfo = Get-WmiObject Win32_Product -ComputerName $ComputerName
    $AllObjects = @()
    foreach ($item in $SFInfo)
    {
    $AllObjects += [pscustomobject]@{
        Name = $item.Name.Trim()
        ID = $item.IdentifyingNumber.trim()
        Vendor = $item.Vendor.trim()
        Version = $item.Version.trim()
    }
    }
    $AllObjects
}
