![branch workflow](https://github.com/scottweitzner/docker-polynote/workflows/branch%20build/badge.svg)


# Docker Polynote

## What is this?
This is the instruction set to build an image for polynote. Polynote is Netflix's opensource
alternative to jupyterlab which has in-notebook support for multiple languages.

## How do I use it?
pretty simple:

1. download docker
2. build your image: `docker build -t polynote .`
3. run a container: `docker run -p 8192:8192 polynote`
4. access your polynotebook [here](http://localhost:8192)

## Have a question or suggestion?
Drop a feature request to this repo. Pull requests welcome!
