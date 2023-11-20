# 配置文件

## 常规配置
1. build-essensial
2. cmake  -> build & install
3. git
4. vim -> .vimrc
5. oh-my-zsh

## Ubuntu 20 LTS安装Mysql
1. 更新rep
```bash
sudo apt update
```

2. 下载mysql-server, server即可，通常不需要client
```bash
sudo apt install mysql-server
```

3. 安装完成后验证是否以运行 
```bash
# 查询mysql运行状态
sudo service mysql status
#在WSL中安装时，可能是未启动状态，尝试运行下面的命令来启动
sudo service mysql start
```

4. root账号登录，免密
```bash
sudo mysql
```

5. 创建新用户<br/>
```bash
# 查看已有的用户
SELECT User, Host FROM mysql.user
# 创建新用户
CREATE USER 'user'@'host' IDENTIFIED BY 'password';
# user: 用户名
# host: local表示本地用户，%通配符表示允许从任意主机登录(各种远程连接等方式)
# password: 密码
```

6. 给与全Table的访问权限
```bash
GRANT ALL ON *.* TO 'user'@'domain';
# *.*为通配符，即对所有的表给与权限，也可以给指定的某张表给与权限 Schema.Table
```

7. 退出后用新账户登录
```bash
exit
mysql -u [user] -p
password: [输入设定的密码]
```

### 问题记录
1. sudo service mysql start 无法正常启动，可能原因是因为有残留程序正在运行中
```bash
ps aux | grep mysql
# 将所有的残留程序关闭即可
sudo kill -9 [pid]
```
2. mysql基本命令
```bash
# 查看mysql运行状态
sudo service mysql status
# 启动mysql
sudo service mysql start
# 关闭mysql
sudo service mysql stop
# 设置开机自动启动mysql
sudo update-rc.d -f mysql defaults
# 取消开机自动启动
sudo update-rc.d -f mysql remove
```

## Ubuntu最新GCC
```shell
sudo apt-get update
sudo apt-get install build-essential software-properties-common -y
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update
sudo apt-get install gcc-snapshot -y
sudo apt-get update
sudo apt-get install gcc-11 g++-11 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 60 --slave /usr/bin/g++ g++ /usr/bin/g++-11

# To verify if it worked. Just type in your terminal
gcc -v
```

从源代码编译
```shell
# 相关依赖
sudo apt install libgmp-dev libmpfr-dev libmpc-dev
git clone --recursive git@github.com:gcc-mirror/gcc.git
cd gcc
git switch <version>
./configure

make -j4 install
# 设置优先级方便切换，默认用最高优先级
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 60 --slave /usr/bin/g++ g++ /usr/bin/g++-11
# 切换
sudo update-alternativess --config gcc
sudo update-alternativess --config g++
```

## Ubuntu下载boost
```shell
git clone --recursive git@github.com:boostorg/boost.git
cd boost
git checkout <version>
git submodule update --init
./bootstrap.sh
# ./b2
sudo ./b2 -j4 install

# 此时CMake的find_package()应该能够正常使用了

# headers only
./b2 headers
```
## Ubuntu CMake最新版
支持c++11的编译器<br/>
支持make命令

```shell
git clone git@github.com:Kitware/CMake.git
cd cmake
git checkout <version>
./bootstrap &&
make -j4 &&
sudo make install
```

## doxygen配置
没有配置flex和bison会无法编译

```bash
sudo apt-get install flex
sudo apt-get install bison

git clone https://github.com/doxygen/doxygen.git
cd doxygen
cmake -S . -B build
cd build
cmake -G "Unix Makefiles" ..
make
# 等待编译完成
make install
```

## git 创建远程分支
```bash
git switch <branch>
git push origin <branch>
# 将branch和远程的branch相关联，以后就可以直接用git push来推送branch的更新到远程了
git push --set-upstream origin <branch>
# Branch '<branch>' set up to track remote branch 'dev' from 'origin'.
```