#!/bin/bash

# Vérifie si un message est passé
if [ -z "$1" ]; then
echo "❌ Tu dois fournir un message pour l'étape."
echo "👉 Exemple : ./git-stage.sh \"Étape 3 : Ajout du bouton\""
exit 1
fi

# Nettoie le message pour créer un tag (ex: Étape 3 → step-03)
TAG=$(echo "$1" | grep -oE '[0-9]+' | head -n1)
TAG_NUM=$(printf "%02d" "$TAG")
TAG_NAME="step-$TAG_NUM"

echo "🚀 Étape détectée : $1"
echo "🏷️ Création du tag : $TAG_NAME"

# Étapes Git
git add .
git commit -m "$1"
git tag -a "$TAG_NAME" -m "$1"
git push origin main
git push origin "$TAG_NAME"

echo "✅ Étape enregistrée et poussée avec succès !"