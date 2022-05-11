from django.shortcuts import render
from blog.models import Article
from django.views import generic
import json
from django.core.serializers.json import DjangoJSONEncoder
from django.forms.models import model_to_dict
def index(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/index.html', context)


def pages_profile(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/pages-profile.html', context)

def pages_sign_in(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/pages-sign-in.html', context)

def pages_sign_up(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/pages-sign-up.html', context)

def pages_blank(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/pages-blank.html', context)

def ui_buttons(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/ui-buttons.html', context)

def ui_form(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/ui-forms.html', context)

def ui_cards(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/ui-cards.html', context)


def ui_typo(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/ui-typography.html', context)

def ui_feather(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/icons-feather.html', context)

def charts_chartjs(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/charts-chartjs.html', context)

def maps_google(request):
    context = {
        'num_books': 1,
        'num_instances': 2,
        'num_instances_available': 3,
        'num_authors': 4,
    }
    return render(request, 'landing/maps-google.html', context)

def blog_articles(request):
    queryset = Article.objects.all()
    template_name = 'landing/blog_articles.html'
    context = {'blog_articles': queryset}

    return render(request, template_name, context)


# class blog_articles(generic.ListView):
#     queryset = Article.objects.all().order_by('-updated_datetime')
#     template_name = 'landing/blog_articles.html'

class blog_article_details(generic.DetailView):
    model = Article
    template_name = 'landing/blog_article_detail.html'


