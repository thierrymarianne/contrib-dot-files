#!/bin/zsh

local last_command_failed="o_O"
local last_command_succeeded="^_^"

local mood_color="$bold_color%(?:%{$FG[070]%}:%{$FG[214]%})"
local now="${mood_color}[ $(date "+%Y/%m/%d %H:%M:%S") ]$reset_color "
local ret_status="${mood_color}%(?:%{$last_command_succeeded%}:%{$last_command_failed%})"
local username=" ${reset_color}${bold_color}%(?:$FG[071]:$FG[202])$USER"
local at="$bold_color%(?:%{$FG[070]%}:%{$FG[214]%})@${reset_color}"
local host="${bold_color}%(?:$FG[071]:$FG[202])%M${reset_color}"
local identity=" ${username} ${at} ${host} "
local git_color="$bold_color%(?:$FG[070]:$FG[160])"
local git_branch_color="${mood_color}"
local current_directory="${bold_color}%(?:%{$FG[070]%}:%{$FG[214]%}) in \"%c\" directory $reset_color%} "

# use spectrum_ls to list all available colors to oh-my-zsh theme
local last_commit_hash="%(?:%{$FG[071]%}:%{$FG[214]%}) [$(git show HEAD --format=%H -s | cut -c1-12 )]${reset_color}"

PROMPT='${now}${ret_status}${identity}${current_directory}$(git_prompt_info)${last_commit_hash}'$'\n'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$git_color%}$reset_color%{$git_branch_color%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="]%{$git_color%}%{$fg[yellow]${reset_color}%}"
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$git_color${reset_color}%}"

