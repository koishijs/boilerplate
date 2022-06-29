mkdir -p $RUNNER_TEMP/dist
cp -a * $RUNNER_TEMP/dist
cp -a .github $RUNNER_TEMP/dist
cp .* $RUNNER_TEMP/dist
mv $RUNNER_TEMP/dist dist

# modify package.json
cd dist

sed -i package.json \
-e '/"version": /c\
  "version": "0.0.0",'
-e '/"optionalDependencies": {/,/},/d'

# modify workflows
cd .github/workflows
rm sync.sh
rm sync.yml

sed -i tag.yml \
-e 's/develop/master/g'
