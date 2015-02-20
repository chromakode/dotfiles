# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:Droid Sans Mono 12
# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+Shift+x kill

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run -fn 'Droid Sans Mono-12'
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Ctrl+h move left
bindsym $mod+Ctrl+j move down
bindsym $mod+Ctrl+k move up
bindsym $mod+Ctrl+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Ctrl+Left move left
bindsym $mod+Ctrl+Down move down
bindsym $mod+Ctrl+Up move up
bindsym $mod+Ctrl+Right move right

# split in horizontal orientation
bindsym $mod+Shift+v split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen
bindsym $mod+Tab fullscreen

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+Ctrl+s layout stacking
bindsym $mod+Ctrl+w layout tabbed
bindsym $mod+Ctrl+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
bindsym $mod+Shift+a focus child

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10
bindsym $mod+q workspace q
bindsym $mod+w workspace w
bindsym $mod+e workspace e
bindsym $mod+r workspace r

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10
bindsym $mod+Shift+q move container to workspace q
bindsym $mod+Shift+w move container to workspace w
bindsym $mod+Shift+e move container to workspace e
bindsym $mod+Shift+r move container to workspace r

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Escape exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
    # These bindings trigger as soon as you enter the resize mode

    # Pressing left will shrink the window’s width.
    # Pressing right will grow the window’s width.
    # Pressing up will shrink the window’s height.
    # Pressing down will grow the window’s height.
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize grow height 10 px or 10 ppt
    bindsym k resize shrink height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+Ctrl+r mode "resize"

# Screen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 10
bindsym XF86MonBrightnessDown exec xbacklight -dec 10
bindsym Shift+XF86MonBrightnessUp exec xbacklight -inc 1
bindsym Shift+XF86MonBrightnessDown exec xbacklight -dec 1

# Pulse Audio controls
set $sink `pactl list short sinks | grep RUNNING | cut -f1`
bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume $sink +3%; killall -USR1 i3status"
bindsym XF86AudioLowerVolume exec "pactl set-sink-volume $sink -- -3%; killall -USR1 i3status"
bindsym XF86AudioMute exec "pactl set-sink-mute $sink toggle; killall -USR1 i3status"

bindsym Print exec xset dpms force off && gnome-screensaver-command -l

bindsym Mod1+Print exec gnome-screenshot -i

bindsym $mod+grave exec xrandr --output DP1 --above eDP1 --off && xrandr --output DP1 --above eDP1 --auto

workspace 1 output eDP1
assign [class="Gvim"] 2
workspace 2 output DP1

bindsym $mod+Shift+Left workspace prev_on_output
bindsym $mod+Shift+Right workspace next_on_output
bindsym $mod+Shift+Down workspace back_and_forth
bindsym $mod+Shift+h workspace prev_on_output
bindsym $mod+Shift+l workspace next_on_output
bindsym $mod+Shift+j workspace back_and_forth
bindsym Mod1+Tab workspace back_and_forth

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    position top
    output eDP1
    tray_output eDP1
    status_command i3status
}

exec --no-startup-id gnome-settings-daemon
exec --no-startup-id gnome-screensaver
exec --no-startup-id nm-applet
