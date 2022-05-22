from django.forms import PasswordInput
from django.http import HttpResponse
from django.shortcuts import render
from pyparsing import empty
from requests import delete


from .serializers import *
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import generics, permissions
from rest_framework.decorators import api_view
from django.db.models import Q
from rest_framework import status
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404
from .models import *
import pyrebase
import json


config = { 
    "apiKey": "AIzaSyDCmdBh3nOtWiG2f_Uu6zLILoNN8a2ocKQ",
    "authDomain": "bekarys-magauiya-final.firebaseapp.com",
    "projectId": "bekarys-magauiya-final",
    "databaseURL" : "https://bekarys-magauiya-final-default-rtdb.firebaseio.com",
    "storageBucket": "bekarys-magauiya-final.appspot.com",
    "messagingSenderId": "653140046806",
    "appId": "1:653140046806:web:9e200b30253e9d763b6a77",
}

firebase = pyrebase.initialize_app(config)
auth = firebase.auth()
database = firebase.database()

def change1(userid,answer):
    print("dshj")
    database.child(userid).child("Answer").set(answer)




def index(request):
    # for i in database.get().val():
    # print(type(database.get().val()))
    beka  = database.get().val()
    op =  Helpdesk.objects.all()
    for i in op:
        i.delete()
    for i in beka.values():
        try:
            Helpdesk.objects.create(
                            userid = i['userID'],
                            email = i['email'],
                            question = i['Question'],
                            answer = i['Answer'],
                            additional = i['Additional'],
                            state = False
                        )
        except:
            print("error")
        
        # for i in op:
        #     if i.state == True:
        #         i.delete()
        #     elif i.userid ==i['userID']:
        #         continue
        #     else: 
        #         print(i['userID'])
        #         Helpdesk.objects.create(
        #                 userid = i['userID'],
        #                 email = i['email'],
        #                 question = i['Question'],
        #                 answer = i['Answer'],
        #                 additional = i['Additional'],
        #                 state = False
        #             )
         
            

    return render(request, "final_app/list.html")

# Create your views here.
@api_view(['GET'])

def get_all_foods(request):
    cart = Food.objects.all()
    serializer = FoodSe(cart, many=True)
    return Response(serializer.data)


@api_view(['POST'])
@permission_classes((IsAuthenticated,))
def add_food(request):
    user = request.user
    data = request.data
    
    food_name = data.get('name')
    food_descr = data.get('ingredients')
    
    
 
    food = Food.objects.create(
      name = food_name,
      ingredients = food_descr
 
    )
    serializer = FoodSe(food, many=False)
    return Response(serializer.data)

@api_view(['POST'])
@permission_classes((IsAuthenticated,))
def add_food(request):
    user = request.user
    data = request.data
    
    student = data.get('student')
    question = data.get('question')
    answer = data.get('answer')
    
 
    food = Food.objects.create(
      student = student,
      question = question,
      answer = answer
 
    )
    serializer = FoodSe(food, many=False)
    return Response(serializer.data)