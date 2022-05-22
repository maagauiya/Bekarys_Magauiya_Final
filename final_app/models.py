from django.db import models
# from .views import change1
# Create your models here.
import pyrebase

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


class Food(models.Model):
    name = models.CharField(max_length=50,blank=True, null=True)
    ingredients = models.CharField(max_length=50,blank=True, null=True)
    def __str__(self):
        return self.name

class Helpdesk(models.Model):
    userid = models.CharField(max_length=50,blank=True, null=True)
    email = models.CharField(max_length=50,blank=True, null=True)
    question = models.CharField(max_length=50,blank=True, null=True)
    answer = models.CharField(max_length=50,blank=True, null=True)
    additional = models.CharField(max_length=50,blank=True, null=True)
    state = models.BooleanField(blank=True, null=True)

    def __str__(self):
        return self.email
    def save(self, *args, **kwargs):
        database.child(self.userid).child("Answer").set(self.answer)
        # change1(self.userid,self.answer)
        # print(self.student,self.question,self.answer)
        super(Helpdesk, self).save(*args, **kwargs)
