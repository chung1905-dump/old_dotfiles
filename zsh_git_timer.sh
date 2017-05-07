#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
#git_custom_status() {
#  local cb=$(current_branch)
#  if [ -n "$cb" ]; then
#    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
#  fi
#}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit / 3600))
            DAYS=$((seconds_since_last_commit / 86400))
            MONTHS=$((seconds_since_last_commit / 2629743))
            YEARS=$((seconds_since_last_commit / 31556926))
            
            # Sub-hours and sub-minutes
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))
            SUB_DAYS=$((DAYS % 30))
            SUB_MONTHS=$((MONTHS % 12))

            if [ "$MONTHS" -gt 12 ]; then
                echo -n "${YEARS}y"
                if [ "$SUB_MONTHS" != 0 ]; then
                    echo "-${SUB_MONTHS}m"
                fi
            elif [ "$DAYS" -gt 30 ]; then
                echo -n "${MONTHS}m"
                if [ "$SUB_DAYS" != 0 ]; then
                    echo "-${SUB_DAYS}d"
                fi
            elif [ "$HOURS" -gt 24 ]; then
                echo -n "${DAYS}d"
                if [ "$SUB_HOURS" != 0 ]; then
                    echo "-${SUB_HOURS}h"
                fi
            elif [ "$MINUTES" -gt 60 ]; then
                echo -n "${HOURS}h"
                if [ "$SUB_MINUTES" != 0 ]; then
                    echo "-${SUB_MINUTES}m"
                fi
            else
                echo "${MINUTES}m"
            fi
        fi
    fi
}

# Just add $(git_time_since_commit) to your ZSH PROMPT and you're set
