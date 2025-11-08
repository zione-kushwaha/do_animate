# Publishing Guide for DoAnimate

This guide will help you publish the `do_animate` package to pub.dev.

## Prerequisites

1. **Dart/Flutter SDK**: Ensure you have Flutter installed
2. **pub.dev Account**: Create an account at https://pub.dev
3. **Git Repository**: Create a GitHub repository for your package

## Steps to Publish

### 1. Update Repository Information

Edit `pubspec.yaml` and update these fields with your actual GitHub repository:

```yaml
homepage: https://github.com/YOUR_USERNAME/do_animate
repository: https://github.com/YOUR_USERNAME/do_animate
issue_tracker: https://github.com/YOUR_USERNAME/do_animate/issues
```

### 2. Verify Package Structure

Make sure your package has all required files:
- ✅ `pubspec.yaml` - Package metadata
- ✅ `README.md` - Package documentation
- ✅ `CHANGELOG.md` - Version history
- ✅ `LICENSE` - MIT License
- ✅ `lib/` - Source code
- ✅ `example/` - Example app
- ✅ `test/` - Tests

### 3. Validate the Package

Run the following command to check for any issues:

```bash
flutter pub publish --dry-run
```

This will simulate publishing without actually uploading. Fix any warnings or errors.

### 4. Run Tests

Ensure all tests pass:

```bash
flutter test
```

### 5. Check Analysis

Make sure there are no analysis issues:

```bash
flutter analyze
```

### 6. Initialize Git Repository (if not already done)

```bash
git init
git add .
git commit -m "Initial commit - DoAnimate v1.0.0"
```

### 7. Create GitHub Repository

1. Go to https://github.com/new
2. Create a new repository named `do_animate`
3. Push your code:

```bash
git remote add origin https://github.com/YOUR_USERNAME/do_animate.git
git branch -M main
git push -u origin main
```

### 8. Publish to pub.dev

When you're ready to publish:

```bash
flutter pub publish
```

You'll be prompted to:
1. Confirm the package details
2. Authorize pub.dev (first time only)
3. Confirm publication

### 9. Post-Publication

After publishing:
1. Verify your package appears at https://pub.dev/packages/do_animate
2. Check the package score and documentation
3. Add pub.dev badge to your README (it's already there!)

## Version Updates

For future updates:

1. Update the version in `pubspec.yaml`:
   ```yaml
   version: 1.0.1  # or 1.1.0, 2.0.0, etc.
   ```

2. Add changes to `CHANGELOG.md`:
   ```markdown
   ## 1.0.1
   * Fixed bug X
   * Added feature Y
   ```

3. Commit and tag:
   ```bash
   git add .
   git commit -m "Version 1.0.1"
   git tag v1.0.1
   git push origin main --tags
   ```

4. Publish:
   ```bash
   flutter pub publish
   ```

## Semantic Versioning

Follow semantic versioning (MAJOR.MINOR.PATCH):
- **MAJOR**: Breaking changes (2.0.0)
- **MINOR**: New features, backwards compatible (1.1.0)
- **PATCH**: Bug fixes (1.0.1)

## Tips for Success

1. **Documentation**: Keep README.md comprehensive with examples
2. **Examples**: Maintain working examples in the `example/` folder
3. **Tests**: Write tests for all animations
4. **Changelog**: Document all changes clearly
5. **Issues**: Respond to issues on GitHub promptly
6. **Updates**: Keep dependencies up to date

## Package Score

pub.dev scores packages on:
- ✅ Documentation quality
- ✅ Platform support
- ✅ Up-to-date dependencies
- ✅ Code analysis (no errors)
- ✅ Example code

Aim for 130+ points for a "good" package!

## Useful Commands

```bash
# Check package health
flutter pub publish --dry-run

# Run tests
flutter test

# Check for issues
flutter analyze

# Format code
dart format .

# Update dependencies
flutter pub upgrade

# Check outdated packages
flutter pub outdated
```

## Getting Help

- pub.dev documentation: https://dart.dev/tools/pub/publishing
- Flutter packages guide: https://flutter.dev/docs/development/packages-and-plugins/developing-packages
- pub.dev support: https://github.com/dart-lang/pub-dev/issues

Good luck with your package! 🚀
