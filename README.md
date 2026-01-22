# cracked_resume
Repository for manifesting your cracked developer resume.

I originally had this in LaTeX, but then I decided to update it to using [Typst](https://github.com/typst/typst). Previously, I was using Overleaf for my LaTeX template but they rug-pulled me when my resume was taking "too long to compile". It was pretty easy to get this moved over to Typst by following this [example](https://github.com/bamboovir/typst-resume-template/tree/main).

## Getting Started

### Prerequisites

- [Nix](https://nixos.org/download.html) with flakes enabled
- [direnv](https://direnv.net/) for automatic environment loading

### Quick Start

1. Enter the development shell:

   ```bash
   nix develop
   ```

1. Or with direnv installed:

   ```bash
   direnv allow
   ```

1. To generate the [resume](resume.pdf):

    ```bash
    mask run
    ```

### Available Tools

This development environment includes:

- **mask**: Task runner for automating common development tasks
- **treefmt**: Multi-language code formatter
- **git**: Version control
- **direnv/nix-direnv**: Automatic environment loading

### Task Automation

This project uses [mask](https://github.com/jacobdeichert/mask) for task automation. View available tasks:

```bash
mask --help
```

### Code Formatting

Use the nix formatter which is managed by `treefmt.nix`:

```bash
nix fmt
```

### Project Structure

```
.
├── flake.nix          # Nix flake configuration
├── treefmt.nix        # Formatter configuration
├── maskfile.md        # Task definitions
├── .envrc             # direnv configuration
└── README.md          # This file
```