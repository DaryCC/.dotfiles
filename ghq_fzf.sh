#!/bin/sh
cd "$(ghq list --full-path | fzf)"
