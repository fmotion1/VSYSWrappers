
[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')    | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework')   | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')          | out-null
[System.Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration') | out-null


$iconBase64      = 'AAABAAQAICAAAAEAIACoEAAARgAAABgYAAABACAAiAkAAO4QAAAUFAAAAQAgALgGAAB2GgAAEBAAAAEAIABoBAAALiEAACgAAAAgAAAAQAAAAAEAIAAAAAAAgBAAAAAAAAAAAAAAAAAAAAAAAAD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wH///+O////V////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8B////kP/////////8////W////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///47////////////////////7////V////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////Vf////v////////////////////8////W////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////V/////v////////////////////7////jP///8T////w////8////8b///9s////Bv///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////V/////v////////////////////////////////////////////////////P////G////wD/////////////////////////////////////////////////////////////////////////4v///yP///8A////AP///wD///8A////V/////v////////////////////////////////////////////////////P////Bv//////////////////////////////////////////////////////////////////////////////4v///yP///8A////AP///wD///8A////jP////////////////////////////////////////////////////////9s////////////////////////////////////////////////////////////////////////////////////4v///wv///8A////AP///wD////F////////////////////tv///xz///8d////t////////////////////8f/////////////////////////////////////////////////////////////////////////////////////////Cf///wD///8A////AP////D///////////////////8c////AP///wD///8d////////////////////8v////////////////////////////////////////////////////////////////////////////////////////8N////AP///wD///8A////8////////////////////xz///8A////AP///x3////////////////////y/////////////////////////////////////////////////////////////////////////////////////////yb///8A////AP///wD////J////////////////////tP///xv///8c////tv///////////////////8f/////////////////////////////////////////////////////////////////////////////////////////Wf///wD///8A////AP///27/////////////////////////////////////////////////////////bP////////////////////////////////////////////////////////////////////////////////////////+o////AP///wD///8A////B////9D//////////////////////////////////////////////8////8H//////////////////////////////////////////////////////////////////////////////////////////n///8i////AP///wD///8A////G////9D////////////////////////////////////P////G////wD//////////////////////////////////////////////////////////////////////////////////////////////6z///8A////AP///wD///8A////B////27////I////9P////T////I////bf///wf///8A////AP///////////////////////////////////////////////////////////////////////////////////////////////////3P///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A/////////////////////////////////////////////////////////////////////////////////////////////////////P///3P///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD//////////////////////////////////////////////////////////////////////////////////////////////////////////////6z///8i////AP///wD///8A////AP///wD///8A////AP///wD///8c////rv////////////////////////////////////////////////////////////////////////////////////////////////////////////////////n///+o////Wf///yf///8L////Cv///yD///9X////pf////n///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+I////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/////////////////////////////////////////////////////////////////////////////////////////iP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///////////////////////////////////////////////////////////////////////////////////4j///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A//////////////////////////////////////////////////////////////////////////////+I////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/////////////////////////////////////////////////////////////////////////iP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///////////////////////////////////////////////////////////////////4j///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A//+P////B////wP///8B////gAP//8ABAAHgAAAA8AAAAHAAAABwYAAAcGAAAHAAAABwAAAAcAAAADgBAAA8AwAAH/8AAA//AAAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//AAB//wAA//8AAf//AAP//wAH//8oAAAAGAAAADAAAAABACAAAAAAAGAJAAAAAAAAAAAAAAAAAAAAAAAA////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///1L///+Y////Av///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////S/////j/////////nf///wL///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////mP///////////////////5z///8C////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////Av///5z///////////////////+8////2f////j////b////f////wn///8A////iP///4j///+I////iP///4j///+I////iP///4j///+I////iP///zP///8A////AP///wL///+c/////////////////////////////////////////8X///8J/////////////////////////////////////////////////////////+////81////AP///wD///8C////u/////////////////////////////////////////9////////////////////////////////////////////////////////////////v////Cf///wD///8A////2f//////////////ev///wz///97///////////////a////////////////////////////////////////////////////////////////////Bv///wD///8A////+P//////////////DP///wD///8N///////////////4////////////////////////////////////////////////////////////////////Gf///wD///8A////3P//////////////ef///wv///96///////////////b////////////////////////////////////////////////////////////////////TP///wD///8A////gv////////////////////////////////////////+A////////////////////////////////////////////////////////////////////pf///wD///8A////Cv///8f//////////////////////////////8b///8J/////////////////////////////////////////////////////////////////////f///zH///8A////AP///wr///+C////3P////n////c////gf///wn///8A/////////////////////////////////////////////////////////////////////////93///8V////AP///wD///8A////AP///wD///8A////AP///wD///8A///////////////////////////////////////////////////////////////////////////////d////Mf///wD///8A////AP///wD///8A////AP///wD///8y/////////////////////////////////////////////////////////////////////////////////////f///6X///9M////Gf///wT///8V////Sv///6X////7/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////5v///93////d////3f///93////d////3f///93////d////3f///93////////////////////////////////////////////////////////////////////iP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A//////////////////////////////////////////////////////////////+I////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A/////////////////////////////////////////////////////////4j///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////////////////////////////////////////////////////iP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A//j/AP/wfwD/8D8A//ABAAAYAAAADAAAAAYAAAAGEAAABgAAAAYAAAAGAAAAAwEAAAH/AAAA/gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB/8AAA//AAAf/wAAP/8AKAAAABQAAAAoAAAAAQAgAAAAAACQBgAAAAAAAAAAAAAAAAAAAAAAAP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8D////oP///0v///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///6D/////////+P///0v///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////S/////j/////////+P///1r///9j////df///0D///8A////AP///0T///9E////RP///0T///9E////RP///0T///9E////Jv///wD///8A////S/////j//////////////////////////////6n///8F///////////////////////////////////////////////0////P////wD///8A////Wv///////////////////////////////////3/////////////////////////////////////////////////////0////B////wD///9j//////////////9Z////FP///8n/////////5f////////////////////////////////////////////////////////8I////AP///3j//////////////xP///8A////lP/////////3/////////////////////////////////////////////////////////yb///8A////Q///////////////yP///5T////3/////////8D/////////////////////////////////////////////////////////cP///wD///8A////q//////////////////////////5////Mf/////////////////////////////////////////////////////////j////C////wD///8G////gf///+b////4////wv///zH///8A//////////////////////////////////////////////////////////////+v////Bf///wD///8A////AP///wD///8A////AP///wD////////////////////////////////////////////////////////////////////B////K////wD///8A////AP///wD///8G////bv/////////////////////////////////////////////////////////////////////////9////xv///5L///+I////pP///+n//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////9////9L////RP///0T///9E////RP///0T///9E////RP///0T////////////////////////////////////////////////////h////Iv///wD///8A////AP///wD///8A////AP///wD///8A////AP//////////////////////////////////////////////4f///yL///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A/////////////////////////////////////////+H///8i////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/x/AA/8PwAP/AMAAAYAAAADAAAAAQAAAAEIAAABAAAAAYAAAACBAAAAfwAAADwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf8AAAP/AAAH/wACgAAAAQAAAAIAAAAAEAIAAAAAAAQAQAAAAAAAAAAAAAAAAAAAAAAAD///8A////AP///wD///8A////AP///wD///8A////AP///yX///+4////Fv///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///+5/////////9P///8W////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////Fv///9P/////////4v///+z////l////iP///wb////////////////////////////////////4////Sv///wD///8W////4f////////////////////////+H//////////////////////////////////////////j///8F////AP///+3/////////PP///z3/////////5f//////////////////////////////////////////////DP///wD////l/////////zr///88/////////+X//////////////////////////////////////////////z////8A////iP////////////////////////+I//////////////////////////////////////////////+w////AP///wb///+J////5v///+X///+I////Bv///////////////////////////////////////////////////3f///8A////AP///wD///8A////AP///wD/////////////////////////////////////////////////////////sP///z////8L////FP///0b///+7//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+I////AP///wD///8A////AP///wD///8A////AP////////////////////////////////////////+I////AP///wD///8A////AP///wD///8A////AP///wD///////////////////////////////////+I////AP///wD///8A////AP///wD///8A////AP///wD///8A/x8AAP8PAAD/AAAAAIAAAABAAAAAQAAAAEAAAABAAAAAPwAAAAAAAAAAAAAAAAAAAAAAAAB/AAAA/wAAAf8AAA=='

$iconBytes       = [Convert]::FromBase64String($iconBase64)
$stream          = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
$SysTrayIcon     = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))

