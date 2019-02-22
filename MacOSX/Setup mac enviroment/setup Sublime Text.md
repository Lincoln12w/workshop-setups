# [Sublime](https://www.sublimetext.com/3)

[TOC]

If the download link can't open, download & install __sublime Text Build 3114.dmg__ instead & perform Update.
Preferred VS Code.

__Usage__:

- `⌘ + ⇧ + P`: show the supported commands

``` sh
# Open in terminal
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

subl test.py
subl test/
```

## Basic setup

- [Package control](https://packagecontrol.io)

  __Install__:

  1. `Preferences > Browse Packages…`.
  2. Download the [Package Control.sublime-package](https://packagecontrol.io/Package%20Control.sublime-package) and copy it into the `Installed Packages/` directory
  3. Restart Sublime Text

  __Usage__:

  - `⌘ + ⇧ + P` & type commands:
    - Install Package
      Show a list of all available packages that are available for install.
      This will include all of the packages from the [default channel](https://packagecontrol.io/browse), plus any from repositories you have added.
    - Add Repository
      Add a repository that is not included in the default channel.
      - Github: `https://github.com/username/repository`
    - BitBucket: `https://bitbucket.org/username/repository`
    - Remove Package
        Remove the package folder and the package name from the `installed_package` list in `Packages/User/Package Control.sublime-settings`.

    **The `installed_packages` list allow Package Control to automatically install packages for you if you copy your `Packages/User/` folder to another machine.**

## Markdown with Sublime

__Packages__:

- [MarkdownEditing](https://github.com/SublimeText-Markdown/MarkdownEditing)

  Install by __Package Control__

  __Usage__:

  - `⌘ + ⌥ + V`: Creates or pastes the contents of the clipboard as an in-line link on selected text.
  - `⌘ + ⌥ + R`: Creates or pastes the contents of the clipboard as a reference link.
  - `⌘ + ⇧ + K`: Creates or pastes the contents of the clipboard as an in-line image on selected text.
  - `⌘ + ⌥ + B/I`: Bold & Italic the chosen words.

    __source code highlight mode__

``` py
# use ``` py
def main():
    print "Hello World!"
```

``` c
// use ``` c
#include<stdio.h>
int main()
{
    printf("Hello World!\n");
}
```

``` sh
# use ``` sh
echo "Hello World!"
```

- [OmniMarkupPreviewer](https://github.com/timonwong/OmniMarkupPreviewer)

  Install by __Package Control__

  __Usage__::

  - `⌘ + ⌥ + O`: Preview Markup in Browser.
  - `⌘ + ⌥ + X`: Export Markup as HTML.

  __P1: `buffer_id(30) is not valid` when preview on Browser.__

  ``` txt
    Error: 404 Not Found

    Sorry, the requested URL 'http://127.0.0.1:51004/view/30' caused an error:

    'buffer_id(30) is not valid (closed or unsupported file format)'

    **NOTE:** If you run multiple instances of Sublime Text, you may want to adjust
    the `server_port` option in order to get this plugin work again.
  ```

  Remove _strideout_, _subscript_, _superscript_ extensions in OmniMarkupPreviewer's setting by set `Sublime Text -> Preferences -> Package Settings -> OmniMarkupPreviewer -> Settings-User` with the following setting to override the default settings.

  ``` json
    {
        "server_port": 51008,
        "renderer_options-MarkdownRenderer": {
            "extensions": ["tables", "fenced_code", "codehilite", "toc"]
        }
    }
  ```

## Latex with Sublime

__Prepare__:

Install [skim](http://skim-app.sourceforge.net/), [MacTeX](http://tug.org/mactex/mactex-download.html), [BibDesk](http://bibdesk.sourceforge.net/)

__Packages__:

- [LaTexTools](https://github.com/SublimeText/LaTeXTools)

  Install by __Package Control__

  __Setup__

  `Skim -> Preference -> Sync -> Preset`: choose `Sublime Text`.

  __Usage__:

  - `⌘ + B`: Build the file, pdf will auto opened by __Skim__.
  - `⌘ + ⇧` & click on __Skim__: Jump to the crosspond source file position.

- [LaTeX Word Count](https://github.com/kevinstadler/SublimeLaTeXWordCount)

  Install by __Package Control__

  __Usage__:

  - `⌃ + ⇧ + C`: Show the word count

__Latex Bibstyle__:

- Set maximum number of author names.

  ``` json /Users/lincoln/Library/texmf/bibtex/bst/IEEEtran.bst
     89
     90 % #0 turns off the forced use of "et al."
     91 % #1 enables
     92 FUNCTION {default.is.forced.et.al} { #1 }
     93
     94
     95 % The maximum number of names that can be present beyond which an "et al."
     96 % usage is forced. Be sure that num.names.shown.with.forced.et.al (below)
     97 % is not greater than this value!
     98 % Note: There are many instances of references in IEEE journals which have
     99 % a very large number of authors as well as instances in which "et al." is
    100 % used profusely.
    101 FUNCTION {default.max.num.names.before.forced.et.al} { #6 }
    102
    103
    104 % The number of names that will be shown with a forced "et al.".
    105 % Must be less than or equal to max.num.names.before.forced.et.al
    106 FUNCTION {default.num.names.shown.with.forced.et.al} { #6 }
    107
  ```

- Turns off the "dashification" of repeated names.

  ``` json /Users/lincoln/Library/texmf/bibtex/bst/IEEEtran.bst
    124
    125 % #0 turns off the "dashification" of repeated (i.e., identical to those
    126 % of the previous entry) names. The IEEE normally does this.
    127 % #1 enables
    128 FUNCTION {default.is.dash.repeated.names} { #0 }
    129
  ```

## Python with Sublime

__Packages__:

- [Virtualenv](https://github.com/AdrianLC/sublime-text-virtualenv)

  Install by __Package Control__

  __Usage__:

  - `⌘ + ⇧ + P` & Choose `virtualenv: Activate` & Select the target virtualenv.
  - `⌘ + B` & Choose `Python + Virtualenv`

- [Pylinter](https://github.com/biermeester/Pylinter)

  Install by __Package Control__

  __Setup__:

  ``` json
    {
        // The full path to the Python executable you want to
        // run Pylint with or simply use 'python'.
        "python_bin": "python",
        // The following paths will be added Pylint's Python path
        "python_path": [
                        "/usr/local/opt/python/libexec/bin/python",
                    ],
        // Full path to the lint.py module in the pylint package
        "pylint_path": "/usr/local/lib/python2.7/site-packages/pylint",
        // Optional full path to a Pylint configuration file
        "pylint_rc": null,
        // Set to true to use graphical error icons
        "use_icons": true,
        "disable_outline": false,
        // Status messages stay as long as cursor is on an error line
        "message_stay": true,
        // a list of strings of individual errors to disable, ex: ["C0301"]
        "disable": [],
    }
  ```

  __Usage__:

  - `⌘ + ⌥ + Z`: Run
  - `⌘ + ⌥ + I`: Add ignore
  - `⌘ + ⌥ + C`: See all Pylint errors

- [AutoPEP8](https://github.com/wistful/SublimeAutoPEP8)

  Install by __Package Control__

  __Setup__:

  ``` json
    {
        // Do not fix these errors / warnings(e.g. E4, W)
        "ignore": "",

        // Specifies whether or not format files once they saved.
        "format_on_save": true,

        // If value is false(default)
        // then formatter doesn't treat absence of bottom empty line as an error
        // and doesn't try to fix it.
        "avoid_new_line_in_select_mode": true,
    }
  ```

  __Usage__:

  - `⌃ + ⇧ + 8`: Format
  - `⌃ + 8`: Preview

### Change Tab into blank on Save

- Save the following code as `ExpandTabsOnSave.py` and save in path `/Users/lincoln/Library/Application Support/Sublime Text 3/Packages/ExpandTabsOnSave/`

``` py
import os

import sublime
import sublime_plugin

class ExpandTabsOnSave(sublime_plugin.EventListener):
    def on_pre_save(self, view):
    if view.settings().get('expand_tabs_on_save') == 1:
        view.window().run_command('expand_tabs')
```

or

``` sh
cat >> '/Users/lincoln/Library/Application Support/Sublime Text 3/Packages/ExpandTabsOnSave/ExpandTabsOnSave.py' << EOF
import os

import sublime
import sublime_plugin

class ExpandTabsOnSave(sublime_plugin.EventListener):
    def on_pre_save(self, view):
    if view.settings().get('expand_tabs_on_save') == 1:
        view.window().run_command('expand_tabs')
EOF
```

- Configure the user setting

```json
    {
        "translate_tabs_to_spaces": true,
        "trim_trailing_white_space_on_save": true,
        "expand_tabs_on_save": true,
        ...
    }
```

## Java with Sublime

__Prepare__:

Install [jdk](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

__Package__:

...

__Build java file & run__:

Create a new build system: `Tools -> Build System -> New Build System...`

``` json
{
    "shell_cmd": "javac -encoding utf-8 $file_name && java $file_base_name",

    "file_regex": "^ *\\[javac\\] (.+):([0-9]+):() (.*)$",

    "selector": "source.java",

    "encoding": "utf-8"
}
```

## Some useful packages

- CTags

  `brew install ctags`

  then install Ctags by package control

- [Compare Side by Side](https://github.com/DougTy/sublime-compare-side-by-side)
- [DashDoc](https://github.com/farcaller/DashDoc#readme)
