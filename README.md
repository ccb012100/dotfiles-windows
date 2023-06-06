# dotfiles-windows

Configuration files for Windows

Run the `copydotfiles.bat` script to copy files from `%HOMEPATH%` into the repo's `HOMEPATH` folder.

## `kanata`

### Run on Windows login

The [kanata](https://github.com/jtroo/kanata) keyboard remapper [won't automatically run on startup in
Windows](https://github.com/jtroo/kanata/discussions/193).

Use **Task Scheduler** to run the program on login.

The important bit:

```xml
<Actions Context="Author">
    <Exec>
        <Command>C:\Users\ccb012100\tools\kanata\target\release\kanata.exe</Command>
        <Arguments>--cfg ~/.config/kanata.kbd</Arguments>
    </Exec>
</Actions>
```
