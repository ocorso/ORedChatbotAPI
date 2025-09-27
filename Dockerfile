# Dockerfile

# 1. Official lightweight Python image
FROM python:3.10-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy and install dependencies leveraging Docker's layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy application code into the container
COPY . .

# 5. Define the command to run app using Gunicorn
# Cloud Run sets a PORT environment variable
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "1", "--threads", "8", "--timeout", "0", "app:app"]