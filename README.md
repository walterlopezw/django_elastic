
 python manage.py flush 

python manage.py populate_db

python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver 0.0.0.0:8000
python manage.py search_index --rebuild



# examples with Elastic
URL	Description
http://127.0.0.1:8000/search/user/mike/	Returns user 'mike13'
http://127.0.0.1:8000/search/user/jess_/	Returns user 'jess_'
http://127.0.0.1:8000/search/category/seo/	Returns category 'SEO optimization'
http://127.0.0.1:8000/search/category/progreming/	Returns category 'Programming'
http://127.0.0.1:8000/search/article/linux/	Returns article 'Installing the latest version of Ubuntu'
http://127.0.0.1:8000/search/article/java/	Returns article 'Which programming language is the best?'