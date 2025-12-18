# PhotoGIMP Release Process

This document describes the complete process for creating and publishing a new PhotoGIMP release.

## Table of Contents

1. [Pre-Release Checklist](#pre-release-checklist)
2. [Version Numbering](#version-numbering)
3. [Testing Requirements](#testing-requirements)
4. [Creating Release Artifacts](#creating-release-artifacts)
5. [Publishing the Release](#publishing-the-release)
6. [Post-Release Tasks](#post-release-tasks)

---

## Pre-Release Checklist

Before starting the release process, ensure:

- [ ] All planned features/fixes are merged to `master`
- [ ] No open critical bugs that should block release
- [ ] CHANGELOG.md is updated with all changes since last release
- [ ] All documentation (README files in all languages) is up to date
- [ ] Version numbers are consistent across all files

---

## Version Numbering

PhotoGIMP follows [Semantic Versioning](https://semver.org/):

**Format:** `MAJOR.MINOR.PATCH`

- **MAJOR:** Incompatible changes (e.g., GIMP 4.0 support, complete redesign)
- **MINOR:** New features, shortcuts, themes (backward compatible)
- **PATCH:** Bug fixes, optimizations, documentation updates

**Examples:**
- `3.0.0` → First release for GIMP 3.0
- `3.1.0` → Added new shortcuts and theme variants
- `3.1.1` → Fixed installation bug on macOS

**Current version:** 3.0.x (update this when releasing)

---

## Testing Requirements

### Minimum Testing Matrix

Every release **must** be tested on:

| Platform | GIMP Version | Installation Method | Tester | Status |
|----------|--------------|---------------------|--------|--------|
| Windows 11 | 3.0.x | Manual ZIP | | ⬜ |
| Windows 11 | 3.0.x | Chocolatey | | ⬜ |
| Ubuntu 24.04 LTS | 3.0.x | Flatpak | | ⬜ |
| Ubuntu 24.04 LTS | 3.0.x | Manual ZIP | | ⬜ |
| macOS 14 (Sonoma) | 3.0.x | Manual ZIP | | ⬜ |

### Testing Procedure

For each platform:

1. **Fresh Install Test:**
   - Start with GIMP default config (delete existing config folder)
   - Run GIMP once, then quit
   - Install PhotoGIMP using the method
   - Launch GIMP
   - ✅ Verify: Splash screen shows "PhotoGIMP"
   - ✅ Verify: Window title shows "PhotoGIMP"
   - ✅ Verify: Tools are organized differently than default GIMP

2. **Shortcuts Test:**
   - Test at least 10 critical shortcuts:
     - `Ctrl+J` or equivalent (if mapped)
     - `Ctrl+T` (Transform/Scale)
     - Zoom shortcuts (`Ctrl +`, `Ctrl -`)
     - Canvas navigation
   - Document any non-functional shortcuts

3. **Visual Test:**
   - Open a sample image
   - Verify theme loads correctly
   - Check all panels are visible
   - Ensure no visual glitches

4. **Uninstall Test:**
   - Follow uninstall instructions from README
   - Verify GIMP returns to default state

---

## Creating Release Artifacts

### 1. Prepare the Repository

```bash
# Ensure you're on master and up to date
git checkout master
git pull origin master

# Create a release branch
git checkout -b release/v3.1.0
```

### 2. Update Version Information

Update these files with the new version number:
- `CHANGELOG.md` (add release date)
- `README.md` (update version mentions if needed)
- Any version metadata files

### 3. Optimize Assets

```bash
# Optimize all PNG files (requires optipng installed)
find . -name "*.png" -exec optipng -o7 {} \;

# Commit optimizations
git add .
git commit -m "Optimize PNG assets for v3.1.0 release"
```

### 4. Create Distribution ZIPs

#### For Linux (Flatpak/Native):

```bash
# Create temporary directory
mkdir -p ~/photogimp-release-temp/PhotoGIMP

# Copy necessary files
cp -r .config ~/photogimp-release-temp/PhotoGIMP/
cp -r .local ~/photogimp-release-temp/PhotoGIMP/

# Create ZIP
cd ~/photogimp-release-temp
zip -r PhotoGIMP-linux.zip PhotoGIMP/
mv PhotoGIMP-linux.zip ~/photogimp-release/
```

#### For Windows/macOS:

```bash
# Same structure, but without Linux-specific files
mkdir -p ~/photogimp-release-temp/PhotoGIMP
cp -r .config ~/photogimp-release-temp/PhotoGIMP/
cd ~/photogimp-release-temp
zip -r PhotoGIMP.zip PhotoGIMP/
mv PhotoGIMP.zip ~/photogimp-release/
```

#### For Icon:

```bash
# If distributing icon separately
cp .local/share/icons/hicolor/256x256/256x256.png ~/photogimp-release/photogimp.png
# Or create .ico for Windows if available
```

### 5. Generate Checksums

```bash
cd ~/photogimp-release/

# Generate SHA256 checksums
sha256sum PhotoGIMP.zip PhotoGIMP-linux.zip photogimp.png > SHA256SUMS

# Optionally sign with GPG (if set up)
gpg --clearsign SHA256SUMS
```

### 6. Verify Checksums

```bash
# Verify checksums are correct
sha256sum -c SHA256SUMS
```

---

## Publishing the Release

### 1. Create Git Tag

```bash
# Tag the release
git tag -a v3.1.0 -m "PhotoGIMP v3.1.0 - [Short description]"

# Push tag to GitHub
git push origin v3.1.0
```

### 2. Create GitHub Release

1. Go to https://github.com/Diolinux/PhotoGIMP/releases/new
2. Select the tag you just created: `v3.1.0`
3. Release title: `PhotoGIMP v3.1.0`
4. Description: Copy from CHANGELOG.md, format as:

```markdown
## 🎉 PhotoGIMP v3.1.0

[Brief summary of the release]

### ✨ New Features
- Feature 1
- Feature 2

### 🐛 Bug Fixes
- Fix 1
- Fix 2

### 📚 Documentation
- Documentation improvement 1

### 🎨 Changes
- Change 1

---

## 📦 Installation

Download the appropriate file for your system:
- **Windows/macOS:** `PhotoGIMP.zip`
- **Linux:** `PhotoGIMP-linux.zip`

See the [README](https://github.com/Diolinux/PhotoGIMP#how-to-install) for installation instructions.

## 🔐 Verify Download Integrity

```bash
# Check SHA256 checksum
sha256sum PhotoGIMP.zip
# Compare with SHA256SUMS file
```

## ⚠️ Known Issues
- Issue 1 (if any)
- Workaround: ...

## 🙏 Acknowledgments
Thanks to all contributors and supporters!
```

5. Attach files:
   - `PhotoGIMP.zip`
   - `PhotoGIMP-linux.zip`
   - `photogimp.png` or `photogimp.ico`
   - `SHA256SUMS`
   - `SHA256SUMS.asc` (if GPG signed)

6. Check "Set as the latest release"
7. Click "Publish release"

### 3. Update Package Managers

If applicable, update:

#### Chocolatey
- Notify maintainer: @AndreAugustoDev
- Provide new version number and download links

#### Homebrew (if available)
```bash
# Update formula with new URL and checksum
```

#### AUR (if available)
```bash
# Update PKGBUILD with new version and checksum
```

---

## Post-Release Tasks

### 1. Announce the Release

- [ ] Post on Diolinux YouTube channel (video/community post)
- [ ] Update any project website
- [ ] Share on social media (Twitter, Reddit, etc.)
- [ ] Update any forum threads or discussions

### 2. Monitor for Issues

- [ ] Watch GitHub Issues for bug reports
- [ ] Be responsive to installation problems
- [ ] Document any critical bugs in release notes (edit if needed)

### 3. Update Documentation

- [ ] If README changes were made, ensure all language versions are synced
- [ ] Update any external documentation or wikis

### 4. Prepare for Next Release

```bash
# Merge release branch back to master
git checkout master
git merge release/v3.1.0
git push origin master

# Create CHANGELOG entry for next version
echo "\n## [Unreleased]\n\n### Added\n\n### Changed\n\n### Fixed\n" >> CHANGELOG.md
git add CHANGELOG.md
git commit -m "Prepare CHANGELOG for next release"
git push origin master
```

---

## Emergency Hotfix Procedure

If a critical bug is discovered after release:

1. Create hotfix branch from the release tag:
   ```bash
   git checkout -b hotfix/v3.1.1 v3.1.0
   ```

2. Fix the critical bug

3. Test the fix on affected platforms

4. Follow the release process with a PATCH version bump (e.g., 3.1.1)

5. Clearly indicate in release notes this is a hotfix

---

## Tools and Resources

- **optipng:** PNG optimization
- **zip:** Creating distribution archives
- **sha256sum:** Checksum generation
- **gpg:** (Optional) Release signing
- **GitHub CLI:** `gh release create` (alternative to web UI)

---

## Release Checklist Summary

Use this final checklist when releasing:

- [ ] All changes merged and tested
- [ ] CHANGELOG.md updated
- [ ] Version numbers updated
- [ ] PNGs optimized
- [ ] Distribution ZIPs created
- [ ] Checksums generated and verified
- [ ] Git tag created and pushed
- [ ] GitHub Release published with all files
- [ ] Package managers notified (if applicable)
- [ ] Release announced
- [ ] Monitoring GitHub Issues

---

## Questions?

If you have questions about the release process:
1. Check existing release tags and notes for examples
2. Ask in GitHub Discussions
3. Contact the maintainer team

---

**Last Updated:** December 2025  
**Next Review:** When major process changes are needed
