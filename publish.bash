git add .
git commit -m "$1"
git push

git tag "$2"
git push --tags