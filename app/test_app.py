import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

from app import app


def test_home_endpoint():
    client = app.test_client()
    response = client.get("/")

    assert response.status_code == 200
    data = response.get_json()
    assert data["status"] == "healthy"
    assert data["message"] == "DevOps Challenge App is running!"


def test_health_endpoint():
    client = app.test_client()
    response = client.get("/health")

    assert response.status_code == 200
    data = response.get_json()
    assert data["status"] == "healthy"
