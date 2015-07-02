#A Go, Docker (sample) workflow

Read more about it here: http://blog.crowdpatent.com/a-go-docker-workflow/

The Docker-Image is available here: https://registry.hub.docker.com/u/johannesboyne/godockersample/



usage

ID=$(docker run -d senthilnayagam/godockersample)

docker ps

SIP=$(docker inspect $ID | jq -r '.[0].NetworkSettings.IPAddress')



wrk http://$SIP:1337/senthil