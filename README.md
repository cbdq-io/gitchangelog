# gitchangelog

## Summary

A container to maintain a change log from Git history.

Uses the [gitchangelog](https://pypi.org/project/gitchangelog/) Python
package with a config that will also handles commit messages that follow
the [Conventional Commits](https://www.conventionalcommits.org/) standard
along with that standards adoption of the
[Angular Commit Types](https://github.com/angular/angular/blob/main/contributing-docs/commit-message-guidelines.md).

## Overview

The standards suggested by gitchangelog, Conventional Commits and Angular
have a basic axiom that commit messages in Git should contain a type and an
optional scope.  In gitchangelog, this was implemented by having the format
of the commit message looking something like the following:

`fix: doc: update the README.md file`

In that example, the type is a fix and the scope is doc (for documentation).

For Conventional Commits and Angular, the same would be achieved with the
following:

`fix(doc): update the README.md file`

## Types

The allowed types are:

| Type | Description | Methodologies |
| ---- | ----------- | ------------- |
| build | Changes that affect the build system or external dependencies. | Angular |
| chg  | A change has been implemented. | gitchangelog |
| chore | A chore task. | Conventional Commits |
| ci | Changes to CI configuration files and scripts. | Angular |
| docs | Documentation only changes. | Angular |
| feat | A feature has been implemented. | Conventional Commits/Angular |
| fix  | A fix has been implemented. | gitchangelog, Conventional Commits/Angular |
| new  | Something new has been implemented. | gitchangelog |
| perf | A code change that improves performance. | Angular |
| refactor | A code change that neither fixes a bug nor adds a feature. | Angular |
| style | A change to the code to comply with style guidelines. | Conventional Commits |
| test | A code change that neither fixes a bug nor adds a feature. | Angular |

## Scopes

These are handled slightly differently by the methodologies:

- **gitchangelog**:
  Uses the scope to indicate a potential audience:
  - `dev` is for developers (e.g. API changes, refactors...).  A scope of dev
    also indicates that this commit message is to be skipped from the change
    log.
  - `usr` is for final users (e.g. UI changes).
  - `pkg` is for packagers (e.g. packaging changes).
  - `test` is for testers (e.g. test only related changes).
  - `doc` is for doc guys (e.g. doc only changes).

## Examples

If your Git history looks like this:

```
commit 970c5372d072fd605d6d675dd485b3719033ec62
Author: Ben Dalling <dallinb@users.noreply.github.com>
Date:   Mon Apr 28 09:14:43 2025 +0100

    ci(cd)!: deploy on merge

commit 94a2cc0ce1241d7f72d02ed375e61c4b5a1315d6
Author: Ben Dalling <dallinb@users.noreply.github.com>
Date:   Mon Apr 28 09:13:47 2025 +0100

    chore(deps): upgrade dependencies

commit ee87f6e62caba19d6fe13c9bbeebaca908ee2f75
Author: Ben Dalling <dallinb@users.noreply.github.com>
Date:   Mon Apr 28 09:12:12 2025 +0100

    build(api): add dockerfile

commit de16ae0c8dcc698040cc55a39cf020861f35c764
Author: Ben Dalling <dallinb@users.noreply.github.com>
Date:   Mon Apr 28 09:09:18 2025 +0100

    chg(api): change endpoint behavior

commit c99ef2e8d2b735e69e505865c3cf2914b0dfacc6
Author: Ben Dalling <dallinb@users.noreply.github.com>
Date:   Mon Apr 28 08:50:46 2025 +0100

    new(ui): Build new homepage

commit bc9849dfdc1089196bb8575cdd0ff3e09bbefb9b
Author: Ben Dalling <dallinb@users.noreply.github.com>
Date:   Mon Apr 28 08:49:34 2025 +0100

    fix(db): Correct schema

commit e317b1a6289728bfbf7a3805b3d937a2a9b29d66
Author: Ben Dalling <dallinb@users.noreply.github.com>
Date:   Mon Apr 28 08:46:04 2025 +0100

    feat(auth): add login
```

Then running the following command:

```shell
docker run --quiet --rm --volume "${PWD}:/mnt/source" ghcr.io/cbdq-io/gitchangelog
```

Will produce the following output:

```
# Changelog


## Unreleased

### Features

* Add login. [Ben Dalling]

### Fix

* Correct schema. [Ben Dalling]

### New

* Build new homepage. [Ben Dalling]

### Changes

* Change endpoint behavior. [Ben Dalling]

### Build

* Add dockerfile. [Ben Dalling]

### Chores

* Upgrade dependencies. [Ben Dalling]

### Continuous Integration

* Deploy on merge. [Ben Dalling]
```

## Skipping Commit Messages in the Change Log

By default, any message that doesn't match the patters mentioned above will
be added to a section called *Other*.  If you wish to commit a message that
you don't want in the change log, the gitchangelog package provides a number
of methods to achieve this.  None of the commit messages below will be
added to the change log:

- `fix: dev: MUST NOT BE IN CHANGE LOG.`
- `fix: MUST NOT BE IN CHANGE LOG (II). !minor`
- `fix: MUST NOT BE IN CHANGE LOG (III). !cosmetic`
- `fix: MUST NOT BE IN CHANGE LOG (III). !wip`

Please note that blank commit messages are also ignored.
