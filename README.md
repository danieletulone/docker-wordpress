# Docker Wordpress

General purpose docker compose files for developing wordpress sites, themes, plugins.

## Requirements
- [docker](https://www.docker.com/)
- [watchman](https://facebook.github.io/watchman/)

    If you are new to watchman:
    > watches files and records, or triggers actions, when they change.
    
    In this repo, it is used by `link:*` and `unlink:*` commands/scripts because docker volume api do not work with symbolic links. So the link-like strategy is "watch and rsync".

## Get Started

**NOTE**:
Every command can be executed manually or using the sh scripts wrapper (the cli file).
To use the cli.sh file you should to run this command: `chmod +x cli` 

1. Clone this repo:
   - Manually:
        ```sh
        git clone git@github.com:danieletulone/docker-wordpress.git
        ```

   - Using sh wrapper: __No wrap command for clone__

2. Create .env file copying .env.example file:
    - Manually:
        ```sh
        cp .env.example .env
        ```

    - Using sh wrapper:
        ```sh
        ./cli install
        ```

3. (optional) Symlink your theme(s) or create folders into volumes.
    - Manually:
        ```sh
        link -s path/themes/example ./volumes/wordpress/themes
        ```

    - Using sh wrapper:
        ```sh
        ./cli link:theme path/themes/example
        ```

4. (optional) Symlink your plugin(s) or create folders into volumes.
    - Manually:
        ```sh
        link -s path/themes/example ./volumes/wordpress/themes
        ```

    - Using sh wrapper:
        ```sh
        ./cli link:plugin path/plugins/example
        ```

## Commands

### Clean

```sh
./cli clean
```

#### Description
Stop containers and remove volumes.

#### Options
You can pass every option of  `down` command of docker compose.

---

### Install

```sh
./cli install
```

#### Description
Install necessary things to allow to use correctly the docker-wordpress.

#### Options
No options.

---

### Link Theme

```sh
./cli link:theme my-theme-path
```

#### Description
Run a watcher for source directory and rsync it into ./volumes/wordpress/themes.

Internally, it use [watchman](https://facebook.github.io/watchman/) because docker volume api do not work with symbolic links. So the link-like strategy is "watch and rsync".

#### Options
No options.

---

### Link Plugin

```sh
./cli link:plugin my-theme-path
```

#### Description
Run a watcher for source directory and rsync it into ./volumes/wordpress/plugins.

Internally, it use [watchman](https://facebook.github.io/watchman/) because docker volume api do not work with symbolic links. So the link-like strategy is "watch and rsync".

#### Options
No options.

---

### Start

```sh
./cli start
```

#### Description
Install necessary things to allow to use correctly the docker-wordpress.

#### Options
You can pass every option of  `up` command of docker compose.

---

### Stop

```sh
./cli stop
```

#### Description
Install necessary things to allow to use correctly the docker-wordpress.

#### Options
You can pass every option of  `down` command of docker compose.

## Platform Compatibility

The `start` script handles automatically that for you and merges (or not) multiple docker-compose files. Tested on MacOs with M2.

