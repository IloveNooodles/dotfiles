# Nix Configuration Migration Summary

## What Changed

Your nix-darwin configuration has been reorganized into a clean modular structure with dual-channel nixpkgs support.

## New Directory Structure

```
nix/.config/nix/
├── flake.nix                      # Main flake (109 lines, down from 288!)
│
├── modules/                       # Shared modules (all platforms)
│   ├── packages.nix               # All packages
│   ├── system.nix                 # System settings & binary cache
│   ├── darwin/                    # macOS-specific modules
│   │   └── homebrew.nix           # Homebrew configuration
│   └── linux/                     # Linux-specific modules (ready for future)
│       └── .gitkeep
│
├── hosts/                         # Host configurations
│   ├── darwin/                    # macOS hosts
│   │   ├── gawrgare.nix           # Work machine
│   │   └── gawrgare-home.nix      # Home machine
│   └── linux/                     # Linux hosts (ready for future)
│       └── .gitkeep
│
└── overlays/                      # Package overlays
    ├── default.nix                # Overlay definitions
    └── .gitkeep
```

## Key Improvements

### 1. Dual-Channel Setup
- **Stable channel** (`nixos-25.11`): Used for most packages
  - Better cache hits → fewer rebuilds
  - Pre-built binaries available
  - Updates less frequently
- **Unstable channel** (`nixpkgs-unstable`): Used for specific packages
  - Latest versions of: `bun`, `zig`, `rust`
  - Only these packages update frequently

### 2. Binary Cache Configuration
- Configured `cache.nixos.org` as substituter
- Most packages will download pre-built binaries instead of building
- Significantly faster updates

### 3. GDB Solution
- Added `gdb` to Homebrew brews (handles code signing automatically)
- No more GDB build failures from Nix

### 4. Modular Organization
- Clean separation of concerns
- Easy to find and modify specific configurations
- Host-specific configs in separate files
- Shared modules across both hosts

## How to Use

### Rebuild Your System

```bash
# For work machine (user: rahman.muhammad)
sudo darwin-rebuild switch --flake ~/dotfiles/nix/.config/nix#gawrgare

# For home machine (user: gawrgare)
sudo darwin-rebuild switch --flake ~/dotfiles/nix/.config/nix#gawrgare-home

# Or use the Taskfile (from dotfiles root):
cd ~/dotfiles
task rebuild-nix
```

### Update Packages

```bash
# Update only stable packages (recommended, less frequent)
nix flake lock --update-input nixpkgs-stable

# Update only unstable packages (when you want latest)
nix flake lock --update-input nixpkgs-unstable

# Update everything
nix flake update
```

### Add New Packages

Edit `modules/packages.nix`:
- Use `pkgs.*` for stable packages (most cases)
- Use `pkgs-unstable.*` for packages that need latest versions

### Add Host-Specific Packages

Edit `hosts/gawrgare.nix` or `hosts/gawrgare-home.nix`:
```nix
environment.systemPackages = [
  pkgs.some-host-specific-tool
];
```

### Add Custom Overlays

Edit `overlays/default.nix`:
```nix
{ rust-overlay }:
[
  rust-overlay.overlays.default
  (final: prev: {
    my-custom-package = prev.some-package.override { ... };
  })
]
```

## What to Expect

### First Rebuild
- Will download nixos-25.11 channel
- May take longer as it fetches new packages
- Most packages should download from cache (not build)

### Subsequent Rebuilds
- Much faster (stable channel changes infrequently)
- VS Code and GCC should download from cache
- Only unstable packages (rust/zig/bun) may rebuild when you update them

## Verification

After rebuilding, verify:
```bash
# Check GDB works
gdb --version

# Check packages are from correct channels
which code
which gcc
which rustc
```

## Troubleshooting

If you encounter issues:
1. Check syntax: `nix flake check --no-build`
2. See what will change: `darwin-rebuild build --flake ~/.config/nix#gawrgare`
3. Check the plan file for detailed steps

## Notes

- **No automatic rebuild**: You need to run `darwin-rebuild switch` manually
- **GDB**: Now from Homebrew (handles macOS code signing)
- **Overlays**: Applied to both stable and unstable channels
- **Clean structure**: Easy to maintain and extend
