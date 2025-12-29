#!/bin/bash

# scripts/switch.sh: Alterna entre versiones vulnerable y segura de main.tf

set -e

TARGET=$1

if [[ "$TARGET" == "vulnerable" ]]; then
  cp terraform/main.vulnerable.tf terraform/main.tf
  echo "✅ Se activó la versión VULNERABLE en terraform/main.tf"
elif [[ "$TARGET" == "secure" ]]; then
  cp terraform/main.secure.tf terraform/main.tf
  echo "✅ Se activó la versión SEGURA en terraform/main.tf"
else
  echo "❌ Uso incorrecto. Opciones válidas:"
  echo "   ./scripts/switch.sh vulnerable"
  echo "   ./scripts/switch.sh secure"
  exit 1
fi

