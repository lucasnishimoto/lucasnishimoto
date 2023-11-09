oclif-hello-world
=================

oclif example Hello World CLI

[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![CircleCI](https://circleci.com/gh/oclif/hello-world/tree/main.svg?style=shield)](https://circleci.com/gh/oclif/hello-world/tree/main)
[![GitHub license](https://img.shields.io/github/license/oclif/hello-world)](https://github.com/oclif/hello-world/blob/main/LICENSE)

<!-- toc -->
* [Usage](#usage)
* [Commands](#commands)
<!-- tocstop -->
# Usage
<!-- usage -->
```sh-session
$ npm install -g search
$ search COMMAND
running command...
$ search (--version)
search/0.0.0 linux-x64 node-v18.16.0
$ search --help [COMMAND]
USAGE
  $ search COMMAND
...
```
<!-- usagestop -->
# Commands
<!-- commands -->
* [`search hello PERSON`](#search-hello-person)
* [`search hello world`](#search-hello-world)
* [`search help [COMMANDS]`](#search-help-commands)
* [`search plugins`](#search-plugins)
* [`search plugins:install PLUGIN...`](#search-pluginsinstall-plugin)
* [`search plugins:inspect PLUGIN...`](#search-pluginsinspect-plugin)
* [`search plugins:install PLUGIN...`](#search-pluginsinstall-plugin-1)
* [`search plugins:link PLUGIN`](#search-pluginslink-plugin)
* [`search plugins:uninstall PLUGIN...`](#search-pluginsuninstall-plugin)
* [`search plugins:uninstall PLUGIN...`](#search-pluginsuninstall-plugin-1)
* [`search plugins:uninstall PLUGIN...`](#search-pluginsuninstall-plugin-2)
* [`search plugins update`](#search-plugins-update)

## `search hello PERSON`

Say hello

```
USAGE
  $ search hello PERSON -f <value>

ARGUMENTS
  PERSON  Person to say hello to

FLAGS
  -f, --from=<value>  (required) Who is saying hello

DESCRIPTION
  Say hello

EXAMPLES
  $ oex hello friend --from oclif
  hello friend from oclif! (./src/commands/hello/index.ts)
```

_See code: [dist/commands/hello/index.ts](https://github.com/teste/search/blob/v0.0.0/dist/commands/hello/index.ts)_

## `search hello world`

Say hello world

```
USAGE
  $ search hello world

DESCRIPTION
  Say hello world

EXAMPLES
  $ search hello world
  hello world! (./src/commands/hello/world.ts)
```

## `search help [COMMANDS]`

Display help for search.

```
USAGE
  $ search help [COMMANDS] [-n]

ARGUMENTS
  COMMANDS  Command to show help for.

FLAGS
  -n, --nested-commands  Include all nested commands in the output.

DESCRIPTION
  Display help for search.
```

_See code: [@oclif/plugin-help](https://github.com/oclif/plugin-help/blob/v5.2.9/src/commands/help.ts)_

## `search plugins`

List installed plugins.

```
USAGE
  $ search plugins [--core]

FLAGS
  --core  Show core plugins.

DESCRIPTION
  List installed plugins.

EXAMPLES
  $ search plugins
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v2.4.7/src/commands/plugins/index.ts)_

## `search plugins:install PLUGIN...`

Installs a plugin into the CLI.

```
USAGE
  $ search plugins:install PLUGIN...

ARGUMENTS
  PLUGIN  Plugin to install.

FLAGS
  -f, --force    Run yarn install with force flag.
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Installs a plugin into the CLI.
  Can be installed from npm or a git url.

  Installation of a user-installed plugin will override a core plugin.

  e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command
  will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in
  the CLI without the need to patch and update the whole CLI.


ALIASES
  $ search plugins add

EXAMPLES
  $ search plugins:install myplugin 

  $ search plugins:install https://github.com/someuser/someplugin

  $ search plugins:install someuser/someplugin
```

## `search plugins:inspect PLUGIN...`

Displays installation properties of a plugin.

```
USAGE
  $ search plugins:inspect PLUGIN...

ARGUMENTS
  PLUGIN  [default: .] Plugin to inspect.

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

GLOBAL FLAGS
  --json  Format output as json.

DESCRIPTION
  Displays installation properties of a plugin.

EXAMPLES
  $ search plugins:inspect myplugin
```

## `search plugins:install PLUGIN...`

Installs a plugin into the CLI.

```
USAGE
  $ search plugins:install PLUGIN...

ARGUMENTS
  PLUGIN  Plugin to install.

FLAGS
  -f, --force    Run yarn install with force flag.
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Installs a plugin into the CLI.
  Can be installed from npm or a git url.

  Installation of a user-installed plugin will override a core plugin.

  e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command
  will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in
  the CLI without the need to patch and update the whole CLI.


ALIASES
  $ search plugins add

EXAMPLES
  $ search plugins:install myplugin 

  $ search plugins:install https://github.com/someuser/someplugin

  $ search plugins:install someuser/someplugin
```

## `search plugins:link PLUGIN`

Links a plugin into the CLI for development.

```
USAGE
  $ search plugins:link PLUGIN

ARGUMENTS
  PATH  [default: .] path to plugin

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Links a plugin into the CLI for development.
  Installation of a linked plugin will override a user-installed or core plugin.

  e.g. If you have a user-installed or core plugin that has a 'hello' command, installing a linked plugin with a 'hello'
  command will override the user-installed or core plugin implementation. This is useful for development work.


EXAMPLES
  $ search plugins:link myplugin
```

## `search plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ search plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ search plugins unlink
  $ search plugins remove
```

## `search plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ search plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ search plugins unlink
  $ search plugins remove
```

## `search plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ search plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ search plugins unlink
  $ search plugins remove
```

## `search plugins update`

Update installed plugins.

```
USAGE
  $ search plugins update [-h] [-v]

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Update installed plugins.
```
<!-- commandsstop -->
