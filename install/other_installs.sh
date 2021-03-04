sh ./pamac.sh

git clone https://github.com/iochen/v2gen/ && cd v2gen
env GOPRIVATE=github.com/v2ray/v2ray-core go build ./cmd/v2gen

# Install st
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install

sudo pip intstall jupyter-notebook
