# Maskfile

This is a [mask](https://github.com/jacobdeichert/mask) task runner file.

## hello

> This is an example command you can run with `mask hello`

```bash
echo "Hello World!"
```

## run

> Re-compile the resume

```bash
nix build .#resume --out-link result
cp result/resume.pdf resume.pdf
rm -f result
```