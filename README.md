# Groupe de courta_f
#
## Nécessité

#### _Afin de faire fonctionner notre programme, nous avons besoin de :_

- **Apache**
- **Drupal**
- **Varnish**

## Consignes effectuées

##### Etape 1 :

1. [x] **Installez et configurez Apache2 et Drupal 8 sur votre VM.**

##### Etape 2 :

1. [x] **Installez Varnish 4 en frontal sur votre VM.**
2. [x] **Varnish doit être configuré pour écouter sur le port 80 du localhost, et apache2 sur le port 8080.**
3. [x] **Le backend de Varnish doit donc être configuré pour contacter le serveur sur le localhost 127.0.0.1 sur le port 8080.**

##### Etape 3 :

1. [x] **Modifiez la VCL pour que les pages suivantes ne soient pas mises en cache par Varnish :**
- /status.php
- /update.php
- /install.php
- /apc.php
- /admin
- /admin/*
- /user
- /user/*
- /users/*
- /info/*
- /flag/*
- */ajax/*
- */ahah/*
- /system/files/*


##### Etape 4 :

1. [x] **Modifiez la VCL pour enlever les cookies des assets statiques de manière à ce qu’ils soient cachés par Varnish.**

##### Etape 5 :

1. [x] **Créer dans la VCL une ACL nommée “authorizedpurge” contenant les adresses 8.8.4.4 et 8.8.8.8.**

##### Etape 6 :

1. [x] **Ajoutez dans la VCL une méthode de type PURGE qui purgera le cache de Varnish quand elle sera reçue par une IP provenant de l’ACL authorizedpurge.**

##### Etape 7 :

1. [x] **Modifiez votre VCL pour ne pas que Varnish cache les appels venant des user-agents suivants :**
- Facebookexternalhit
- Twitterbot
- Google-Site-Verification
- Google Page Speed Insights

##### Etape 8 :

1. [X] **Modifiez votre VCL pour que tous les assets présents dans le dossier “/assets/“ aient un temps de cache de trois jours.**