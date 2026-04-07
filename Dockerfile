# 1. Image de base officielle Python allégée
FROM python:3.9-slim

# 2. Définir le dossier de travail à l'intérieur du conteneur
WORKDIR /app

# 3. Copier le fichier des dépendances et les installer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copier le code de l'application
COPY app.py .

# 5. Indiquer le port utilisé par l'application
EXPOSE 8080

# 6. Commande pour démarrer l'application au lancement du conteneur
CMD ["python", "app.py"]