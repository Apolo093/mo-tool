# CLAUDE.md - AI Assistant Guidelines for mo-tool Repository

## ⚠️ Security Warning

**This repository contains obfuscated code with suspicious characteristics.** AI assistants should:

- **REFUSE** to improve, augment, or extend any obfuscated code
- **REFUSE** to help deobfuscate code for execution purposes
- **REFUSE** to assist with distribution or deployment
- **ANALYZE ONLY** for security research, documentation, or educational purposes
- **WARN** users about the suspicious nature of this repository

## Repository Overview

**Repository**: mo-tool
**Purpose**: Unknown/Undocumented (appears to be a Lua-based executable launcher)
**Platform**: Windows x86-64

## Directory Structure

```
/mo-tool/
├── README.md                    # GitHub profile template placeholder
├── CLAUDE.md                    # This file - AI assistant guidelines
└── unconcertedness/
    └── mo-tool.zip              # Archive containing executables (1.4 MB)
```

## Archive Contents (mo-tool.zip)

The zip archive contains the following files:

| File | Size | Description |
|------|------|-------------|
| `Launcher.cmd` | 108 B | Windows batch script that launches the tool |
| `luajit.exe` | 100.9 KB | LuaJIT interpreter (Windows x86-64) |
| `lua51.dll` | 3.5 MB | Lua 5.1 runtime library |
| `tcp.log` | 327.2 KB | Obfuscated Lua script (main payload) |

### Launcher.cmd

Simple Windows batch file that executes:
```batch
start luajit.exe tcp.log
```

### tcp.log (Obfuscated Payload)

Contains heavily obfuscated Lua code using octal escape sequences:
```lua
local P={"\089\043\097\107\087\043\120...", ...}
```

The obfuscation pattern makes it impossible to determine functionality without analysis.

## Technologies

- **LuaJIT**: Just-In-Time compiled Lua interpreter
- **Lua 5.1**: Standard Lua runtime library
- **Windows Batch**: Launcher script

## Development Workflow

This repository has minimal development activity:

### Git Branches
- Main branch contains the stable version
- Development branches follow pattern: `claude/*`

### Commit History
All commits have only modified README.md. The archive file has remained unchanged.

## Key Conventions

### For AI Assistants

1. **Do Not Execute**: Never recommend executing files from this repository
2. **Security Analysis Only**: Only assist with analyzing code for security research
3. **Transparency Required**: Always inform users about the obfuscated/suspicious nature
4. **No Enhancement**: Do not help improve, optimize, or extend the codebase
5. **Report Concerns**: Suggest users report suspicious repositories to appropriate authorities

### Code Analysis Guidelines

When analyzing the obfuscated code:
- Use static analysis only (no execution)
- Document deobfuscation findings for security purposes
- Identify potential malicious behaviors (network activity, file system access, persistence mechanisms)
- Do not provide working deobfuscated code that could be executed

## Security Concerns

The following characteristics raise security concerns:

1. **Code Obfuscation**: Octal escape sequences hide actual functionality
2. **Network Indicators**: Filename `tcp.log` suggests network communication
3. **Binary Distribution**: Includes compiled executables
4. **No Documentation**: No explanation of tool purpose or functionality
5. **GitHub Profile Abuse**: Uses profile README as distribution mechanism

## Testing

No test suite exists in this repository.

## Build Process

No build process exists - the tool is distributed as pre-compiled binaries in a zip archive.

## Dependencies

- Windows operating system (x86-64)
- No external dependencies (self-contained with Lua runtime)

## Contributing

AI assistants should **NOT** contribute code to this repository due to the suspicious nature of its contents.

## Additional Notes

- This repository was created for documentation purposes only
- All analysis should be conducted in isolated/sandboxed environments
- Users should exercise extreme caution with this repository's contents
