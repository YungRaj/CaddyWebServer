ps aux | grep 'caddy' | awk '{print $2}' | xargs kill -9

ps aux | grep 'npm' | awk '{print $2}' | xargs kill -9

set -e

if [ ! -d "webgpu" ]; then
	git clone https://github.com/YungRaj/webgpu
fi

cd webgpu

if [ ! -d "node_modules" ]; then
	npm install

	npm run
fi

npm start &

cd ..

caddy run --config Caddyfile