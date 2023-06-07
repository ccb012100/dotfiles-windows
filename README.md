# dotfiles-windows

Configuration files for Windows

Run the `copydotfiles.bat` script to copy files from `%HOMEPATH%` into the repo's `HOMEPATH` folder.

## `kmonad`

### Run on Windows login

Use **Task Scheduler** to run the program on login.

The important bit:

```xml
<Actions Context="Author">
    <Exec>
        <Command>C:\Users\chris\AppData\Roaming\local\bin\kmonad.exe</Command>
        <Arguments>%HOMEPATH%\.config\kmonad\dell_latitude.kbd</Arguments>
    </Exec>
</Actions>
```
