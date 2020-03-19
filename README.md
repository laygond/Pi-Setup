[//]: # (Image References)
[image1]: ./README_images/demo.gif

# UUS
My Universal Usual Set-up (UUS). This is a template shell file for common bash commands bundled together for a faster and easier set up. Modify this template as you wish.

It includes all commands to set up Ubuntu 18.04 for Deep Learning with GPU

![alt text][image1]

Trust me! It saves you time specially if you need to set up several accounts or install commonly used packages in some cloud virtual machine where things get erased when you restart session.

## Directory Structure
```
.UUS
├── README.md
├── README_images                 # Images used by README.md
|   └── ...
├── uus.sh                        # main file
├── config.sh                     # user configuration file
└──.my_custom_unix_commands.sh    # personal list of bash commands
```

Then main goal here is to be productive so feel free to modify anything:
- `uus.sh` holds snippets of code to run in small batches. I added a favorite option so that you can add your favorite editor, browser, etc.
- `config.sh` must be modified according to the user. It holds the git credentials, cuda version, gpu flag, url links, etc. (I left mine there as an example)
- `.my_custom_unix_commands.sh` a place you can store your own personal unix commands while having a backup in GitHub. It is run by `uus.sh` through an option. 

## House Rules
- Whenever you see `<something>` , what this means is that you are to replace this with something useful. Replace the whole thing (including the < and >).
- Whenevery you see `[something]` this usually means that this something is optional. When you run the command you may put in the something or leave it out

## One time Setup
Open bash terminal
```sh
 $ cd ~ 
 $ git clone https://github.com/laygond/UUS 
 $ sudo chmod +x UUS/uus.sh 
```

## Usage
Always source file each time a new terminal session is open
```sh
 $ source ~/UUS/uus.sh
```
Now enjoy the commands (Option List below)
```sh
 $ uus [--option1] [--option2]
```
If no options are inserted then nothing happens.

## Example
```sh
 $ uus --github --update
```
or
```sh
 $ uus -g -u
```
is equivalent to running 
```sh
 $ git config --global user.email <your_git_email>
 $ git config --global user.name <your_git_name>
 $ sudo apt-get update
 $ sudo apt-get upgrade -y 
```

## Options Available

| Long Dash  | Short Dash | Description |
| ---------- | ---------- | ----------- |
| --github   | -g     | initializes email and username to git config | 
| --dropbox  | -d     | install and sets up dropbox uploader: uploads to dropbox from terminal | 
| --update   | -u     | ubuntu's update and upgrade of packages | 
| --pysetup  | -v     | install pip, virtualenv, and virtualenvwrapper |
| --pylib    | -b     | install Deep Learning Python Libraries |
| --setup    | -s     | install ubuntu development tools, image and video I/O libraries, GUI packages, optimization libraries, and other packages |
| --gpu      | -gpu   | install latest NVIDIA GPU Driver |
| --cuda     | -cuda  | install CUDA Toolkit |
| --cudnn    | -cudnn | install cuDNN library |
| --favorite | -f     | install favorite Browser, Editor, etc |
| --cmd, --unix | -cmd, -unix | sets up your CUSTOM UNIX COMMANDS shortcuts |     
| [--add_yours!] | [-?]  | [?] | 

Explore `uus.sh` file and modify the structure to add yours!! 

## Set up Ubuntu for Deep Learning (Example)
```sh
 $ uus -u
 $ uus -s
 $ uus -gpu
 $ uus -cuda
 $ uus -cudnn
 $ uus --pysetup
 $ mkvirtualenv myDeepEnv -p python3
 $ uus --pylib
 # Extra
 $ uus -g -d -f
 $ uus -cmd  
```

# Extra
## Make This Repo YOURS FOREVER
Create a new empty github repo and call it <your_repo_name>
Now return to where you cloned UUS and `$cd UUS`:
```sh
 $ rm -rf .git
 $ git init .
 $ git remote add origin https://github.com/<your_github_user_name>/<your_repo_name> #Use an existing (previously created) repo 
```
Then just push as you would normally do to your repo
```sh
 $ git add -A
 $ git commit -m "some nice comment"
 $ git push  # You may be asked to run something else ( like --set-upstream origin master) and insert password 
```

## Bash Theory to Remember
#### Variables
- $0 - The name of the Bash script.
- $1 - $9 - The first 9 arguments to the Bash script. (As mentioned above.)
- $# - How many arguments were passed to the Bash script.
- $@ - All the arguments supplied to the Bash script.
- $? - The exit status of the most recently run process.
- $$ - The process ID of the current script.
- $USER - The username of the user running the script.
- $HOSTNAME - The hostname of the machine the script is running on.
- $SECONDS - The number of seconds since the script was started.
- $RANDOM - Returns a different random number each time is it referred to.
- $LINENO - Returns the current line number in the Bash script.

More Info on Bash Here: [TUTORIAL](https://ryanstutorials.net/bash-scripting-tutorial/)
