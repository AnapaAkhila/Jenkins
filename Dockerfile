FROM python:3.9
WORKDIR /app
COPY demo.py .
CMD ["python", "demo.py"]
