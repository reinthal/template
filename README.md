# template

A template repository implementing Palisade's coding guide. Features:

- Nix + uv + direnv environment for development and CI
- Figures and the paper build in CI
- Lint and format pre-commit hooks
- VSCode settings and extensions

## Development

### Forking

```bash
# Clone
gh repo clone reinthal/template my-new-project -- -o template
cd my-new-project
git lfs fetch --all

# Set up
git rm CODEOWNERS # remove or replace with your own

# Push
gh repo create --private reinthal/my-new-project
git remote add origin https://github.com/reinthal/my-new-project.git
git push -u origin main
```

### System setup

To set up your system for the first time, run:

```bash
# Setup Nix
sh <(curl -L https://nixos.org/nix/install) --daemon
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
exit # the commands below need a fresh shell

# Install direnv
nix profile install nixpkgs#direnv nixpkgs#nix-direnv

# Install direnv shell hook
if ps -p $$ | grep -q zsh; then
    echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
elif ps -p $$ | grep -q bash; then
    echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
fi

# Setup nix-direnv
mkdir -p ~/.config/direnv
echo 'source $HOME/.nix-profile/share/nix-direnv/direnvrc' >> ~/.config/direnv/direnvrc

# Install pre-commit
nix profile install nixpkgs#pre-commit
```

If something goes wrong, cross-check your setup against this [GitHub Action](.github/workflows/setup-toolchain.yml).

### Project setup

After cloning the repository, run:

```bash
# allow loading environment from flake.nix, pyproject.toml, and .env
direnv allow
# install linting and formatting hooks
pre-commit install && pre-commit run --all-files
```

### Daily workflow

Use Cursor to edit code. It will suggest extensions to install when you open the project.

```bash
cd template # automatically loads environment
ninja # builds figures and the paper
git commit # checks format and lints
```

### Files to know

- `flake.nix` defines system dependencies like `texlive`
- `pyproject.toml` defines Python dependencies like `matplotlib`
- `build.ninja` defines build targets like `paper` and `figures`
