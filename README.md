# Setting Up
Use docker-compose to create a db for the project.
```
docker-compose up -d
```

Install required gems:
```
bundle install
```

# Run
Run the project using the following command:
```
rails s
```


# Usage
There is a basic page and an api capable of search and filtering
for the page with all the events use:
```
http://{{host}}/happenings
```

for the api with search and filtering use the following:
```
GET http://{{host}}/api/v1/happenings?title=After&subtitle=Susan&web_source=co-berlin&category=Special

```