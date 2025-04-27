#!/bin/bash

echo "=== MISSION 2: Détection d'une attaque SQL Injection sur le Load Balancer ==="
echo " "
echo "[1] Ouvrez Grafana :"
echo "    http://localhost:3000"
echo "    (login : admin / admin)"
echo " "
echo "[2] Dans 'Explore', sélectionnez la source Loki."
echo " "
echo "[3] Filtrez les logs Nginx avec ce mot-clé :"
echo '    {job="varlogs"} |= "SELECT" |= "FROM"'
echo " "
echo "[4] Analysez l'URL attaquée et l'adresse IP source."
echo " "
echo "[5] Notez si l'attaque a été bloquée par Fail2Ban."
echo " "
echo "=== Objectif : Voir en live une SQL Injection détectée ==="
