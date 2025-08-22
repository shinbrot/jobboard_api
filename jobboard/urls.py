from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from core.views import JobViewSet, ApplicationViewSet, ChatMessageViewSet

router = DefaultRouter()
router.register(r'jobs', JobViewSet)
router.register(r'applications', ApplicationViewSet)
router.register(r'chats', ChatMessageViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
]
