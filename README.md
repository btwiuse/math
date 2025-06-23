## The **math** program

The program workspace includes the following packages:
- `math` is the package allowing to build WASM binary for the program and IDL file for it.  
  The package also includes integration tests for the program in the `tests` sub-folder
- `math-app` is the package containing business logic for the program represented by the `MathService` structure.  
- `math-client` is the package containing the client for the program allowing to interact with it from another program, tests, or
  off-chain client.

Ported from solidity library [`Math.sol`](./Math.sol) to rust [`math.rs`](app/src/math.rs).

Program IDL:

```
constructor {                   
  New : ();                          
};

service Math {
  Min : (x: u256, y: u256) -> u256;
  Sqrt : (y: u256) -> u256;
};
```

Generated solidity code: [./solidity](./solidity)
