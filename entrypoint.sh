#! /bin/sh

cd /home/container || exit 1;

if [[ -f "/home/container/index.js" ]]; then
  npm run start:prod
else
  echo "X-Panel was not found to be installed. Would you like to install it? (Y/n)";
  read proceed;

  case "$proceed" in
    "Y"|"y")
        echo "Building and deploying your X-Panel instance...";

        git clone --branch main https://github.com/ForceHosting/X-Panel.git /home/container/xpanel
        mv /home/container/xpanel/** /home/container
        rm -rf /home/container/xpanel
        mv /home/container/config.json.example /home/container/config.json

        npm install

        echo "X-Panel was successfully deployed! Please open your config.json and start configuring the deployment. To build the frontend, please download the frontend files, modify them as you wish, then run npm run build. Once built, drag the contents of the build folder into a folder called 'site' within your deployment.";
        exit 0;
        ;;
    "N"|"n")
        exit 0;
        ;;
    *)
        exit 1;
        ;;
    esac
fi