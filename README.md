# coding-style-launcher
A shell script to check coding style with ease

### Dependencies
*Note: only one of the dependencies is required for the script to work)
* [Abricot-Norminette](https://github.com/Just1truc/Abricot-Norminette)
* [coding-style-checker](https://github.com/Epitech/coding-style-checker)

## Install / Reinstall
* As a script:

Simply download the `cs.sh` file and move it to your desired binary location

You can also copy these commands if you're lazy:

```
git clone https://github.com/Micka-DAOUD/coding-style-launcher.git
chmod +x coding-style-launcher/cs.sh 
sudo mv coding-style-launcher/cs.sh /usr/local/bin/
rm -rf coding-style-launcher/
```

* As a shell function:

In case you don't want to directly add the file as a binary, you can create a shell function directly in your .bashrc file.
You can copy these commands (**replace `~/.bashrc` by the config file you use**):

*Note: if you're reinstalling, make sure you've deleted the old function before installing it again*
```
git clone https://github.com/Micka-DAOUD/coding-style-launcher.git
cat coding-style-launcher/cs_function.sh >> ~/.bashrc
rm -rf coding-style-launcher/
```

*Note: this has only been tested in a .bashrc file, but it should work with whatever shell you use.*

## Uninstall
* As a script

Just remove the script by using this command (*of course, this won't work if you changed the installation name or path of the script*)

```sudo rm /usr/local/bin/cs.sh```

* As a shell function

You'll have to manually delete the function in your .rc file.

# How to use:

Firstly, make sure to be located in one of your Epitech repositories (Otherwise, the script will be useless).

After launching the script, it will search if you have Epitech's official [coding-style-checker](https://github.com/Epitech/coding-style-checker) or [abricot](https://github.com/Just1truc/Abricot-Norminette) installed.

You will then have to follow the instructions of the script according to which checker you want to launch.
