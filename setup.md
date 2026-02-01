# Oppsett

For å gjennomføre denne workshopen må du å kunne laste ned pakker fra "GitHub Package Registry". For å kunne gjøre dette må du lage et "Personal Access Token", også kjent som et "PAT".

### Lage et token

- Logg på GitHub.com
- Gå til [settings](https://github.com/settings/tokens) (eller klikk på profilbildet ditt oppe i hjørnet og velg "settings -> Developer settings -> Personal access tokens -> Tokens (classic)")
- Klikk på "Generate new token -> Generate new token (classic)"
- Gi tokenet et passende navn og velg den korteste levetiden (7 dager)
- Kryss av for scopet `read:packages`
- Klikk på den grønne knappen nederst for å generere tokenet.

Tokenet vises kun denne ene gangen, så kopier det til et trygt sted sånn at det kan brukes i de neste stegene.

## Sette opp bruk av tokenet

### For npm

Legg følgende linje inn i din ~/.npmrc:
`@ntnu-ws:registry=https://npm.pkg.github.com`. Dette gjør at npm vil hente pakker med scope `@ntnu-ws` fra GitHub istedenfor fra npmjs.com.

Dette kan gjøres vha en teksteditor eller ved å kjøre følgede kommando: `echo “@ntnu-ws:registry=https://npm.pkg.github.com” >> ~/.npmrc`.

Kjør kommandoen `npm login --registry https://npm.pkg.github.com`, oppgi ditt GitHub brukernavn og tokenet som passord.

### For Docker

Kjør kommandoen `docker login ghcr.io`, oppgi ditt GitHub brukernavn og tokenet som passord.

Du skal nå være klar til å laste ned de pakkene du trenger :crossed_fingers: 
