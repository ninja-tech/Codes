#Downloading jdk
 wget http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz
#Downloading jre
 wget http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jre-7u71-linux-x64.tar.gz
#creating directory at /usr/local/java
 sudo mkdir -p /usr/local/java
#copying jdk to java directory
sudo cp -r jdk-7u71-linux-x64.tar.gz /usr/local/java
#copying jre to java directory
sudo cp -r jre-7u71-linux-x64.tar.gz /usr/local/java
#changing directory to /usr/local java
cd /usr/local/java/
#untarring the jdk
sudo tar xvzf jdk-7u71-linux-x64.tar.gz
#untarring the jre
 sudo tar xvzf jre-7u71-linux-x64.tar.gz
#setting environment variables for java
echo "JAVA_HOME=/usr/local/java/jdk1.7.0_71" |  sudo  tee -a /etc/profile
echo "JRE_HOME=/usr/local/java/jre1.7.0_71" | sudo tee -a /etc/profile
echo "PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin" | sudo tee -a /etc/profile
echo "export JAVA_HOME" | sudo tee -a /etc/profile
echo "export JRE_HOME" | sudo tee -a /etc/profile
echo "export PATH" | sudo tee -a /etc/profile
#informing system about location of java
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jre1.7.0_71/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.7.0_71/bin/javac" 1 
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jre1.7.0_71/bin/javaws" 1
#Making Oracle java as default java
sudo update-alternatives --set java /usr/local/java/jre1.7.0_71/bin/java 
sudo update-alternatives --set javac /usr/local/java/jdk1.7.0_71/bin/javac 
sudo update-alternatives --set javaws /usr/local/java/jre1.7.0_71/bin/javaws 
#reloading system wide path
 . /etc/profile

###############################################################################################

#java for google chrome
sudo mkdir -p /opt/google/chrome/plugins 
cd /opt/google/chrome/plugins 
sudo ln -s /usr/local/java/jre1.7.0_71/lib/amd64/libnpjp2.so


#java for mozilla firefox
sudo mkdir -p /usr/lib/mozilla/plugins
cd /usr/lib/mozilla/plugins 
sudo ln -s /usr/local/java/jre1.7.0_71/lib/amd64/libnpjp2.so
