# git-cliff template

Template repo for using [git-cliff](https://github.com/orhun/git-cliff)

## Prerequisites

Before you begin, ensure that you have the following tools installed:

- **gpg**: For signing commits and tags.
- **git-cliff**: For generating changelogs based on commit messages.
- **nix**: Each assignment comes with a flake.nix (easily install dependencies)  

### Installing Dependencies

You can install all necessary tools using Nix by running:

```bash
nix develop .
```

This command will set up the development environment with `gpg` and `git-cliff` installed, as specified in the `flake.nix` file.

## Commit Message Guidelines

To maintain a consistent and meaningful commit history, adhere to the following commit message conventions. Each commit message should start with one of the predefined prefixes:

| Prefix     | Description                  |
|------------|------------------------------|
| `feat`     | :sparkles: **Features**      |
| `fix`      | :bug: **Bug Fixes**          |
| `refactor` | :tractor: **Refactoring**    |
| `init`     | :tada: **Initial Commit**    |
| `style`    | :art: **Styling**            |
| `revert`   | :rewind: **Reverts**         |
| `chore`    | :wrench: **Chore**           |

**Note:** Use lowercase letters for prefixes and follow them with a colon and a space.

## Release Process

Releasing a new assignment version is straightforward. Follow these steps to create a new release:

```bash
    ./release.sh vx.y.z-assignmentName
    git push && git push --tags
```

If you are encountering any issues feel free to look at the [git-cliff docs](https://github.com/orhun/git-cliff.git)
