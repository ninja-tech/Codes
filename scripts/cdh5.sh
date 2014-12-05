#downloading 1 click manager
wget http://archive.cloudera.com/cdh5/one-click-install/trusty/amd64/cdh5-repository_1.0_all.deb
#installing it using dpkg
sudo dpkg -i cdh5-repository_1.0_all.deb
#Additional step for ubuntu trusty
 echo "Package: *" | sudo tee -a /etc/apt/preferences.d/cloudera.pref
echo "Pin: release o=Cloudera, l=Cloudera" | sudo tee -a /etc/apt/preferences.d/cloudera.pref
echo "Pin-Priority: 501" | sudo tee -a /etc/apt/preferences.d/cloudera.pref


 #adding repo keyfor 
curl -s http://archive.cloudera.com/cdh5/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -
#installing hadoop in pseudo-distributed mode with YARN
sudo apt-get update
sudo apt-get install hadoop-conf-pseudo
#adding java home at /etc/hadoop/conf/hadoop-env.sh
echo "JAVA_HOME=/usr/local/java/jdk1.7.0_71" | sudo tee -a /etc/hadoop/conf/hadoop-env.sh

echo "export JAVA_HOME" | sudo tee -a /etc/hadoop/conf/hadoop-env.sh
#formatting the namenode
sudo -u hdfs hdfs namenode -format

#starting hdfs
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done
#creating directories needed for hadoop processes
sudo /usr/lib/hadoop/libexec/init-hdfs.sh
#Verifying the HDFS File Structure
 sudo -u hdfs hadoop fs -ls -R /
#starting yarn
sudo service hadoop-yarn-resourcemanager start 
sudo service hadoop-yarn-nodemanager start 
sudo service hadoop-mapreduce-historyserver start
#creating user directories
sudo -u hdfs hadoop fs -mkdir /user/atul 
sudo -u hdfs hadoop fs -chown atul /user/atul
