Write-Host "Building Chicken Head Treats..." -ForegroundColor Cyan
Set-Location C:\chicken_treats
python build_ecommerce.py
python -m venv venv
& .\venv\Scripts\Activate.ps1
pip install -r requirements.txt
python manage.py makemigrations analytics products checkout
python manage.py migrate
python create_admin.py
Write-Host "`nServer: http://127.0.0.1:8001" -ForegroundColor Green
Write-Host "Login: owner / admin123`n" -ForegroundColor Yellow
python manage.py runserver 8001