$SystrayNotifyIcon         = [System.Windows.Forms.NotifyIcon]::new()
$SystrayNotifyIcon.Text    = "Search Icon Library"
$SystrayNotifyIcon.Icon    = $SysTrayIcon
$SystrayNotifyIcon.Visible = $true


##### OPEN MENU ITEMS #####################################################################################


$MenuOpenContext             = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuOpenContext.Text        = "00 Context Menu"

$MenuOpenInspiration         = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuOpenInspiration.Text    = "00 Inspiration"

$MenuOpenLinked              = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuOpenLinked.Text         = "00 Linked"

$MenuOpenWorking             = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuOpenWorking.Text        = "00 Working"

$MenuOpenBrands              = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuOpenBrands.Text         = "00 Brands"

$MenuOpenVSYS                = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuOpenVSYS.Text           = "00 VSYS"








##### SEARCH MENU ITEMS ##################################################################################


$MenuSearchAll               = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuSearchAll.Text          = "Search All Icons"

$MenuSearchSVG               = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuSearchSVG.Text          = "Search SVGs"

$MenuSearchICOColor          = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuSearchICOColor.Text     = "Search ICOs (Color)"

$MenuSearchICOSymbolic       = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuSearchICOSymbolic.Text  = "Search ICOs (Symbolic)"

