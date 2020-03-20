#USAGE: 
# $ sudo chmod +x ups.sh
# $ source ups.sh

#TO DO: 
# prevent the EV to be added to .bashrc if they already exist
# wait for user to confirm by pressing enter after reading cuda instructions
# automate for installing latest nvidia driver
# set options for multiple GPU and install mxnet
# set warning for installing py libraries outside venv

# Load User Configuration File
sudo chmod +x Pi-Setup/config.sh
source Pi-Setup/config.sh

# Run Options
function ups() {
  while [[ $# -gt 0 ]]
  do
    key="$1"
    case $key in
    
        -g|--github)
        # Sets all your Github Info
        git config --global user.email $git_email
        git config --global user.name $git_name
        echo "Your Git credentials are set $git_name"
        shift # ditch current key argument once read
        ;;
        
        -u|--update)
        sudo apt-get update
        sudo apt-get upgrade -y
        shift # ditch current  key argument once read
        ;;
        
        -v|--pysetup)
        # Install pip, virtualenv, and virtualenvwrapper
        wget https://bootstrap.pypa.io/get-pip.py
        sudo python3 get-pip.py
        sudo pip install virtualenv virtualenvwrapper
        sudo rm -rf get-pip.py ~/.cache/pip
        echo "[INFO] exporting virtual env path to .bashrc... "
        echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
        echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
        echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
        echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
        source ~/.bashrc
        shift # ditch current key argument once read
        ;;
        
        -b|--pylib)
        # Install Deep Learning Python Libraries
        pip install numpy
        pip install opencv-contrib-python
        pip install scipy matplotlib pillow
        pip install h5py requests progressbar2
        pip install scikit-learn scikit-image
        pip install tensorflow
        pip install keras
        shift # ditch current key argument once read
        ;;
        
        -setup |--setup)
        # Install development tools, image and video I/O libraries, GUI packages, optimization libraries, and other packages:
        sudo apt-get install build-essential cmake unzip pkg-config
        sudo apt-get install libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
        sudo apt-get install libjpeg-dev libpng-dev libtiff-dev
        sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
        sudo apt-get install libxvidcore-dev libx264-dev
        sudo apt-get install libgtk-3-dev
        sudo apt-get install libopenblas-dev libatlas-base-dev liblapack-dev gfortran
        sudo apt-get install libhdf5-serial-dev
        sudo apt-get install python3-dev python3-tk python-imaging-tk
        sudo apt-get install tree
        sudo apt-get install curl wget lynx w3m
        shift # ditch current key argument once read
        ;;
               
        -m |--mail)
        #NOT NEEDED
        # Install mailutils and ssmtp
        # sudo apt-get install mailutils
        # sudo apt-get install ssmtp
        # sudo sed -i "s/mailhub=mail/mailhub=$mailhub/g" /etc/ssmtp/ssmtp.conf
        # sudo sed -i "s/#rewriteDomain=/rewriteDomain=$maildomain/g" /etc/ssmtp/ssmtp.conf
        # sudo sed -i "s/#FromLineOverride=YES/FromLineOverride=YES/g" /etc/ssmtp/ssmtp.conf
        # sudo sed -i "\$s/$/\n\n# Email Credentials and Security/" /etc/ssmtp/ssmtp.conf
        # sudo sed -i "\$s/$/\nAuthUser=$mailuser/" /etc/ssmtp/ssmtp.conf
        # sudo sed -i "\$s/$/\nAuthPass=/" /etc/ssmtp/ssmtp.conf
        # sudo sed -i "\$s/$/\nUseTLS=YES/" /etc/ssmtp/ssmtp.conf
        # sudo sed -i "\$s/$/\nUseSTARTTLS=YES/" /etc/ssmtp/ssmtp.conf
        # shift # ditch current key argument once read
        ;;

        -f|--favorite)
        # Install favorite Browser, Editor, etc
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install ./google-chrome-stable_current_amd64.deb
        rm google-chrome-stable_current_amd64.deb
        shift # ditch current key argument once read
        ;;
        
        -cmd|-unix|--cmd|--unix)
        # Add MY CUSTOM UNIX COMMANDS shortcuts
        sudo chmod +x ~/Pi-Setup/.my_custom_unix_commands.sh
        echo "[INFO] loading MY CUSTOM UNIX COMMANDS to .bashrc... "
        echo -e "\n# MY CUSTOM UNIX COMMANDS" >> ~/.bashrc
        echo "source ~/Pi-Setup/.my_custom_unix_commands.sh" >> ~/.bashrc
        echo "[INFO] Done! Now restart terminal or open a new one"
        shift # ditch current key argument once read
        ;;
        
        -sec |--secure)
        # Set and Install Security Parameters
        echo "[INFO] Changing Default Username and Password..."
        sudo adduser $pi_username
        sudo adduser $pi_username sudo
        sudo cp -r /home/pi/* /home/laygond_pi/
        echo "[INFO] Installing fail2ban..."
        sudo apt-get install fail2ban
        #sudo sed -i "s/port =/port = $pi_port/g" ./jail.local
        #sudo cp ./jail.local /etc/fail2ban/jail.local
        #echo "verify if its working through /var/log/fail2ban.log"
        echo "[INFO] Switching Default Pi Port..."
        sed -i "s/#Port 22/Port $pi_port/g" /etc/ssh/sshd_config
        echo "Now you must <$ sudo service ssh restart> and <$ logout> for actions to take effect"
        echo "ssh next time like this:"
        echo "<ssh $pi_username@$(hostname -I) -p $pi_port>"
        echo "Once inside, remove pi user like this:"
        echo "<$sudo raspi-config> # Boot Options -> Desktop/ CLI -> console"
        echo "<$ sudo userdel -r pi>"
        shift # ditch current key argument once read
        ;;

        -share |--share)
        # Share Files through netatalk
        sudo apt-get install netatalk
        echo "Add now to File Manager < afp://$(hostname -I)>"
        shift # ditch current key argument once read
        ;;

        -res |--resolution)
        # Set Screen Dimensions
        echo "[INFO] Switching HDMI config at /boot/config.txt..."
        sed -i "s/#hdmi_group=1/hdmi_ignore_edid=0xa5000080\nhdmi_group=2/g" /boot/config.txt
        sed -i "s/#hdmi_mode=1/hdmi_mode=85/g" /boot/config.txt
        echo "You must <$ sudo reboot now> for actions to take effect"
        shift # ditch current key argument once read
        ;;
        
        *)    
        # unknown option
        echo "unknown option passed"
        shift # ditch current key argument once read
        ;;
    esac
  done
}


#--------------------------------------
# { # try

#     command1 &&
#     #save your output

# } || { # catch
#     # save log for exception 
# }

