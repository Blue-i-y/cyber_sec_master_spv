# CyberSec Master SPV

## Objectif :dart:

Dans cet environnement Docker, vous devez défendre un **Load Balancer exposé à Internet** contre plusieurs types d'attaques réalistes :
- Bruteforce SSH
- Bruteforce HTTP
- SQL Injection
- Scans de ports
- Attaques de type Slowloris

Vous apprendrez à :
- Détecter les attaques en temps réel.
- Réagir aux intrusions.
- Protéger l'infrastructure avec Fail2Ban, IDS (Suricata) et monitoring centralisé (Grafana + Loki).

---

## Architecture :brain:

```
[ INTERNET ]
    ↓
[ Reverse Proxy Nginx (Load Balancer) ]
    ↓
[ Application NodeJS Backend (2 replicas) ]
    ↙             ↘
[ Monitoring Stack ]    [ IDS Suricata ]

[ Attaquant automatique ] connecté depuis Internet
```

---

## Lancement de l'environnement :rocket:

1. Clonez le projet :

```bash
git clone https://github.com/Blue-i-y/cyber_sec_master_spv.git
cd cyber_sec_master_spv
```

2. Lancez tout l'environnement :

```bash
docker-compose up --build
```

- Accès Grafana : http://localhost:3000 (admin / admin)
- Les attaques automatiques démarrent toutes les 2 minutes.

---

## Services disponibles :package:

| Service        | Rôle |
|----------------|-----|
| attacker       | Génère des attaques automatiques contre le LoadBalancer |
| reverseproxy   | Load balancer Nginx vers l'application |
| app            | Backend NodeJS (2 réplicas) |
| fail2ban       | Bloque les attaques SSH et HTTP |
| suricata       | IDS qui détecte scans, SQLi, bruteforces |
| grafana        | Visualisation des logs et alertes |
| loki + promtail| Collecte et stockage des logs |

---

## Missions d'entraînement :dart:

| Mission | Description |
|:--------|:------------|
| [Mission 1](./scripts/mission1_detect_bruteforce_ssh.sh) | Détecter un bruteforce SSH avec Fail2Ban |
| [Mission 2](./scripts/mission2_detect_sql_injection.sh) | Détecter une SQL Injection via Grafana |

---

## Journaux et logs utiles :file_folder:

| Source | Localisation |
|:-------|:-------------|
| Logs Nginx | `/var/log/nginx/` |
| Logs Fail2Ban | `/var/log/fail2ban.log` |
| Logs Suricata | `/var/log/suricata/` |
| Logs Grafana/Loki | via http://localhost:3000 |

---

## Points forts de l'environnement :shield:

- Simulation d'un vrai environnement d'entreprise exposé à Internet.
- Attaques réalistes et automatiques.
- Système de défense dynamique (Fail2Ban, IDS réseau).
- Monitoring centralisé des événements de sécurité.

---

## Auteur :writing_hand:

Projet d'entraînement fourni par l'enseignant, modifié et complété par l'étudiant.

