from django.shortcuts import render

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