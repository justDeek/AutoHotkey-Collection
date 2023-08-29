### Move Selection To New Folder

This script moves the currently selected files in a Windows File Explorer window to a new folder of the name inserted in a temporary popup.

This is very useful for organizing unsorted files of all types into subfolders, to sort the files by category, date, or the like, without having to create the folder first and then moving the files into it manually (a similar functionality exists in MacOS).

<details>
  <summary><b>How it Works</b></summary>

It works by cutting out the selected files, creating a new folder with the name inserted in the popup, and pasting the files into the new folder.

It then returns to the current folder with backspace. This can be turned of if you want to remain in the new folder by removing the line `send {backspace}`.

It applies a few artificial delay between certain actions, because some explorer-specific operations aren't applied immediately, resulting in undesired behavior, if those delays would be removed.

</details>

<details>
  <summary><b>Shortcuts</b></summary>

* `Ctrl + Alt + N` - Create new folder and move selected files into it

</details>

<details>
  <summary><b>Side Note</b></summary>

I first tried a different approach that didn't rely on explorer-specific features and instead uses the clipboard as well as creating the new folder by getting the parent directory of the first selected item and moving the files directly, but that didn't always work as intended and had various side-effects, so I found this approach in the AutoHotkey forum and based this script of that instead.

That first approach can be found in the `_alt` sub-folder and if someone manages to get that to work properly, please let me know, because that would eliminate the need for the artificial delays, which would be quite dandy.

</details>