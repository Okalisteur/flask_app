FROM python:3.11-slim

WORKDIR /home/flask

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m flask && \
    chmod +x app.py test.py && \
    chown -R flask:flask /home/flask

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

USER flask

CMD ["python", "app.py"]