$MenuSearchBrands            = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuSearchBrands.Text       = "Search All Brands"

$MenuSearchRaster            = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuSearchRaster.Text       = "Search Raster"

$MenuSearchOverlays          = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuSearchOverlays.Text     = "Search Overlays"

$MenuSearchCursors           = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuSearchCursors.Text      = "Search Cursors"




$IllustratorImage = [System.Drawing.Image]::FromFile("C:\Icons\00 Linked\AppLaunchIllustratorTools.ico")

$MenuLaunchILShortcuts       = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuLaunchILShortcuts.Text  = "Launch Illustrator Helpers"
$MenuLaunchILShortcuts.Image = $IllustratorImage

$ColorsImage = [System.Drawing.Image]::FromFile("C:\Icons\00 Linked\AppLaunchColors.ico")

$MenuLaunchColors            = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuLaunchColors.Text       = "Launch Colors"
$MenuLaunchColors.Image      = $ColorsImage

$ShareXImage = [System.Drawing.Image]::FromFile("C:\Icons\00 Linked\AppShareX.ico")

$MenuLaunchShareX            = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuLaunchShareX.Text       = "Launch ShareX"
$MenuLaunchShareX.Image      = $ShareXImage

$DeskPinsImage = [System.Drawing.Image]::FromFile("C:\Icons\00 Linked\AppDeskPin02.ico")

$MenuLaunchDeskPins            = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuLaunchDeskPins.Text       = "Launch DeskPins"
$MenuLaunchDeskPins.Image      = $DeskPinsImage

$PowerToysImage = [System.Drawing.Image]::FromFile("C:\Icons\00 Linked\AppPowerToys01.ico")

$MenuLaunchPowerToys            = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuLaunchPowerToys.Text       = "Launch PowerToys"
$MenuLaunchPowerToys.Image      = $PowerToysImage

$FigmaImage = [System.Drawing.Image]::FromFile("C:\Icons\00 Linked\AppFigma01.ico")

$MenuLaunchFigma            = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuLaunchFigma.Text       = "Launch Figma"
$MenuLaunchFigma.Image      = $FigmaImage



$MenuExit                    = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuExit.Text               = "Exit"


$ContextMenu = New-Object System.Windows.Forms.ContextMenuStrip
$SystrayNotifyIcon.ContextMenuStrip = $ContextMenu


$ContextMenu.Items.Add($MenuOpenBrands)
$ContextMenu.Items.Add($MenuOpenContext)
$ContextMenu.Items.Add($MenuOpenInspiration)
$ContextMenu.Items.Add($MenuOpenLinked)
$ContextMenu.Items.Add($MenuOpenVSYS)
$ContextMenu.Items.Add($MenuOpenWorking)


$ContextMenu.Items.Add("-")
$ContextMenu.Items.Add($MenuSearchAll)
$ContextMenu.Items.Add($MenuSearchSVG)
$ContextMenu.Items.Add($MenuSearchICOColor)
$ContextMenu.Items.Add($MenuSearchICOSymbolic)
$ContextMenu.Items.Add($MenuSearchBrands)
$ContextMenu.Items.Add($MenuSearchRaster)
$ContextMenu.Items.Add($MenuSearchOverlays)
$ContextMenu.Items.Add($MenuSearchCursors)
$ContextMenu.Items.Add("-")

$ContextMenu.Items.Add($MenuLaunchPowerToys)
$ContextMenu.Items.Add($MenuLaunchFigma)
$ContextMenu.Items.Add($MenuLaunchDeskPins)
$ContextMenu.Items.Add($MenuLaunchShareX)
$ContextMenu.Items.Add($MenuLaunchILShortcuts)
$ContextMenu.Items.Add($MenuLaunchColors)
$ContextMenu.Items.Add("-")
$ContextMenu.Items.Add($MenuExit)


$MenuOpenContext.Add_Click({       OnClick_OpenContext })
$MenuOpenLinked.Add_Click({        OnClick_OpenLinked })
$MenuOpenWorking.Add_Click({       OnClick_OpenWorking })
$MenuOpenBrands.Add_Click({        OnClick_OpenBrands })
$MenuOpenVSYS.Add_Click({          OnClick_OpenVSYS })
$MenuOpenInspiration.Add_Click({   OnClick_OpenInspiration })



