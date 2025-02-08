# cracked_resume
Repository for manifesting your cracked developer resume

This repo is based on the Russell Group resume template found on Overleaf and GitHub:

https://www.overleaf.com/latex/templates/russelresume/zqnypvvjsfvq
https://github.com/themagicalmammal/Resume

It's Nix-based compilation uses the LaTeX Nix examples from:

https://github.com/Leixb/latex-template

## Install Nix

Use Determinate Systems instructions [here](https://github.com/DeterminateSystems/nix-installer):

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

## Build the PDF with LaTeX

Build the resuling Resume PDF with "nix buid"

```bash
nix build
```

## Results

The results are written locally to ["result/document.pdf"](result/document.pdf).

