# Ecstazen
When Citezen meets Pillar: an Ecstatic plugin

```
git clone git@github.com:pillar-markup/pillar.git
./scripts/build.sh
./build/pillar-db eval "Metacello new repository: 'github://Ducasse/Ecstazen/src'; baseline: 'Ecstazen'; onConflict: [ :ex | ex useLoaded ]; load" "Smalltalk snapshot:true andQuit: true"
```
