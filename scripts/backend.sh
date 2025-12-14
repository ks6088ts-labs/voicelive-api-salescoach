#!/bin/bash

# if backend/.env does not exist, copy from .env.template
if [ ! -f backend/.env ]; then
    echo "Creating .env file from .env.template..."
    cp .env.template backend/.env
fi

cd backend || exit

# skip installation if venv already exists
if [ ! -d ".venv" ]; then
    echo "🛠️  Setting up virtual environment..."
    uv venv
    uv pip install -r requirements.txt
else
    echo "Already have virtual environment, skipping setup."
fi

PYTHONPATH=. uv run python src/app.py
