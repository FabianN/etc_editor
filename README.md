# etc Editor

## Description

etc Editor is a simple command line wrapper for for your favorite editor to automatically create diff files of your edits. The diffs will named *__file.name__.diff#*, with the latest diff being the highest number at the end of the *.diff*.

## Usage

```bash
$ etc_editor.sh ~/path/to/file.ext
```

## Configs

### Editor

```bash
14    EDITOR=vim
```

Replace vim with whatever editor you prefer, such as nano, emacs, or what-have-you.

## TODO

- [ ] Create function to combine multiple diff files into one.
