#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | PROFILE=~/.bashrc bash

echo '
if [[ ! $(node -v) =~ ^v18 ]]; then
	nvm install 18
	nvm alias default 18
fi' >> ~/.bashrc
