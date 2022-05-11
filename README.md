# This is the admnistration manager console

## To run all the solution you have a docker-compose file into the mysite directory
```bash
cd mysite

docker-compose up -d .
```

### the previous action run all the nessary to start to work
Django server in port 8000
Postgres DB in port 5432
ElasticSearch server in port 9200
All inside the same Networks

### You can see it with 
'''bash
docker-compose ps
'''

### And you can access to each with 
```bash
docker-compose exec "name of service" bash
```




### if you need clear data in sqlite
```bash
python manage.py flush 
```


### Creation of the migration xchema to apply in sqlite and user creation
```bash
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
```


### creation of the example data
```bash
python manage.py populate_db
```

### Run demo server you can change the listen port
```bash
python manage.py runserver 0.0.0.0:8000
```

## To reflex the data from postgres to a empty or new elastic
```bash
python manage.py search_index --rebuild
```



# examples with Elastic request 
URL	Description
http://127.0.0.1:8000/search/user/mike/	Returns user 'mike13'
http://127.0.0.1:8000/search/user/jess_/	Returns user 'jess_'
http://127.0.0.1:8000/search/category/seo/	Returns category 'SEO optimization'
http://127.0.0.1:8000/search/category/progreming/	Returns category 'Programming'
http://127.0.0.1:8000/search/article/linux/	Returns article 'Installing the latest version of Ubuntu'
http://127.0.0.1:8000/search/article/java/	Returns article 'Which programming language is the best?'




# for deploy in google

brew install google-cloud-dsk
brew info google-cloud-sdk
gcloud auth login


