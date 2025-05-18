# ---------- Dockerfile ----------
# БЕРЁМ ТОЛЬКО API-контейнер
FROM judge0/api:1.13.0

# 1. Без JWT (мобильному клиенту токены не нужны)
ENV ENABLE_AUTH false

# 2. Render передаёт порт через $PORT
ENV API_PORT=${PORT:-8080}

EXPOSE 8080
# у api-образа уже есть корректный ENTRYPOINT,
# поэтому CMD/ENTRYPOINT прописывать не надо
# --------------------------------
