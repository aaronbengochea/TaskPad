# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt


# Expose the port that your Flask app runs on 
EXPOSE 4000

# Define environment variable for Flask
ENV FLASK_APP=app.py
ENV FLASK_ENV=production
ENV FLASK_PORT=4000
ENV FLASK_HOST=0.0.0.0


# Run the Flask application
CMD ["python", "app.py"]
