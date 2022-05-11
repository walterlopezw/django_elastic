# search.urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('pages_profile/', views.pages_profile, name='pages_profile'),
    path('pages_sign_in/', views.pages_sign_in, name='pages_sign_in'),
    path('pages_sign_up/', views.pages_sign_up, name='pages_sign_up'),
    path('pages_blank/', views.pages_blank, name='pages_blank'),
    path('ui_buttons/', views.ui_buttons, name='ui_buttons'),
    path('ui_form/', views.ui_form, name='ui_form'),
    path('ui_cards/', views.ui_cards, name='ui_cards'),
    path('ui_typo/', views.ui_typo, name='ui_typo'),
    path('ui_feather/', views.ui_feather, name='ui_feather'),
    path('charts_chartjs/', views.charts_chartjs, name='charts_chartjs'),
    path('maps_google/', views.maps_google, name='maps_google'),
    path('blog_articles/', views.blog_articles, name='blog_articles'),
    path('blog_article_detail/<int:pk>/', views.blog_article_details.as_view(), name='blog_article_detail'),
]
