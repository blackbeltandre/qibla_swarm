# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from golang:1.12-alpine base image
FROM golang:1.13-alpine

# The latest alpine images don't have some tools like (`git` and `bash`).
# Adding git, bash and openssh to the image
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# Add Maintainer Info


LABEL maintainer="Rajeev Singh <rajeevhub@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /server
RUN ls -al

# Copy go mod and sum files
COPY /server/go.mod /server/go.sum ./
COPY ./server/.env ./

# Download all dependancies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

RUN ls -al

# Copy the source from the current directory to the Working Directory inside the container
COPY server ./

#WORKDIR /server
#set now directory

#RUN dir
#CMD ["ls", "/server"]
#RUN ls -al

WORKDIR server

#RUN cd /server/server ./

RUN ls -al

#WORKDIR /server/server

#RUN cd server

#RUN ls -al

#RUN cd server ./
#RUN ls -al
#GO to server folder



#FROM alpine

#RUN apk update && apk add --no-cache tzdata postgresql-client wkhtmltopdf ttf-ubuntu-font-family


#COPY --from=0 /src/app .
#COPY --from=0 /src/key /key/
#COPY --from=0 /src/db /db/
#COPY --from=0 /src/statics /statics/
#COPY --from=0 /src/dbconfig.yml /dbconfig.yml

# Build the Go app
RUN go build -o main .
#RUN go run main.go
# Expose port 000 to the outside world
EXPOSE 2000
RUN hostname
RUN ifconfig

RUN ls -al
# Run the executable
CMD ["./main"]

#RUN go run main.go

RUN ls -al

