## Map PSDrives to other registry hives
if (!(Test-Path HKCR:)) {
    $null = New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
    $null = New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS
}

## Customize the prompt
function prompt {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    $prefix = $(if (Test-Path variable:/PSDebugContext) { '[DBG]: ' }
        elseif ($principal.IsInRole($adminRole)) { "[ADMIN]: " }
        else { '' })
    $body = 'PS ' + $(Get-Location)
    $suffix = $(if ($NestedPromptLevel -ge 1) { '>>' }) + '> '
    $prefix + $body + $suffix
}

## Create $PSStyle if running on a version older than 7.2
## - Add other ANSI color definitions as needed

if ($PSVersionTable.PSVersion.ToString() -lt '7.2.0') {
    # define escape char since "`e" may not be supported
    $esc = [char]0x1b
    $PSStyle = [pscustomobject]@{
        Foreground = @{
            Magenta      = "${esc}[35m"
            BrightYellow = "${esc}[93m"
        }
        Background = @{
            BrightBlack = "${esc}[100m"
        }
    }
}

## Set PSReadLine options and keybindings
$PSROptions = @{
    BellStyle           = 1
    ContinuationPrompt  = '  '
    Colors              = @{
        Operator            = $PSStyle.Foreground.Magenta
        Parameter           = $PSStyle.Foreground.Magenta
        Selection           = $PSStyle.Background.BrightBlack
        InLinePrediction    = $PSStyle.Foreground.BrightYellow + $PSStyle.Background.BrightBlack
    }
    EditMode = 1
}
Set-PSReadLineOption @PSROptions
Set-PSReadLineKeyHandler -Chord 'Ctrl+f' -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord 'Alt+f' -Function AcceptNextSuggestionWord
Set-PSReadLineKeyHandler -Chord 'Enter' -Function ValidateAndAcceptLine

## Add argument completer for the dotnet CLI tool
$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    dotnet complete --position $cursorPosition $commandAst.ToString() |
    ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock $scriptblock