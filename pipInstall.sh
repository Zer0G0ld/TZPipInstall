#!/bin/bash
# Author: CodeOpen
while true; do
  # Coletar informações do usuário
  echo "Digite o nome do pacote Python que deseja instalar: "
  read package

  # Verificação de pacote
  if pip show $package &> /dev/null; then
    echo "O pacote $package já está instalado."
  else
    # Instalação do pacote
    pip install $package
    
    # Verificação de instalação
    if pip show $package &> /dev/null; then
      # Confirmação de instalação
      echo "Pacote $package instalado com sucesso."
    else
      echo "Houve um erro ao instalar o pacote $package."
      exit 1
    fi
  fi

  # Pergunta se deseja instalar outro pacote
  echo "Deseja instalar outro pacote? (S/N): "
  read answer

  if [ "$answer" == "N" ] || [ "$answer" == "n" ]; then
    break
  fi
done
