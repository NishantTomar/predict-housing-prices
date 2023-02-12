FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /my-app

## Step 2:
# Copy source code to working directory
COPY . .

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install -r /my-app/requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
RUN chmod u+x run_docker.sh 
CMD ["./run_docker.sh"]
