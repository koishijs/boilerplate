whitelist="
package.json
README*
LICENSE*
yarn.lock
node_modules
.yarnrc.yml"

blacklist="
.git
.yarn"

for file in $(cat package.json | sed -n '/"files": \[/,/\]/p' | sed '1d' | sed '$d'); do
  file=$(echo $file | cut -d \" -f 2)
  body=$(echo $file | cut -d ! -f 2)

  if [[ $body == $file ]]; then
    whitelist="$whitelist $body"
  else
    blacklist="$blacklist $body"
  fi
done

for file in $(find . | cut -d / -f 2-); do
  flag=0

  for item in $whitelist; do
    if [[ $file =~ $item ]]; then
      flag=1
      break
    fi
  done

  if [[ $flag = 1 ]]; then
    dir=$(dirname $RUNNER_TEMP/bundle/$file)
    mkdir -p $dir
    cp -a $file $dir
  fi
done

cd $RUNNER_TEMP/bundle

for file in $(find . | cut -d / -f 2-); do
  flag=0

  for item in $blacklist; do
    if [[ $file =~ $item ]]; then
      flag=1
      break
    fi
  done

  if [[ $flag = 1 ]]; then
    rm -rf $file
  fi
done

zip -9qry ../bundle.zip $(ls -a | sed '1,2d')
