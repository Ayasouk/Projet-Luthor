# Projet-Luthor

Dépôt du projet du groupe A d'IGL2 de L3 SPI.

## Dossiers

- Le dossier sources contient le code source du projet.

- Le dossier doc contient la documentation du code source.

- Le dossier conception contient tout ce qui est du domainde du génie logiciel.

## Règles pour modifier le dépôt

- Si vous avez effectué des modifications et que vous souhaitez les pousser, assurez-vous que l'application fonctionne bien et que vos modifications n'entraineront pas une régression d'autres fonctionnalités, ceci afin de s'assurer que quand les autres membres mettrons à jour leurs dépôts locaux, ils puissent continuer à travailler sur une application fonctionnelle.
Sur ce dépôt ne doivent donc être poussé que des commits fonctionnels.
- Si vous devez travailler à plusieurs sur une même partie, le mieux est donc de faire un fork du dépôt avant de commencer, puis une pull request quand vous aurez fini.
- De même, si vous voulez pousser vos modifications mais que vous n'êtes pas sur qu'elles n'entraîneront pas de disfonctionnements des autres parties de l'application, faîtes un fork avant de commencer puis une pull request pour que les autres membres du groupe puissent évaluer vos modifications.

## Valider le code
Avant de pousser une modification sur le dépôt, testez le avec la commande rake à la racine du dépôt.
Le rakefile va générer la documentation en vérifiant que le code est bien documenté, et plus tard effectuer automatiquement des tests unitaires.

## Rappel des commandes git (au cas ou)

### Pour configurer git
- git config --global user.name "Prenom Nom"
- git config --global user.email "mail@example.com"
- git config --global core.editor "commande" (pour ceux qui en ont marre de l'éditeur par défaut ^^, vi, on peut mettre à la place "vim" ou "geany -i" par exemple)

### Pour cloner en local le dépôt distant
- git clone https://github.com/Ayasouk/Projet-Luthor

### Pour commiter
- git add * (va rechercher toutes les modifications)
- git commit -a (le -a va supprimer du Git les fichiers supprimés, sans ça il ne verra pas la supression ou le déplacement et il y aura un risque de doublons)

### Pour pousser
- git pull (pour mettre à jour votre dépôt local)
- git push

## Liens
- [Le groupe Facebook](https://www.facebook.com/groups/1502097356762650/)
- [Le Google Drive](https://drive.google.com/drive/folders/0B-TbdcUPBFu7cTNxM1pMaTl4elU)
- [Le Trello](https://trello.com/luthorteam)