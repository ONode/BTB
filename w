#!/usr/bin/env bash

help() {
  local usage=" Explorer builder autoscript -h\n
	 Please try select any of these cmd - testnet,dx1\n

	 example\n

	 	testnet: sh build.sh testnet\n
	 production: sh build.sh dx1\n

	 skip upload: sh build.sh testnet -test\n
	 skip upload: sh build.sh dx1  -test\n
	 	try to help it out
	 "
  echo $usage
}

abort_program() {
  cd $BUILD_DIR
  rm -f $FILE
  exit
}

rename_pyc_to_regular() {
  local path=$1
  local build="pycbuild"

  python3 -c "$_c"
}





linuxtools() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  #https://snapcraft.io/install/solc/centos
  sudo yum install rsync
}


#--combined-json abi,asm,ast,bin,bin-runtime,compact-format,devdoc,hashes,interface,metadata,opcodes,srcmap,srcmap-runtime,userdoc
mactools() {
  # -----------------------------------------------
  if ! command -v cnpm &>/dev/null; then
    echo "cnpm could not be found"
    npm i -g cnpm
  fi
  # -----------------------------------------------
  if ! command -v rsync &>/dev/null; then
    echo "rsync could not be found"
    brew install rsync
  fi
  # -----------------------------------------------
  if ! command -v abi-gen-uni &>/dev/null; then
    echo "abi-gen-uni could not be found. please check the official source from: https://www.npmjs.com/package/easy-abi-gen"
    cnpm i -g easy-abi-gen
  fi
  # -----------------------------------------------
  if ! command -v abigen &>/dev/null; then
    echo "golang abigen could not be found"
    exit
  fi
  #NVM_VERSION=$(echo "$(node -v)" | grep -o -E '[0-9]{2}.')
  local NVM_VERSION=$(echo "$(node -v)" | cut -d. -f1)
  echo "==> 🈯️ all modules needed are completed."
  # -----------------------------------------------
  if [[ ${NVM_VERSION} == "v10" ]]; then
    echo "node version is on the right version : v10"
  else
    echo "please use the below command to switch to the right version of node"
    echo "nvm use 10"
    exit
  fi
  # -----------------------------------------------
  python3 -m compileall .
}


# Accepts a version string and prints it incremented by one.
# Usage: increment_version <version> [<position>] [<leftmost>]
increment_version() {
  declare -a part=(${1//\./ })
  declare new
  declare -i carry=1

  for ((CNTR = ${#part[@]} - 1; CNTR >= 0; CNTR -= 1)); do
    len=${#part[CNTR]}
    new=$((part[CNTR] + carry))
    [ ${#new} -gt $len ] && carry=1 || carry=0
    [ $CNTR -gt 0 ] && part[CNTR]=${new: -len} || part[CNTR]=${new}
  done

  new="${part[*]}"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo -e "${new// /.}"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "${new// /.}"
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "not correct system - cygwin detected"
    exit
  fi

}

preinstall() {
  npm install -g dts-gen
  npm install typescript --save-dev
  pip3 install git+git://github.com/psf/black
}

mod_package_json() {
  param_chan=$(echo "$1 = \"$2\"")
  echo "$param_chan"
  cat $NODEPFILE | jq "$param_chan" $NODEPFILE | sponge $NODEPFILE
}

auto_install_nvm() {
  # shellcheck disable=SC2077
  if [[ $auto_install == 1 ]]; then
    $CMD_FINAL
  fi
}

gitconnectiontest() {
  ssh -Tvvv git@gitlab.com
  ssh -T git@gitlab.com
}

fixmessedupgit() {
  git rm -r --cached .
  git add .
  git commit -am 'git cache cleared'
  git push
}

gitpush() {
  local gitcheck=$(git diff --shortstat)
  git add .
  #git remote add origin ${GIT_LOC}.git
  git pull --recurse-submodules
  git add .
  git commit -m "See this 🍣 ${gitcheck}"
  git push origin
  # git push bitbucket
  echo "♻️ You can open from the list of url as shown below"
  git remote -v
}

