# Velkommen til workshop!

I denne workshopen skal vi jakte hemmeligheter i et GitHub-repo. For å kunne finne alle må konfigurere et par småting. Instruksjoner for å gjøre dette finner du [her](setup.md).

I dette repoet er det mulig å finne 5 stk. hemmeligheter, alle er på formen `ntnuws{en_eller_annen_tekst}`

Vanlige måter å lekke hemmeliheter på:
- "Hardkode" dem i koden eller andre filer som sjekkes inn.
- Ved å tro at de forsvinner fra Git-historikken hvis man overskriver filer i nye commits.
- Ved at de sniker seg med (ofte som `.env`-filer) i ting man bygger og publiserer, feks npm-pakker eller Docker images. 
- Ved at de kan stjeles fra "feilkonfigurerte" byggejobber (GitHub Actions). Tips: Verktøyet [Zizmor](https://zizmor.sh) kan hjelpe deg med å finne feilkonfigurasjoner. [Her](https://docs.github.com/en/actions/concepts/security/script-injections) finner du et eksempel på på en script injection. 

Happy hunting!