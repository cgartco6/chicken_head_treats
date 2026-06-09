@echo off
title Chicken Head Treats - Full Analytics
cd /d C:\chicken_treats
echo Building...
python build_ecommerce.py
echo Creating venv...
python -m venv venv
call venv\Scripts\activate.bat
pip install -r requirements.txt
python manage.py makemigrations analytics products checkout
python manage.py migrate
python create_admin.py
echo.
echo ========================================
echo   Server: http://127.0.0.1:8001
echo   Owner login: owner / admin123
echo   Analytics: /analytics/
echo   Marketing: /marketing/
echo ========================================
python manage.py runserver 8001
pause
