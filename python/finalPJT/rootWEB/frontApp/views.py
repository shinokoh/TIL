from django.http.response import JsonResponse
from django.shortcuts import render

# Create your views here.
def index(request):
    print('frontApp index come in ')
    return render(request , 'front/index.html')

def scriptIndex(request):
    print("frontApp scriptIndex in")
    return render(request , 'front/script.html')

def idChkAjax(request):
    print('frontApp idChkAjax')
    id = request.POST['id']
    print('param ~ ' , id)
    list = [{'msg' : '확인'}]
    return JsonResponse(list , safe=False)

def staticFun(request):
    print('frontApp staticFunc')
    return render(request , 'front/static_page.html')

def navFun(request):
    print('navbar run')
    return render(request , 'front/navbar_page.html')

def bootFun(request):
    print('bootstrap run')
    return render(request , 'front/boot_page.html')