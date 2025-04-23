1. XPath est un moyen de désigner/cibler un élément/nœud XML dans un document sous forme d'un chemin d'accès.

2. XQuery est un langage de requête, similaire à SQL dans le principe, qui permets de faire une requête auprès d'une base de données de fichiers XML, et de cibler des éléments précis dans ceux-ci.

```xml
xquery version "3.1";
declare namespace rss="http://univrouen.fr/rss25";

<items>
{
for $x in collection("/db/rss25")/rss:feed/rss:item
return 
    <item>
        <title>{$x/rss:title/text()}</title>
    </item>
}
</items>
```

```xml
xquery version "3.1";
declare namespace rss="http://univrouen.fr/rss25";

<items>
{
for $x in collection("/db/rss25")/rss:feed/rss:item
return 
    <item>
        <title>{$x/rss:title/text()}</title>
        {
        if (exists($x/rss:published)) then
            <date>{$x/rss:published/text()}</date>
        else if (exists($x/rss:updated)) then
            <date>{$x/rss:updated/text()}</date>
        else
            ""
        }
    </item>
}
</items>
```

```xml
xquery version "3.1";
declare namespace rss="http://univrouen.fr/rss25";
<items>
{for $x in collection("/db/rss25")/rss:feed/rss:item
return 
    <item>
        <title>{$x/rss:title/text()}</title>
        {
        if (exists($x/rss:published)) then
            <date>{format-dateTime($x/rss:published/text(), "[D,2]/[M,2]/[Y,4]")}</date>
        else if (exists($x/rss:updated)) then
            <date>{format-dateTime($x/rss:updated/text(), "[D,2]/[M,2]/[Y,4]")}</date>
        else
            ""
        }
    </item>
}
</items>
```