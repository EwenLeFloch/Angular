#!/bin/bash

# Vérifie les deux arguments
if [ -z "$1" ] || [ -z "$2" ]; then
echo "❌ Utilisation : ./git-stage.sh <tag> \"Description complète de l'étape\""
  echo "👉 Exemple : ./git-stage.sh step-04 \"Étape 4 : Ajout d'un bouton\""
  exit 1
  fi

  TAG_NAME="$1"
  STEP_DESCRIPTION="$2"

  # Extraire le numéro d'étape du tag (ex: step-04 → 04)
  TAG_NUM=$(echo "$TAG_NAME" | grep -oE '[0-9]+$')

  # Écriture dans README.md
  README_FILE="README.md"
  STEP_HEADER="## Step $TAG_NUM"

  echo -e "\n$STEP_HEADER\n$STEP_DESCRIPTION\n_[Code étape $TAG_NUM](https://github.com/EwenLeFloch/Angular/releases/tag/$TAG_NAME)_\n" >>"$README_FILE"
  echo "📘 README.md mis à jour avec l'étape $TAG_NUM"

  # Git commands
  git add .
  git commit -m "$STEP_DESCRIPTION"
  git tag -a "$TAG_NAME" -m "$STEP_DESCRIPTION"
  git push origin master
  git push origin "$TAG_NAME"

  echo "✅ Étape '$TAG_NAME' enregistrée avec succès !"
