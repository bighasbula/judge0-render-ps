# ---------- Dockerfile ----------
FROM judge0/judge0:1.13.0

# отключаем JWT-авторизацию, Render не даст нам секрета сразу
ENV ENABLE_AUTH=false

# Render слушает порт, указанный в $PORT
ENV PORT=8080
ENV API_PORT=8080

EXPOSE 8080
CMD ["./start.sh"]
# ---------- конец ---------------
