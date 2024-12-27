# Termux-SMS-GUI ✉️
## Send SMS message via GUI window...
The script allows you to **send SMS messages** in the **graphic window in Termux**. Coreutils (built-in), Bash, Termux-Uap, Zenity, GTK2/3 packages and a configured graphic environment, VNC and Termux applications are required for its operation.

To send messages, the script uses the Termux-SMS-Send command, to which the parameters collected by Zenity dialog boxes are transferred.

![screenshot](/img1.png)

## Installation and startup ...
The repository has an installation script that transfers all other files and updates the desktop entries database.

To start and install the package, you must perform:

```
git clone https://github.com/BuriXon-code/Termux-SMS-GUI
cd Termux-SMS-GUI
chmod +x install.sh
./install.sh
```

After completing the **install.sh** script, you can do:


```
sms-gui
```

or

```
sms-gui 2>/dev/null  ### To get rid of garbage related to GTK errors.
```

or

You can search for "**SMS**" on the list of installed applications/packages and run.

> [!WARNING]
> Due to the reduced speech compatibility of the zenity versions with XFCE4, Fluxbox etc., the dialog box can be delayed. Pressing the zenity icon several times on the application panel (minimizing and maximizing) helps the windows to appear.
> I am currently working on solving the problem.

## What is sms.desktop file?...

The SMS.Desktop file is a file that in the appropriate location allows you to run the script as an application from the icon in the application menu or from the desktop icon.

The file is automatically moved and the appropriate permissions are given by the installation script install.sh.

![screenshot](/img2.png)

## Compatibility...

The script is compatible with **Termux**, equipped with **bash**, **termux-api**, **zenity**, **vncserver**, **GTK2/3** installed.

The script was tested with Polish phone numbers, with and without directional numbers.

In case of errors/problems with the script, let me know: **support@burixon.com.pl**.

