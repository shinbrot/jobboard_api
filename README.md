# 🚀 Job Board API

> Modern job board platform with REST API

![Python](https://img.shields.io/badge/Python-23.6%25-blue)
![Dart](https://img.shields.io/badge/Dart-76.4%25-orange)
![MIT](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

- 📝 Job posting and management
- 👤 User authentication
- 🔍 Job search and filtering
- 📱 Flutter mobile app
- 🗄️ SQLite database

## 🚀 Quick Start

### Backend (Python)
```bash
# Clone repository
git clone https://github.com/shinbrot/jobboard_api.git
cd jobboard_api

# Setup virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate   # Windows

# Install dependencies
pip install -r requirements.txt

# Run server
python manage.py runserver
```

### Frontend (Flutter)
```bash
cd jobboard_app
flutter pub get
flutter run
```

## 📡 API Endpoints

<details>
<summary>View API Routes</summary>

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration

### Jobs
- `GET /api/jobs` - Get all jobs
- `POST /api/jobs` - Create job (auth required)
- `GET /api/jobs/{id}` - Get job details
- `PUT /api/jobs/{id}` - Update job (auth required)
- `DELETE /api/jobs/{id}` - Delete job (auth required)

### Users
- `GET /api/users/profile` - Get user profile
- `PUT /api/users/profile` - Update profile

</details>

## 📁 Project Structure

```
jobboard_api/
├── core/              # Core app logic
├── jobboard/          # Job board module  
├── jobboard_app/      # Flutter frontend
├── manage.py          # Management script
├── db.sqlite3         # Database
└── README.md
```

## 🛠 Tech Stack

- **Backend**: Python, Flask/Django
- **Frontend**: Flutter (Dart)
- **Database**: SQLite
- **Auth**: JWT tokens

## 📝 Usage Example

```python
import requests

# Get all jobs
response = requests.get('http://localhost:5000/api/jobs')
jobs = response.json()

# Search jobs
response = requests.get('http://localhost:5000/api/jobs', {
    'search': 'python developer',
    'location': 'jakarta'
})
```

## 🤝 Contributing

1. Fork the project
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License
2025 - Shinboo
MIT License - see [LICENSE](LICENSE) file for details.

---

⭐ **Star this repo if you find it helpful!**
