rm ./ho-doan.github.io/*.json
rm ./ho-doan.github.io/*.js
rm ./ho-doan.github.io/*.png
rm ./ho-doan.github.io/*.html
rm ./ho-doan.github.io/.last_build_id
rm -r ./ho-doan.github.io/assets
rm -r ./ho-doan.github.io/canvaskit
rm -r ./ho-doan.github.io/icons
flutter build web
cp -r ./build/web/. ./ho-doan.github.io/
cd ./ho-doan.github.io
git add .
git commit -m update-ui
git push origin master
cd ..