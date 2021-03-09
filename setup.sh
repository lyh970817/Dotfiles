#!/bin/bash

bash ./install/install.sh
bash ./config.sh

# yandex-disk setup

cd autologin
bash autologin.sh
cd ..
cd Theme
bash ./theme.sh


