# ---------- Dockerfile ----------
#  Вариант А. Берём последнюю стабильную 1.13.1
FROM judge0/api:1.10.0
#  ── или ──
#  Вариант B. Просто всегда latest
# FROM judge0/api:latest

# Без JWT
ENV ENABLE_AUTH false

# Render передаёт порт через переменную PORT
ENV API_PORT=${PORT:-8080}
EXPOSE 8080
# У api-образа уже корректный ENTRYPOINT
# -------------------------------------
