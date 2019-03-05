# Latex on Mac

[TOC]

## Install Latex

Install [MaxTex](http://www.tug.org/mactex/) & [BibDesk](http://bibdesk.sourceforge.net/)

## Work with Text Editors

### Work with Sublime Text 3

__Prepare__:

Install [skim](http://skim-app.sourceforge.net/)

__extensions__:

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

### Work with VS Code

__Extension__:

- [`LaTex Workshop`](https://github.com/James-Yu/LaTeX-Workshop/)

  __Usage__:

  - `⌘ + S`: Auto build the file.

## Set Latex Bibstyle

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
    106 FUNCTION {default.num.names.shown.with.forced.et.al} { #1 }
    107
  ```

- Italicized the _et al._ in references.

  ``` json /Users/lincoln/Library/texmf/bibtex/bst/IEEEtran.bst
    193 ...
    194 FUNCTION {bbl.etal}{ "\textit{et~al.}" }
    195 ...
  ```

- Turns off the __dashification__ of repeated names.

  ``` json /Users/lincoln/Library/texmf/bibtex/bst/IEEEtran.bst
    124
    125 % #0 turns off the "dashification" of repeated (i.e., identical to those
    126 % of the previous entry) names. The IEEE normally does this.
    127 % #1 enables
    128 FUNCTION {default.is.dash.repeated.names} { #0 }
    129
  ```