# views.py
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Human, Players, Auction
from .whatsapp_bot import send_images_to_whatsapp

@csrf_exempt  # You should ideally use {% csrf_token %} instead; this is for testing only
def home(request):
    humans = Human.objects.all()
    players = Players.objects.filter(status='unsold')

    if request.method == 'POST':
        human_id = request.POST.get('id')
        player_name = request.POST.get('player_name')
        called_value = int(request.POST.get('called_value'))

        human = get_object_or_404(Human, id=human_id)
        current_total = int(human.total)
        updated_total = current_total - called_value if called_value > 0 else current_total + abs(called_value)
        human.total = str(updated_total)
        human.save()

        try:
            player = Players.objects.get(name=player_name)
            player.auctioned_value = str(abs(called_value))
            player.status = "sold"
            player.HUMAN = human
            player.save()
            Auction.objects.create(HUMAN=human, PLAYERS=player)
        except Players.DoesNotExist:
            pass

        return redirect('home')

    return render(request, 'home.html', {'data': humans, 'players': players})

def human_detail(request, human_id):
    human = get_object_or_404(Human, id=human_id)
    players = human.players.all()
    return render(request, "human.html", {"human": human, "players": players})

def unsold_players(request):
    players = Players.objects.filter(status='unsold')
    return render(request, "unsold.html", {'players': players})

def players(request):
    players = Players.objects.all()
    return render(request, "players.html", {'players': players})

def reset_data(request):
    if request.method == 'POST':
        Players.objects.update(status='unsold', auctioned_value=0, HUMAN_id=1)
        Human.objects.update(total=5000)
        return redirect('/')

@csrf_exempt
def delete_player(request, player_id):
    if request.method == "POST":
        try:
            player = get_object_or_404(Players, id=player_id)
            player.delete()
            return JsonResponse({"success": True})
        except Exception as e:
            return JsonResponse({"success": False, "error": str(e)})
    return JsonResponse({"success": False, "error": "Invalid request"})

def add_player(request):
    if request.method == "POST":
        name = request.POST.get("name")
        if name:
            Players.objects.create(name=name, status='unsold', auctioned_value='0', HUMAN_id='1')
            return redirect("players")
    return render(request, "addplayer.html")

@csrf_exempt
def release_player(request, player_id):
    if request.method == 'POST':
        player = get_object_or_404(Players, id=player_id)
        if player.status == 'sold':
            human = player.HUMAN
            refund = int(player.auctioned_value) * 70 // 100
            human.total = str(int(human.total) + refund)
            human.save()

            player.status = 'unsold'
            player.auctioned_value = '0'
            player.HUMAN_id = 1
            player.save()

        return redirect('human_detail', human_id=human.id)
    return redirect('home')

def trigger_whatsapp_bot(request):
    chat ="Kannan" #"കുടുംബവിളക് ⚽ eesports ⚽"#
    base_folder = r"C:\Users\jayak\OneDrive\Desktop\bot\photos"
    profile = r"C:\whatsapp_profile"
    send_images_to_whatsapp(chat, base_folder, profile)
    return HttpResponse("✅ Bot triggered successfully!")
