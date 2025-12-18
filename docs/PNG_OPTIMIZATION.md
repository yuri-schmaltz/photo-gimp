# PNG Optimization Guide for PhotoGIMP

This document explains how to optimize PNG assets in PhotoGIMP to reduce file size without quality loss.

## Why Optimize PNGs?

- Reduces download size for users
- Faster installation
- Lower bandwidth costs
- No visual quality loss (lossless optimization)

## Tools Required

### Install optipng

**Windows (Chocolatey):**
```powershell
choco install optipng
```

**Windows (Scoop):**
```powershell
scoop install optipng
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install optipng
```

**Linux (Fedora):**
```bash
sudo dnf install optipng
```

**macOS (Homebrew):**
```bash
brew install optipng
```

## Optimization Process

### Optimize all PNGs in the repository

```bash
# Navigate to repository root
cd /path/to/PhotoGIMP

# Optimize all PNG files (lossless, maximum compression)
find . -name "*.png" -exec optipng -o7 {} \;
```

### Optimize specific directories

```bash
# Icons only
find .local/share/icons -name "*.png" -exec optipng -o7 {} \;

# Splash screens only
find .config/GIMP/3.0/splashes -name "*.png" -exec optipng -o7 {} \;
```

### Windows PowerShell equivalent

```powershell
# Optimize all PNGs
Get-ChildItem -Path . -Filter *.png -Recurse | ForEach-Object {
    optipng -o7 $_.FullName
}

# Icons only
Get-ChildItem -Path .\.local\share\icons -Filter *.png -Recurse | ForEach-Object {
    optipng -o7 $_.FullName
}
```

## Optimization Levels

optipng supports optimization levels from `-o0` (fastest) to `-o7` (best compression):

- `-o2`: Fast optimization (recommended for testing)
- `-o7`: Maximum compression (recommended for releases)

## Verify Results

```bash
# Before optimization
du -sh .

# Run optimization
find . -name "*.png" -exec optipng -o7 {} \;

# After optimization
du -sh .
```

Expected savings: **10-30%** reduction in total PNG size.

## Pre-Release Checklist

Before each release:

- [ ] Run `optipng -o7` on all PNG files
- [ ] Verify no visual degradation (open files in image viewer)
- [ ] Compare file sizes before/after
- [ ] Document size reduction in release notes
- [ ] Commit optimized files

## Alternative Tools

If optipng is not available, consider:

- **pngquant** (lossy, but higher compression)
- **TinyPNG** (online service)
- **ImageOptim** (macOS GUI)
- **GIMP itself** (Export with compression level 9)

## Current Status

⚠️ **PNGs in this repository have not been optimized yet.**

To optimize them now, run:
```bash
# After installing optipng
find . -name "*.png" -exec optipng -o7 {} \;
```

## Notes for Maintainers

- Run optimization before each release
- Add optimization step to CI/CD pipeline (future task)
- Monitor file sizes in PRs that add new images
- Consider automated optimization with GitHub Actions
