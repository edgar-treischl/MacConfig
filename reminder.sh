# --- Monthly Config Reminder ---
function remind_update_config() {
    local reminder_file="$HOME/.config_reminder"
    local current_month=$(date +%Y-%m)

    # read last reminder month
    local last_month=""
    if [[ -f "$reminder_file" ]]; then
        last_month=$(cat "$reminder_file")
    fi

    # if it's a new month, show reminder
    if [[ "$current_month" != "$last_month" ]]; then
        echo "💡 Reminder: Run ./create_config.sh to update your Mac configuration files!"
        
        # macOS notification
        osascript -e 'display notification "Run ./create_config.sh to update your Mac configuration files!" with title "Mac Setup Reminder"'

        # update last reminder month
        echo "$current_month" > "$reminder_file"
    fi
}

# Call the reminder function automatically when a new terminal session starts
remind_update_config
