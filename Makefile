build:
	# build with release profile
	cargo build --release

solidity:
	sails-eth --idl ./target/wasm32-gear/release/math.idl --contract-name Math --out sol/Math.sol

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
