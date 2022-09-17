# golang-builder

Tooling I use to automate Builds of GOLANG programs I tinker with

## Build instructions

Just set an Environment Variable to the location of your Github Repo, and this Builder with Clone the repo, and run a Makefile with a configuration named dockertest. (ie *make dockertest*)
```
dockertest:
	go run main.go
```

## Run like this:
```
docker run -it -e "GITHUB=https://github.com/ngrok-patrick/golang-sample.git" oktaadmin/dockertest
```
