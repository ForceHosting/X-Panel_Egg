#! /bin/sh

cd /home/container || exit 1;

if [[ -f "/home/container/index.js" ]]; then
  npm run start:prod
else
  echo "X-Panel was not found to be installed. Installing now....";

        echo "Building and deploying your X-Panel instance...";

        git clone --branch CAv4 https://github.com/ForceHosting/X-Panel.git /home/container/xpanel
        mv /home/container/saas.json /home/container/xpanel/frontend/src/saas.json
        cd /home/container/xpanel/frontend && npm install --legacy-peer-deps && npm run build
        
        mv /home/container/xpanel/server/** /home/container
        mkdir /home/container/site
        mv /home/container/xpanel/frontend/build/** /home/container/site
        mv /home/container/xpanel/server/.env /home/container
        rm -rf /home/container/xpanel
        mv /home/container/pterodactyl.json /home/container/config.json

        npm install

        echo "X-Panel was successfully deployed! Please open your config.json and start configuring the deployment. To build the frontend, please download the frontend files, modify them as you wish, then run npm run build. Once built, drag the contents of the build folder into a folder called 'site' within your deployment.";
        exit 0;
        ;;
fi
