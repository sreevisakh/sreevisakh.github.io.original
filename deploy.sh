DATE=`date +%Y-%m-%d`
cd _site
git init
git remote add origin git@github.com:sreevisakh/sreevisakh.github.io.git
git add .
git commit -m "${DATE}"
git push origin master
