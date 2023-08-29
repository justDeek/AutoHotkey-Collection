### Multi Clipboard

Provides multiple different clipboards to copy and paste from. This is very useful when you need to copy multiple different things in a more convenient way (like more than one field of a form to another form or multiple spreadsheet cells to other cells or sheets) or to keep track of different things you copied.

<details>
  <summary><b>Usage</b></summary>

Press Ctrl and any of the the number keys (0-9) to copy the current element to that clipboard. Press Ctrl and Shift and the same number key to paste the element from that clipboard.

If you want to cut out the current element instead of copying it, press Ctrl as well as Shift and the number key.

</details>

<details>
  <summary><b>Shortcuts</b></summary>

* `Ctrl + [0-9]` - Copy the selected elements to the specified clipboard
* `Ctrl + Shift + [0-9]` - Cut out the selected elements and copy them into the specified clipboard
* `Ctrl + Alt + [0-9]` - Paste the contents of the specified clipboard

</details>

<details>
  <summary><b>How it Works</b></summary>

When copying or cutting, it stores the current content of the clipboard in a global variable (its name containing the current key as suffix) while preserving the current clipboard content and when pasting, it restores the content of the clipboard from that variable.

</details>

<details>
  <summary><b>Alternatives</b></summary>

Alternatively you could use the [Ditto Clipboard Manager](https://ditto-cp.sourceforge.io/), which is a more powerful clipboard manager, but also more complex to use, as well as the built-in [Clipboard History](https://support.microsoft.com/en-us/windows/clipboard-in-windows-c436501e-985d-1c8d-97ea-fe46ddf338c6) added in Windows 10, which you can access by pressing `Win + V`; though I find this shortcut-approach more convenient and faster to use.

You could also use Ditto in addition to this script, but you should then remove the shortcuts for the first three number keys ([1-3]), as these shortcuts are reserved in Ditto (..iirc).

</details>