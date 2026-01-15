# ngreload

A bash script that tests nginx configuration and automatically reloads it if valid. This prevents downtime caused by configuration errors.

## Features

- ✅ Nginx configuration validation
- ✅ Automatic reload only on valid configuration
- ✅ Colorful log output with timestamps

## Installation

### Method 1: System-wide Installation (Recommended)

```bash
git clone https://github.com/otoneko1102/ngreload.git
cd ngreload
sudo make install
```

This installs the script to `/usr/local/bin` and requires sudo access.

### Method 2: Local User Installation

```bash
git clone https://github.com/otoneko1102/ngreload.git
cd ngreload
make install-local
```

This installs the script to `~/.local/bin` (no sudo required). Make sure `~/.local/bin` is in your PATH:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

### Method 3: Root's bin Directory

```bash
git clone https://github.com/otoneko1102/ngreload.git
cd ngreload
sudo make install-root
```

This installs the script to `/root/bin`.

## Usage

```bash
ngreload
```

### Example

```bash
$ ngreload
[2025-01-15 10:30:45] ℹ️  Checking nginx configuration...
[2025-01-15 10:30:45] ✅ Configuration test passed. Reloading nginx...
[2025-01-15 10:30:45] ✅ Nginx reloaded successfully.
```

## Requirements

- Bash 4.0 or later
- Nginx installed
- sudo access

## Uninstallation

```bash
sudo make uninstall
```

Or manually:

```bash
sudo rm /usr/local/bin/ngreload
```

## License

MIT License

## Support

If you encounter any issues, please report them on GitHub Issues.
