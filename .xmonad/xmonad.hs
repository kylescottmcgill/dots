import XMonad
import XMonad.Actions.WindowGo

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook

import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.Run (spawnPipe)

import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.RunOrRaise

import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Layout.Circle
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing
import XMonad.Layout.BinarySpacePartition

import qualified XMonad.StackSet as W
import qualified Data.Map as M
import Data.Ratio

import System.IO

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal		= "urxvt"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth	= 1

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask		= mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces	= ["term", "web", "dev"] ++ map show [4..9]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#272935"
myFocusedBorderColor = "#cc6666"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

-- launch a terminal
[
((modm, xK_Return), spawn $ XMonad.terminal conf),

-- launch rofi
((modm .|. shiftMask, xK_grave), runOrRaisePrompt mySP),
((modm, xK_grave), spawn "rofi -show run"),

-- close focused window
((modm, xK_q), kill),

-- Rotate through the available layout algorithms
((modm, xK_space), sendMessage NextLayout),

--	Reset the layouts on the current workspace to default
((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf),

-- Resize viewed windows to the correct size
((modm, xK_n), refresh),

-- Move focus to the next window
((modm, xK_Tab), windows W.focusDown),

-- Move focus to the next window
((modm, xK_j), windows W.focusDown),

-- Move focus to the previous window
((modm, xK_k), windows W.focusUp),

-- Move focus to the master window
((modm, xK_m), windows W.focusMaster),

-- Swap the focused window and the master window
((modm .|. shiftMask, xK_Return), windows W.swapMaster),

-- Swap the focused window with the next window
((modm .|. shiftMask, xK_j), windows W.swapDown),

-- Swap the focused window with the previous window
((modm .|. shiftMask, xK_k), windows W.swapUp),

-- Layout
((modm, xK_a), sendMessage Shrink),
((modm, xK_s), sendMessage Expand),
((modm .|. shiftMask, xK_a), sendMessage MirrorShrink),
((modm .|. shiftMask, xK_s), sendMessage MirrorExpand),

-- Push window back into tiling
((modm, xK_t	   ), withFocused $ windows . W.sink),

-- Increment the number of windows in the master area
((modm, xK_comma ), sendMessage (IncMasterN 1)),

-- Deincrement the number of windows in the master area
((modm, xK_period), sendMessage (IncMasterN (-1))),

-- Toggle the status bar gap
-- Use this binding with avoidStruts from Hooks.ManageDocks.
-- See also the statusBar function from Hooks.DynamicLog.
--
((modm, xK_x), sendMessage ToggleStruts),

-- Restart xmonad
((modm .|. shiftMask,  xK_q), spawn "xmonad --recompile; xmonad --restart ; rm ~/.xmonad/xmonad.{o,errors,hi}"),

-- Launch browser
((modm, xK_b), runOrRaise "chromium" (className =? "chromium")),

((0, xF86XK_AudioPlay), spawn "ncmpcpp toggle"),
((0, xF86XK_AudioNext), spawn "ncmpcpp next"),
((0, xF86XK_AudioPrev), spawn "ncmpcpp prev"),
((0, xF86XK_AudioLowerVolume), spawn "amixer -c 0 set Master 5dB-"),
((0, xF86XK_AudioRaiseVolume), spawn "amixer -c 0 set Master 5dB+"),
((modm .|. altMask, xK_l), sendMessage $ ExpandTowards R),
((modm .|. altMask, xK_h), sendMessage $ ExpandTowards L),
((modm .|. altMask, xK_j), sendMessage $ ExpandTowards D),
((modm .|. altMask, xK_k), sendMessage $ ExpandTowards U),
((modm .|. altMask .|. ctrlMask , xK_l), sendMessage $ ShrinkFrom R),
((modm .|. altMask .|. ctrlMask , xK_h), sendMessage $ ShrinkFrom L),
((modm .|. altMask .|. ctrlMask , xK_j), sendMessage $ ShrinkFrom D),
((modm .|. altMask .|. ctrlMask , xK_k), sendMessage $ ShrinkFrom U),
((modm, xK_r), sendMessage Rotate),
((modm, xK_s), sendMessage Swap)

]
++

--
-- mod-[1..9], Switch to workspace N
-- mod-shift-[1..9], Move client to workspace N
--
[((m .|. modm, k), windows $ f i)
| (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
										 , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
										 ++

--
-- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
-- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
--
[((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
| (key, sc) <- zip [xK_w, xK_e, xK_r] [2,1,0]
				   , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

-- mod-button1, Set the window to floating mode and move by dragging
[ ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))

-- mod-button2, Raise the window to the top of the stack
, ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

-- mod-button3, Set the window to floating mode and resize by dragging
, ((modm, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))

-- you may also bind events to the mouse scroll wheel (button4 and button5)
]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts $ spacing 2 $ emptyBSP ||| Grid ||| full ||| tiled ||| Mirror tiled ||| ThreeColMid 1 (3/100) (1/2) ||| Circle
	where
		-- default tiling algorithm partitions the screen into two panes
		-- tiled = Tall nmaster delta ratio
		tiled = ResizableTall (1) (3/100) (1/2) []

-- The default number of windows in the master pane
nmaster = 1

-- Default proportion of screen occupied by master pane
ratio = 1/2

-- Percent of screen to increment by when resizing panes
delta = 3/100

full = noBorders Full

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
[ className =? "MPlayer"		--> doFloat
, className =? "Gimp"			--> doFloat
, resource	=? "desktop_window" --> doIgnore
, resource	=? "kdesktop"		--> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = fullscreenEventHook <+> docksEventHook

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.	Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = return ()

------------------------------------------------------------------------
-- statusbar
--
myBar = ""
--
myPP = xmobarPP {
ppCurrent = xmobarColor "#f9f7f3" "" . wrap "<" ">",
ppUrgent  = xmobarColor "#da4939" "",
ppTitle   = xmobarColor "#6d9cbe" "" . shorten 100,
ppSep	  = xmobarColor "#cc7833" "" " ~ "
}
--
toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_x)

mySP = defaultXPConfig {
bgColor           = "#2b2b2b",
fgColor           = "#f9f7f3",
bgHLight          = "#da4939",
fgHLight          = "#f4f1ed",
borderColor       = "#6d9cbe",
font              = "xft:DejaVu Sans Mono:pixelsize = 11",
promptBorderWidth = 1,
position          = Bottom,
height            = 20,
historySize       = 100
}

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad =<< statusBar myBar myPP toggleStrutsKey defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = withUrgencyHook NoUrgencyHook defaultConfig {
terminal		   = myTerminal,
focusFollowsMouse  = myFocusFollowsMouse,
clickJustFocuses   = myClickJustFocuses,
borderWidth		   = myBorderWidth,
modMask			   = myModMask,
workspaces		   = myWorkspaces,
normalBorderColor  = myNormalBorderColor,
focusedBorderColor = myFocusedBorderColor,

keys			   = myKeys,
mouseBindings	   = myMouseBindings,

layoutHook		   = myLayout,
manageHook		   = myManageHook,
handleEventHook    = myEventHook,
logHook			   = myLogHook,
startupHook		   = myStartupHook
}
