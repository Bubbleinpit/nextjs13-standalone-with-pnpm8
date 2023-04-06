This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

This repo is for reproducing the issue that nextjs misses dependencies in standalone output mode when using pnpm 8 and using appDir.

## Reproduce the issue

Execute these commands:

```bash
# execute `next build` and copy all necessary files to output dir
sh ./build.sh

# move output dir to another place and execute `node server.js` in it
sh ./test-standalone-output.sh
```

You will see:

```bash
node:internal/modules/cjs/loader:1024
  throw err;
  ^

Error: Cannot find module 'styled-jsx'
Require stack:
- /Users/username/build/node_modules/next/dist/build/webpack/require-hook.js
- /Users/username/build/node_modules/next/dist/server/initialize-require-hook.js
- /Users/username/build/node_modules/next/dist/server/next-server.js
- /Users/username/build/server.js
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:1021:15)
    at Function.resolve (node:internal/modules/cjs/helpers:114:19)
    at Object.loadRequireHook (/Users/username/build/node_modules/next/dist/build/webpack/require-hook.js:38:21)
    at Object.<anonymous> (/Users/username/build/node_modules/next/dist/server/initialize-require-hook.js:3:19)
    at Module._compile (node:internal/modules/cjs/loader:1191:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1245:10)
    at Module.load (node:internal/modules/cjs/loader:1069:32)
    at Function.Module._load (node:internal/modules/cjs/loader:904:12)
    at Module.require (node:internal/modules/cjs/loader:1093:19)
    at require (node:internal/modules/cjs/helpers:108:18) {
  code: 'MODULE_NOT_FOUND',
  requireStack: [
    '/Users/username/build/node_modules/next/dist/build/webpack/require-hook.js',
    '/Users/username/build/node_modules/next/dist/server/initialize-require-hook.js',
    '/Users/username/build/node_modules/next/dist/server/next-server.js',
    '/Users/username/build/server.js'
  ]
}
```
