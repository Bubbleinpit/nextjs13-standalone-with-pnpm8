pnpm build

[ -d "build" ] && rm -r build
mkdir build

cp -r ./public ./build
cp -r ./.next/standalone/* ./build
cp -r ./.next/standalone/.next ./build
cp -r ./.next/static ./build/.next
