#!/bin/bash

HISTFILE="$HOME/.zsh_history"
BACKUP="$HOME/.zsh_history.bak"
CLEAN="$HOME/.zsh_history.clean"

echo "🔧 Reparando historial de Zsh..."

if [[ ! -f "$HISTFILE" ]]; then
  echo "❌ No se encontró el archivo de historial: $HISTFILE"
  exit 1
fi

cp "$HISTFILE" "$BACKUP"
echo "📦 Respaldo creado en $BACKUP"

strings "$HISTFILE" > "$CLEAN"
mv "$CLEAN" "$HISTFILE"
echo "🧼 Historial limpio restaurado en $HISTFILE"

echo "🔄 Reiniciando Zsh..."
exec zsh
