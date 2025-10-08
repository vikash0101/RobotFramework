FROM python:3.9-slim
WORKDIR /app
COPY . /app
RUN ls -l
RUN pip install robotframework
RUN pip install robotframework-seleniumlibrary
RUN apt-get update && apt-get install -y wget curl unzip gnupg apt-transport-https
RUN apt --fix-broken install
# #RUN wget -O chrome-linux64.zip https://storage.googleapis.com/chrome-for-testing-public/141.0.7390.54/linux64/chrome-linux64.zip
# RUN unzip /app/chrome-linux64.zip
# RUN ls -l
# RUN chmod u+x ./chrome-linux64
# RUN cd /app/chrome-linux64 && ls -l
# RUN cd /app/chrome-linux64 && ls -l deb.deps
#RUN apt-get update && apt-get install -y ca-certificates curl
# RUN apk update && apk add --no-cache ca-certificates git curl
# COPY corporate-ca.crt /app/ca-certificates
# RUN update-ca-certificates
# RUN cd /app/chrome-linux64 && apt-get update && \
#     apt-get install -y && \
#     apt-get satisfy -y --no-install-recommends "$(cat deb.deps)" && \
#     rm -rf /var/lib/apt/lists/*
# Download the Google Chrome stable .deb package
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Google Chrome from the downloaded .deb package
# apt-get install -y ./package.deb automatically handles dependencies
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

# Clean up the downloaded .deb file to reduce image size
RUN rm google-chrome-stable_current_amd64.deb
CMD ["python", "-m", "robot", "-d", "Report", "TestCases/TestCases.robot"]