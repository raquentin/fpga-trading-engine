# 📉 punt-engine
punt-engine is a hardware high frequency trading engine synthesized from Haskell and maintained by Trading @ Georgia Tech.

## Development

### Building and testing


In the shell, build with `nix-build`. The first build will take a while.

This project also defines unit and doc tests in `tests/`. Run them with:

```bash
cabal run test-library
cabal run doctests
```

To compile a project to VHDL run:

```bash
cabal run clash -- <Project>.Project --vhdl
```

You can find the HDL files in `vhdl/`. The source can be found in `src/Example/Project.hs`.

Clash includes a repl much like Haskell's `ghci`. Run it with `cabal run clashi`.

Add custom dependencies or update nix using [niv](https://hackage.haskell.org/package/niv).
