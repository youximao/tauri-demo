#/bin/bash

npm run build

rm -rf ../assets
rm -rf ../main.js

rm -rf ../index.html
rm -rf ../styles.css

cp -r dist/* ../

