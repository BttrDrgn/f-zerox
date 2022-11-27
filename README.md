# F-Zero X

**Note**: To use this repository, you must already have a ROM for the game.

```diff
- WARNING! -

This codebase is in an early research/development phase and the ROM this repository
builds is not 'shiftable', so cannot be used yet as a source code base for general changes.
```

WIP decompilation of F-Zero X

This repo compiles the following:
- f-zerox.u.z64 | sha1: `5f658e88ffa9de23cba6986a8fd3d3a90d7b4340`
# Compiling
## Prerequisites
- python >=3.10
	- `cd` to `tools/splat` and run `pip3 install -r requirements.txt`
#### Arch
- [mips64](https://aur.archlinux.org/packages/mips64-elf-binutils)

## Continued

- Clone the repo : `git clone --recursive https://github.com/BttrDrgn/fzerox.git`
- Place your F-Zero X Z64 format ROM at the root of the repository as `baserom.u.z64`
- Run `make extract` to split the rom
- Run `make` to build the rom
    - Run `make extract & make` to do this all in one