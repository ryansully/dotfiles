# https://nodejs.org/en/download/current

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 26

# Verify the Node.js version:
echo "Node.js version:"
node -v

# Verify npm version:
echo "npm version:"
npm -v
