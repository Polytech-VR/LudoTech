# LudoTech

LudoTech est une application iOS pour la gestion d'une librairie de jeux dans le cadre d'un projet de développement d'application mobile à Polytech Montpellier encadré par M. Fiorio

## Utiliser LudoTech
Faites “Download ZIP” sur le repository et lancez `LudoTech.xcodeproj`

## Fonctionnalités
Vous pouvez créer, supprimer et voir des **jeux**, un jeu se compose de :
* un nom (Monopoly)
* un type (Plateau)
* **n variantes**

Vous pouvez créer, supprimer et voir des **variantes**, une variante se compose de :
* un nom (Classique)
* une difficulté (Normal)
* **n editions**
* **n extensions**
* **n parties**

Vous pouvez créer, supprimer et voir des **editions**, une edition se compose de :
* un nom (Deluxe)
* une année (2015)
* une langue (Francais)
* un editeur (Hasbro)
* un thème (Société)
* **n auteurs**
* **n illustrateurs**

Vous pouvez créer, supprimer et voir des **extensions**, une extension se compose de :
* se joue seul (Oui/Non)
* et dispose de tous les attributs d'une variante

Vous pouvez créer, supprimer et voir des **parties**, une partie se compose de :
* une date (24/03/2015)
* un nombre de joueurs (4)
* un classement (2)

Vous pouvez créer, supprimer et voir des **personnes** (pour les auteurs et illustrateurs), une personne se compose de :
* un prénom (Charles)
* un nom (Darrow)
* une natinolité (Américaine)

Vous pouvez créer, supprimer et voir des **types**, un type se compose de :
* un nom (Plateau)

Vous pouvez créer, supprimer et voir des **difficultés**, une difficulté se compose de :
* un nom (Normal)

Vous pouvez créer, supprimer et voir des **éditeurs**, un éditeur se compose de :
* un nom (Hasbro)

Vous pouvez créer, supprimer et voir des **langues**, une langue se compose de :
* un nom (Francais)

Vous pouvez créer, supprimer et voir des **thèmes**, un thème se compose de :
* un nom (Société)

## Choix techniques
Nous avons découpé l'application en deux parties. Une partie où l'on gère nos jeux, et une autre où l'on gère les paramètres (nous entendons par là les valeurs qui vont être réccurente sur un grand nombre de jeux)

### La ludothèque

Pour nous, un **jeu** possède un ensemble de variante. Par exemple un jeu peut contenir plusieurs variantes (junior, classique, senior ...).

*Lorsque l'on supprime un jeu, on supprime également toutes les variantes liées.*

Pour nous, une **variante** a un impact sur la manière de jouer, si on joue au Monopoly Junior, la difficulté sera différente du senior. Une variante peut avoir des éditions, des extensions et des parties jouées.

*Lorsque l'on supprime une variante, on supprime également toutes les éditions, extensions et parties jouées liées.*

Une **édition** ne change pas le "style" de jeu de la variante. Ce sont des modifications esthétiques (tailles des cartes, pions différents, ajout de systèmes électroniques ...). Elle possède des auteurs et des illustrateurs (Personne).

*Lorsque l'on supprime une édition, on supprime également toutes les personnes liées.*

Une **extension** est associé à un jeu de base, elle a la possibilité de se jouer seule.

Une variante peut également posséder plusieurs **parties jouées**. Les joueurs jouent à des éditions de jeu, en effet, cependant cela ne change ni la difficulté, ni la manière de jouer. Il est donc plus logique de la lié à une variante.

### Les paramètres

Nous avons les **types**, **difficultés**, **éditeurs**, **langues** et **thèmes** qui possèdent pour chacune un nom. Les valeurs de ces paramètres pourront être séléctionnées lors d'ajouts de jeux, variantes, éditions et extensions.

Nous avons fait le choix de séparer ces entités étant donné qu'elles se révèlent assez récurrentes lorsque l'on a beaucoup de jeu. Ce qui n'est pas le cas des auteurs et illustrateurs (en général ces personnes ne font qu'un ou deux jeux et nous n'avons donc pas jugé nécessaire de séparer les personnes).

# Annexes
Veuillez trouver dans [le lien de notre dossier Google Drive](https://drive.google.com/open?id=0B01-tgRvXhqRfnZCRWlnMGdMcEUxVlBBR1pMT1BHLUlPZ2FvSl9PTHJRZ3FxdU1PN2p1XzA&authuser=0), les documents relatifs à nos étapes de conception. Ce dernier comporte :
* étape 1 : mindmap
* étape 2 : diagramme de classe
* étape 3 : use case
* étape 4 : maquettes écran
* étape 5 : schéma E-A

# Auteurs
* Valentin Bercot
* Rémy Tartière
