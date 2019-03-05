
#

## Keyboard tricks

Some Special key on mac:

⌘（command）、⌥（option）、⇧（shift）、⇪（capslock）、⌃（control）、↩（return）

### Paste text without format

- `⌘ + ⌥ + ⇧ + v`: Paste with out style. Useful when pasting texts to Word.

- `⌥ + ⇧ + Volume Up/Down`: increase/decrease volume by quarter increments.

- `⌘ + D`: Quickly select the Desktop folder when saving files.

- `⌃ + A/E/U/K/W/T`: Move to start/end of line; delete from curser to start/end of line; erase word to left; transpose chars around curser.

- `⌥ + click`: Auto colse the current top app window when clicking on an other app window.

- `⌘ + ⇥ / ⌘ + ⇧ + ⇥`: Switch applications.

- `click & drag + ⌘ + ⇥`: Drag file into the selection application.

## Useful command

- `open`

    ``` sh
    open 'file'             # open with the default application
    open -a 'app' 'file'    # open with the specified application
    ```

- `pbpate/pbcopy`

    ```sh
    curl "http://stackoverflow.com/" | pbcopy   # copy output of curl to system clipboard
    pbpaste > newfile.txt                       # dump content of system clipboard to file
    ```

- `say`

    ```sh
    say Mac OS X            # call the speech synthesizer
    ```

## System tricks

### Change build-in system icons

Location of system icons: `/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources`

### Some system setting (commandline)

-  Show all hidden files

    ``` sh
    defaults write com.apple.Finder AppleShowAllFiles -BOOL TRUE; killall Finder
    defaults write com.apple.Finder AppleShowAllFiles -BOOL FALSE; killall Finder
    ```

- Hide/Show desktop objects on screen

    ```sh
    defaults write com.apple.finder CreateDesktop -bool FALSE; killall Finder
    defaults write com.apple.finder CreateDesktop -bool TRUE; killall Finder
    ```

- Turn on/off 'Show the full directory path in the Finder window'

    ```sh
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool TRUE; killall Finder
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool FALSE; killall Finder
    ```

- Disable/Enable mac sleeping, `⌃ + c` to stop.

    ```sh
    pmset noidle
    ```