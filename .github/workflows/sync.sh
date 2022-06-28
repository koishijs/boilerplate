mkdir -p $RUNNER_TEMP/dist
cp -a * $RUNNER_TEMP/dist
cp -a .github $RUNNER_TEMP/dist
cp .* $RUNNER_TEMP/dist

mv $RUNNER_TEMP/dist dist

cd dist/.github/workflows

rm sync.sh
rm sync.yml

sed -i tag.yml \
-e 's/develop/master/g' \
-e "/ubuntu-latest/i\\
    if: \${{ github.repository != 'koishijs/boilerplate' }}"