$MenuSearchAll.Add_Click({         OnClick_SearchAll })
$MenuSearchBrands.Add_Click({      OnClick_SearchBrands })
$MenuSearchICOColor.Add_Click({    OnClick_SearchICOColor })
$MenuSearchICOSymbolic.Add_Click({ OnClick_SearchICOSymbolic })
$MenuSearchSVG.Add_Click({         OnClick_SearchSVG })
$MenuSearchRaster.Add_Click({      OnClick_SearchRaster })
$MenuSearchOverlays.Add_Click({    OnClick_SearchOverlays })
$MenuSearchCursors.Add_Click({     OnClick_SearchCursors })
$MenuLaunchILShortcuts.Add_Click({ OnClick_LaunchIllustratorHelper })
$MenuLaunchColors.Add_Click({      OnClick_MenuLaunchColors })
$MenuLaunchDeskPins.Add_Click({    OnClick_MenuLaunchDeskPins })
$MenuLaunchPowerToys.Add_Click({   OnClick_MenuLaunchPowerToys })
$MenuLaunchFigma.Add_Click({       OnClick_MenuLaunchFigma })
$MenuLaunchShareX.Add_Click({      OnClick_MenuLaunchShareX })
$MenuExit.Add_Click({              OnClick_MenuExit })



function OnClick_MenuExit() {
    $SystrayNotifyIcon.Visible = $false
    $SystrayNotifyIcon.Dispose()
    $window.Close()
    Stop-Process $pid
    # $Global:Timer_Status = $timer.Enabled
    # If ($Timer_Status -eq $true) {
    #     $timer.Stop()
    # }
}


function OnClick_MenuLaunchFigma() { & "C:\Users\futur\AppData\Local\Figma\Figma.exe" }
function OnClick_MenuLaunchDeskPins() { & "C:\Program Files (x86)\DeskPins\deskpins.exe" }
function OnClick_MenuLaunchPowerToys() { & "C:\Program Files\PowerToys\PowerToys.exe" }
function OnClick_OpenBrands() { explorer "C:\Icons\00 Brands" }
function OnClick_OpenInspiration() { explorer "C:\Icons\00 Inspiration" }
function OnClick_OpenLinked() { explorer "C:\Icons\00 Linked" }
function OnClick_OpenVSYS() { explorer "C:\Icons\00 VSYS" }
function OnClick_OpenContext() { explorer "C:\Icons\00 Context Menu" }
function OnClick_OpenWorking() { explorer "C:\Icons\00 Working" }
function OnClick_SearchAll() { & "C:\Program Files\Everything 1.5a\Everything64.exe" "C:\Icons\" }
function OnClick_SearchBrands() { & "C:\Program Files\Everything 1.5a\Everything64.exe" "C:\Icons\00 Brands" }
function OnClick_SearchICOColor() {
    $a1 = "C:\Icons\ICO"
    $a2 = "C:\Icons\00 VSYS"
    $a3 = "C:\Icons\00 Linked"
    $a4 = "C:\Icons\00 Context Menu"
    & "C:\Program Files\Everything 1.5a\Everything64.exe" $a1 $a2 $a3 $a4
}
function OnClick_SearchICOSymbolic() { & "C:\Program Files\Everything 1.5a\Everything64.exe" "C:\Icons\ICO BW" }
function OnClick_SearchSVG() { & "C:\Program Files\Everything 1.5a\Everything64.exe" "C:\Icons\SVG" }
function OnClick_SearchRaster() { &  "C:\Program Files\Everything 1.5a\Everything64.exe" "C:\Icons\Raster" }
function OnClick_SearchOverlays() { & "C:\Program Files\Everything 1.5a\Everything64.exe" "C:\Icons\Overlays" }
function OnClick_SearchCursors() { & "C:\Program Files\Everything 1.5a\Everything64.exe" "C:\Icons\Cursors" }




function OnClick_LaunchIllustratorHelper() { & "C:\Tools\VSYS\IllustratorMainTools.exe" }
function OnClick_MenuLaunchColors() { & "C:\Tools\Colors\Colors.exe" }

function OnClick_MenuLaunchShareX() { & "C:\Program Files\ShareX\ShareX.exe" }

function OnClick_MenuLaunchDeskPins() { & "C:\Program Files (x86)\DeskPins\deskpins.exe" }

function OnClick_MenuLaunchPowerToys() { & "C:\Program Files\PowerToys\PowerToys.exe" }

function OnClick_MenuLaunchFigma() { & "C:\Users\futur\AppData\Local\Figma\Figma.exe" }



$SystrayNotifyIcon.add_DoubleClick({
    explorer "C:\Icons"
})


# Make PowerShell Disappear
$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
$null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0)

# Force garbage collection just to start slightly lower RAM usage.
[System.GC]::Collect()

# Create an application context for it to all run within.
# This helps with responsiveness, especially when clicking Exit.
$appContext = New-Object System.Windows.Forms.ApplicationContext
[void][System.Windows.Forms.Application]::Run($appContext)