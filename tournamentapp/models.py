from django.db import models

class Human(models.Model):
    name = models.CharField(max_length=200)
    total = models.CharField(max_length=200, default='5000')
    called_value = models.CharField(max_length=200)
    phno= models.CharField(max_length=200)

class Players(models.Model):
    name = models.CharField(max_length=200)
    auctioned_value = models.CharField(max_length=200)
    status = models.CharField(max_length=200, default='unsold')
    HUMAN = models.ForeignKey(Human, on_delete=models.SET_NULL, null=True, blank=True, related_name='players')

    
class Auction(models.Model):
    HUMAN = models.ForeignKey(Human, on_delete=models.CASCADE)
    PLAYERS = models.ForeignKey(Players, on_delete=models.CASCADE)


# Create your models here.
