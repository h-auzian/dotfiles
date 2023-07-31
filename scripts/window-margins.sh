# Resizes the current window to an almost maximized size, but with borders.
# Best used with keyboard shortcuts.

horizontal_half=$1  # -1|0|1
vertical_half=$2    # -1|0|1
centered=$3         # 0|1

if [ $# -ge 3 ]; then
    HORIZONTAL_MARGIN=20
    VERTICAL_MARGIN=20
    INTERNAL_MARGIN=10
    UPPER_BAR=0
    LOWER_BAR=0
    BAR_MARGIN=34

    # Get current window properties.
    current_window_id=$(xdotool getactivewindow)
    current_window_name=$(xdotool getactivewindow getwindowname)

    if [[ $current_window_name =~ "Plasma" ]]; then
        exit 1
    fi

    # Apply lateral compensation.
    lateral_compensation=0
    if [ $centered -eq 1 ]; then
        lateral_compensation=240
    fi

    # Apply upper and lower compensation.
    upper_compensation=0
    if [ $UPPER_BAR -eq 1 ]; then
        upper_compensation=$BAR_MARGIN
    fi

    lower_compensation=0
    if [ $LOWER_BAR -eq 1 ]; then
        lower_compensation=$BAR_MARGIN
    fi

    # Get margins using a fixed resolution as reference.
    referential_width=1920
    referential_height=1080

    screen_width=$(xwininfo -root | awk '$1=="Width:" {print $2}')
    screen_height=$(xwininfo -root | awk '$1=="Height:" {print $2}')

    if [ $screen_height -gt $screen_width ]; then
        aux=$referential_height
        referential_height=$referential_width
        referential_width=$aux
    fi

    horizontal_margin=$(( (( $HORIZONTAL_MARGIN + $lateral_compensation )) * $screen_width / $referential_width ))
    upper_vertical_margin=$(( (( $VERTICAL_MARGIN + $upper_compensation )) * $screen_height / $referential_height ))
    lower_vertical_margin=$(( (( $VERTICAL_MARGIN + $lower_compensation )) * $screen_height / $referential_height ))

    # Calculate the new window position and size.
    positionX=$(( horizontal_margin ))
    positionY=$(( upper_vertical_margin ))

    window_width=$(( $screen_width - $horizontal_margin * 2 ))
    window_height=$(( $screen_height - $upper_vertical_margin - $lower_vertical_margin ))

    if [ $horizontal_half -eq -1 ] || [ $horizontal_half -eq 1 ]; then
        substraction=$(( ( $window_width + $INTERNAL_MARGIN ) / 2 ))
        window_width=$(( $window_width - $substraction ))

        if [ $horizontal_half -eq 1 ]; then
            positionX=$(( $positionX + $substraction ))
        fi
    fi

    if [ $vertical_half -eq -1 ] || [ $vertical_half -eq 1 ]; then
        substraction=$(( ( $window_height + $INTERNAL_MARGIN ) / 2 ))
        window_height=$(( $window_height - $substraction ))

        if [ $vertical_half -eq 1 ]; then
            positionY=$(( $positionY + $substraction ))
        fi

    elif [ $vertical_half -eq -2 ] || [ $vertical_half -eq 2 ]; then
        upper_half=$(( $window_height / 8 ))
        lower_half=$(( window_height - $upper_half ))

        if [ $vertical_half -eq -2 ]; then
            window_height=$(( $lower_half - $INTERNAL_MARGIN / 2 ))

        elif [ $vertical_half -eq 2 ]; then
            window_height=$(( $upper_half - $INTERNAL_MARGIN / 2 ))
            positionY=$(( $positionY + $lower_half + $INTERNAL_MARGIN / 2 ))
        fi
    fi

    # Apply the new position and size to the current active window.
    wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
    wmctrl -r :ACTIVE: -e 0,$positionX,$positionY,$window_width,$window_height

else
    echo "Parameters: <horizontal -1/0/1> <vertical -1/0/1> <centered 0/1>"
fi
