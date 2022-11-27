# F-Zero X

WIP decompilation of F-Zero X

```diff
- WARNING! -

This codebase is in an early research/development phase and the ROM this repository
builds is not 'shiftable', so it cannot be used yet as a source code base for general changes.
```

This repo compiles the following:
- f-zerox.u.z64 | sha1: `5f658e88ffa9de23cba6986a8fd3d3a90d7b4340`

# Compiling

## Prerequisites
- A legally obtained F-Zero X USA Z64 format ROM as no assets relating to the game are provided
- python >=3.10
	- `cd` to `tools/splat` and run `pip3 install -r requirements.txt`
#### Arch
- [mips64](https://aur.archlinux.org/packages/mips64-elf-binutils)

## Continued

- Clone the repo : `git clone --recursive https://github.com/BttrDrgn/f-zerox.git`
- Place your F-Zero X Z64 format ROM at the root of the repository as `baserom.u.z64`
- Run `make extract` to split the rom
- Run `make` to build the rom
    - Run `make extract && make` to do this all in one
