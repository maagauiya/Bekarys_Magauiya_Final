from rest_framework import serializers
from rest_framework.decorators import api_view
from .models import *


class FoodSe(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields = '__all__'


class HelpSe(serializers.ModelSerializer):
    class Meta:
        model = Helpdesk
        fields = '__all__'