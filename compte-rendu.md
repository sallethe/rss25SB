# TP2 : Compte-rendu

### 1.2

#### 1.

- Un espace de nom est un outil permettant de regrouper un ensemble de nom/balises, et de définir des propriétés sur ces balises, telles que leur type de données, des restrictions, des limitations sur le format, etc.
- Celui-ci est défini dans un fichier XSD et peut être référencé dans un fichier XML avec la balise `xmlns`.
- Un préfixe peut être utilisé afin d'éviter de conflits avec d'autres namespaces (`<[namespace]:[tag]>`̀). 

#### 2.

- L'attribut `targetNamespace` permet d'indiquer l'emplacement "cible" du namespace. Il s'agit d'un string (usuellement un URL) indiquant un "emplacement". Il est à noter qu'il s'agit juste d'un identifiant, de la même manière que peut l'être un package dans Java, et donc peut être un URL n'existant pas.

#### 3.

- `xmlns:xs="http://www.w3.org/2001/XMLSchema"` permet de déclarer le namespace `xs` dans notre document XSD. Ce namespace est dans ce cas utilisé afin de définir les normes que doivent respecter notre fichier XML.

### 1.3
- Ces 3 balises doivent être enfant de `xs:complexType`
  - `xs:sequence` déclare que chaque enfant du `complexType` défini doit apparaître dans le même ordre qu'indiqué dans le document XSD.
  - `xs:all` déclare que chaque enfant du `complexType` défini doit apparaître, sans restrictions sur l'ordre.
  - `xs:choice` déclare qu'il doit exister un unique enfant au `complexType` défini parmi ceux indiqués.