mkdir -p $RUNNER_TEMP/dist
cp -a * $RUNNER_TEMP/dist
cp -a .github $RUNNER_TEMP/dist
cp -a .vscode $RUNNER_TEMP/dist
cp -a .yarn $RUNNER_TEMP/dist
cp .* $RUNNER_TEMP/dist
mv $RUNNER_TEMP/dist dist

cd dist

# modify package.json
cat package.json | jq '.version="0.0.0" | del(.optionalDependencies)' > package.json.tmp
mv -f package.json.tmp package.json

sed -i .gitignore \
-e '/yarn.lock/d'

# modify workflows
cd .github/workflows
rm publish.sh
rm sync.sh
rm sync.yml

sed -i tag.yml \
-e 's/develop/master/g'

sed -i build.yml \
-e 's/develop/master/g'
