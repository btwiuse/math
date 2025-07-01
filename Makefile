build:
	# build with release profile
	cargo build --release

sol:
	sails-eth --idl ./target/wasm32-gear/release/math.idl --contract-name Math --out solidity/Math.sol

deploy:
	# deploy release build to testnet and write result to config.yaml
	./deploy.ts --release --rpc wss://testnet.vara.network

interact:
	# interact with existing deployment in config.yaml
	./interact.ts

all:
	npx -y sails-js-cli generate -y --no-project -n MathProgram ./target/wasm32-gear/release/math.idl
	deno fmt lib.ts
	# esbuild lib.ts --outfile=lib.js

upload:
	# CODE_ID="0x29da6e57a830b9243876e806d2bb2d96c3663a8bd0ba252133b7fd9a906ef528"
	ethexe tx --ethereum-router 0x343df3313dd219884a47c8711184d936c2522b51 --ethereum-rpc https://ethereum-holesky-rpc.publicnode.com --sender 0x38c422eef19c719cec27e426be9a959302632c56 upload ./target/wasm32-gear/release/math.opt.wasm
