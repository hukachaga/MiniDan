#!/usr/bin/env bash
set -euo pipefail

# Política:
# - Downloads gerais: 90 dias
# - Áudios gerados: 30 dias
# - Screenshots/cache do web: 15 dias
#
# Ajuste os caminhos abaixo para o seu ambiente antes de usar em produção.

DELETED=0
BYTES=0

log_delete() {
  local file="$1"
  local size
  size=$(stat -c '%s' "$file" 2>/dev/null || echo 0)
  printf 'deleted\t%s\t%s\n' "$size" "$file"
  rm -f -- "$file"
  DELETED=$((DELETED + 1))
  BYTES=$((BYTES + size))
}

cleanup_find() {
  local dir="$1"
  local expr="$2"
  [[ -d "$dir" ]] || return 0
  while IFS= read -r -d '' file; do
    log_delete "$file"
  done < <(find "$dir" -type f \( $expr \) -print0 2>/dev/null)
}

# 1) Downloads gerais do sistema e dos profiles
DOWNLOAD_DIRS=("/root/Downloads")
while IFS= read -r dir; do
  [[ -n "$dir" ]] && DOWNLOAD_DIRS+=("$dir")
done < <(find /root/.hermes/profiles -type d -path '*/home/Downloads' 2>/dev/null | sort -u)

mapfile -t UNIQUE_DOWNLOAD_DIRS < <(printf '%s\n' "${DOWNLOAD_DIRS[@]}" | sort -u)
for dir in "${UNIQUE_DOWNLOAD_DIRS[@]}"; do
  [[ -d "$dir" ]] || continue
  cleanup_find "$dir" "-mtime +90"
done

# 2) Áudios gerados localmente
cleanup_find "/root/voice-memos" "-mtime +30"

# 3) Screenshots / cache de imagens do Hermes web/main
cleanup_find "/root/.hermes/profiles/main/cache/images" "-mtime +15"
cleanup_find "/root/.hermes/profiles/web/cache/images" "-mtime +15"
cleanup_find "/root/.hermes/profiles/web/home/Downloads" "-path '*/playwright*' -mtime +15"

if [[ "$DELETED" -eq 0 ]]; then
  exit 0
fi

printf 'summary\tdeleted_files=%s\tfreed_bytes=%s\n' "$DELETED" "$BYTES"
