<div align="center">
  <img alt="logo" src="logo.svg" width="256" />
  <h1>
    vscode-snippets
  </h1>
  <p>
    Collection of code snippets for different languages in VS Code.
  </p>
</div>

<hr>

## Table of contents <!-- omit from toc -->

- [Extension structure](#extension-structure)
- [Extension versioning](#extension-versioning)
- [Extension release](#extension-release)
- [Extension lifecycle](#extension-lifecycle)
- [Project scripts](#project-scripts)
  - [Create a changeset](#create-a-changeset)
  - [Version packages](#version-packages)
  - [Package extensions](#package-extensions)
  - [Publish extensions](#publish-extensions)
- [Development workflow](#development-workflow)
- [Marketplace token](#marketplace-token)

## Extension structure

This repository is organized as a monorepo for VS Code snippet extensions. Root-level files are used for the repository itself: documentation, workspace configuration, release workflow, and shared tooling.

Each publishable extension has its own `package.json`, `README.md`, `CHANGELOG.md`, `LICENSE`, `logo.png`, and snippet files under `snippets/`. The `snippets/` directory contains the actual VS Code snippet extensions, organized by language.

Example:

```txt
snippets/
  cpp/                      # C++ language group
    package.json            # C++ extension pack
    cpp/                    # C++ snippets extension
    gtest/                  # GoogleTest snippets extension
      CHANGELOG.md
      LICENSE
      logo.png
      package.json
      README.md
      snippets/             # Snippet files by category
        asserts.json
        controls.json
        expects.json
        macros.json
```

## Extension versioning

This repository uses [Changesets](https://github.com/changesets/changesets) to manage snippet extension versions and changelogs, and `vsce` to publish VS Code extensions to the Marketplace.

Changesets should be created only for changes that affect a published extension under `snippets/`. Root-level changes usually do not require a changeset unless they affect the release or packaging process.

Use semantic versioning for snippet extensions:

| Type | Use when |
|---|---|
| `patch` | Fixing snippets, descriptions, placeholders, cursor positions, README, logo, or adding a small isolated snippet |
| `minor` | Adding a new snippet family or a significant new group of snippets |
| `major` | Changing or removing existing prefixes, or making a breaking change to snippet behavior |

Examples:

```txt
patch  → Move $0 to the next line in GoogleTest snippets.
patch  → Update README and logo assets.
minor  → Add JavaScript export snippets.
major  → Rename existing snippet prefixes.
```

## Extension release

The `release` workflow runs on pushes to `main`. It is based on the changesets action `changesets/action`.

When changesets are present, the workflow creates a version PR with the following title:

```txt
chore(release): update snippet extension versions
```

That PR contains the generated version and changelog updates. After the version PR is merged, the workflow publishes the updated extensions. Publishing uses `vsce publish` with `--skip-duplicate`, so already-published versions are skipped safely.

A generated changeset file, such as `.changeset/famous-chars-sin.md` represents one release intent. It should not be deleted manually and it contains:

```txt
---
"{package name}": {version bump type}
---

{changelog entry}
```

Example:

```md
---
"snippets-gtest": patch
---

Move final cursor positions to the next line in GoogleTest snippets.
```

Example affecting multiple extensions:

```md
---
"snippets-gtest": patch
"snippets-javascript": patch
---

Update extension README and logo assets.
```

## Extension lifecycle

1. Checkout to a new branch.
2. Modify one extension.
3. Run `pnpm run vscode:change`.
4. Commit the generated `.changeset/*.md` file with the modification.
5. Merge the new branch into `main`.
6. GitHub Actions creates a version PR using the `release` workflow.
7. The version PR:
   - bumps the package version
   - updates the extension `CHANGELOG.md`
   - removes the consumed `.changeset/*.md` file
8. Merge the version PR.
9. GitHub Actions publishes the new extension version to the VS Code Marketplace.

## Project scripts

Run these commands from the root of the repository.

### Create a changeset

```bash
pnpm vscode:change
```

Creates a new changeset file under `.changeset/`.

Use this after modifying a published extension. The generated file describes:

- the affected extension package
- the version bump type: `patch`, `minor`, or `major`
- the changelog entry

The generated `.changeset/*.md` file must be committed with the related changes.

### Version packages

```bash
pnpm vscode:version
```

Runs Changesets versioning.

This command:

- bumps the versions of affected extension packages
- updates their `CHANGELOG.md`
- removes consumed `.changeset/*.md` files

This command is normally run by GitHub Actions. You usually should not run it manually during normal development.

### Package extensions

```bash
pnpm vscode:package
```

Packages all publishable VS Code snippet extensions into `.vsix` files.

This command runs `vscode:package` inside each publishable extension matched by the workspace filter `./snippets/*/*`.

Generated `.vsix` files are build artifacts and should not be committed.

To package a single extension manually:

```bash
pnpm -C snippets/cpp/gtest vscode:package
```

### Publish extensions

```bash
pnpm vscode:publish
```

Publishes all publishable VS Code snippet extensions to the Visual Studio Marketplace.

This command runs `vscode:publish` inside each publishable extension matched by the workspace filter `./snippets/*/*`.

Each extension publishes with `vsce publish --skip-duplicate`, so already-published versions are skipped safely. This command requires the `VSCE_PAT` environment variable. It is normally run by GitHub Actions after the version PR is merged.

## Development workflow

1. Checkout to a new branch.

    ```bash
    git checkout -b <branch>
    ```

2. Modify the extension files.

    Examples:

    ```txt
    snippets/cpp/gtest/snippets/asserts.json
    ```

3. Create a changeset.

    ```bash
    pnpm vscode:change
    ```

    Select the affected package or packages, choose the version bump type, and write a clear changelog message.

4. Commit the code changes and the generated `.changeset/*.md` file.

    ```bash
    git add .
    git commit -m "fix(cpp/gtest): update snippet cursor positions"
    git push origin <branch>
    ```

    The generated `.changeset/*.md` file must be committed. It is temporary, but it is required for the release process.

5. Merge the new branch into main.

## Marketplace token

Publishing requires a GitHub repository secret named:

```txt
VSCE_PAT
```

This token is used by `vsce` to publish extensions to the VS Code Marketplace.

To create the token:

1. Go to the Azure DevOps portal.

2. Select the Azure DevOps organization associated with the VS Code Marketplace publisher.

3. Open the user settings menu next to your profile image.

4. Select **Personal access tokens**.

5. Select **New Token**.

6. Configure the token:

   ```txt
   Name: VSCE_PAT
   Organization: All accessible organizations
   Expiration: choose the desired expiration date
   Scopes: Custom defined
   ```

7. Under **Scopes**, click **Show all scopes**.

8. Find **Marketplace** and enable:

   ```txt
   Marketplace: Manage
   ```

9. Click **Create**.

10. Copy the token immediately. It will not be shown again.

Then add it to the GitHub repository secrets:

1. Open the GitHub repository.
2. Go to **Settings**.
3. Go to **Secrets and variables** → **Actions**.
4. Click **New repository secret**.
5. Add the secret:

   ```txt
   Name: VSCE_PAT
   Value: <the Azure DevOps personal access token>
   ```

6. Save the secret.
