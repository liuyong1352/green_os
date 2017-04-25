
cd ~ 
mkdir install
cd install

git clone https://github.com/vertis/objconv.git
cd objconv
g++ -o objconv -O2 src/*cpp
mv objconv /usr/local/sbin
cd ../../
rm -rf ~/install
