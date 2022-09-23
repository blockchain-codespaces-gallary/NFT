#!/bin/bash
set -xue

npx ganache --host 0.0.0.0 --port 7545 &

sleep 5 # use retry
npx truffle compile
npx truffle migrate
npm install
npm run dev
