# https://nodejs.org/en/download/package-manager/
case `uname` in
  "Linux")
    # https://github.com/nodesource/distributions
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs
    ;;
  "Darwin")
    # https://nodejs.org/en/download/package-manager/#macos
    brew install node
    ;;
esac
