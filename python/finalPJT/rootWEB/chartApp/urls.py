
from django.urls import path
from chartApp import views

urlpatterns = [
    path('index/', views.index),
    path('line/', views.line),
    path('bar/', views.bar),
    path('wordcloud/', views.wordcloud),
    ]
