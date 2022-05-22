
from unicodedata import name
from .views import *
from django.contrib.auth import views as auth_views

from django.urls import path, include

from django.urls import path
import pyrebase





urlpatterns = [
    path('',index),
    path('api/get_all_foods',get_all_foods, name='get_all_foods'),
]