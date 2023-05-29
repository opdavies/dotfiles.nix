date_formatted=$(date "+%d/%m/%Y %H:%M:%S")

battery_status=$(cat /sys/class/power_supply/BAT0/capacity)

echo $battery_status% $date_formatted
