echo "junit.lib=$HOME/projects/eclipselink.runtime/extension.lib.external/junit-4.8.2.jar:$HOME/projects/eclipselink.runtime/extension.lib.external/hamcrest-core-1.3.jar"
echo "db.driver com.mysql.jdbc.Driver" >> ${HOME}/build.properties
echo "db.name eclipselink" >> ${HOME}/build.properties
echo "db.platform org.eclipse.persistence.platform.database.MySQLPlatform" >> ${HOME}/build.properties
echo "db.pwd  p0yvasd23" >> ${HOME}/build.properties
echo "db.url  jdbc:mysql://localhost/eclipselink" >> ${HOME}/build.properties
echo "db.user elink_rw" >> ${HOME}/build.properties 

echo "jdbc.driver.jar /usr/local/Cellar/mysql-connector-java/5.1.32/libexec/mysql-connector-java-5.1.32-bin.jar" >> ${HOME}/build.properties
echo "jdbc.driver.lib /usr/local/Cellar/mysql-connector-java/5.1.32/libexec/mysql-connector-java-5.1.32-bin.jar" >> ${HOME}/build.properties
echo "jdbc.driver.lib.dir /usr/local/Cellar/mysql-connector-java/5.1.32"  >> ${HOME}/build.properties
echo "jdbc.jar.exist  true" >> ${HOME}/build.properties
echo "max.heap.memory 2048m" >> ${HOME}/build.properties



###brew tap gbeine/homebrew-java
###brew install mysql
###brew install mysql-connector-java


###CREATE USER 'elink_rw'@'%' IDENTIFIED BY 'p0yvasd23';
###CREATE DATABASE eclipselink;
###GRANT ALL PRIVILEGES ON eclipselink.* TO 'elink_rw'@'%' IDENTIFIED BY 'p0yvasd23' WITH GRANT OPTION;

####brew install maven30
###brew install ant

###In ~/.zshrc

###export M2_HOME="/usr/local/Cellar/maven30/3.0.5/libexec"
###export ANT_HOME="/usr/local/Cellar/ant/ant/1.9.4/libexec"
