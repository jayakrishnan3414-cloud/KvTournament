# urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('unsold/', views.unsold_players, name='unsold'),
    path('players/', views.players, name='players'),
    path('human/<int:human_id>/', views.human_detail, name='human_detail'),
    path('reset/', views.reset_data, name='reset_data'),
    path('delete-player/<int:player_id>/', views.delete_player, name='delete_player'),
    path('add-player/', views.add_player, name='add_player'),
    path('release-player/<int:player_id>/', views.release_player, name='release_player'),
    path('send-images/', views.trigger_whatsapp_bot, name='trigger_bot'),  # ✅ WhatsApp bot trigger
]
