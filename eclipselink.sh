#!/bin/bash


set -e -x


source ~/.bashrc

###CREATE USER 'elink_rw'@'%' IDENTIFIED BY 'p0yvasd23';
###CREATE DATABASE eclipselink;
###GRANT ALL PRIVILEGES ON eclipselink.* TO 'elink_rw'@'%' IDENTIFIED BY 'p0yvasd23' WITH GRANT OPTION;



export ANT_HOME=$(pwd)/buildstuff/apache-ant-1.7.1
export M2_HOME=$(pwd)/buildstuff/apache-maven-3.0.5

export BUILDSTUFF=$(pwd)/buildstuff

# Branch from tag/2.5.2 (9ad6abde31d9e01e5a1c8780c046fafd93fcbc0c)
rm -rf $(pwd)/buildstuff
mkdir -p $(pwd)/buildstuff
wget -O $(pwd)/buildstuff/bnd-0.0.384.jar http://central.maven.org/maven2/biz/aQute/bnd/0.0.384/bnd-0.0.384.jar
wget -O $(pwd)/buildstuff/junit-4.8.2.jar http://alm-build:8080/nexus/content/repositories/central/junit/junit/4.8.2/junit-4.8.2.jar
wget -O $(pwd)/buildstuff/apache-ant-1.7.1-bin.zip http://archive.apache.org/dist/ant/binaries/apache-ant-1.7.1-bin.zip
(cd $(pwd)/buildstuff; unzip apache-ant-1.7.1-bin.zip)

wget -O $(pwd)/buildstuff/apache-maven-3.0.5-bin.zip http://www.carfab.com/apachesoftware/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.zip
(cd $(pwd)/buildstuff; unzip apache-maven-3.0.5-bin.zip)

wget -O $(pwd)/buildstuff/mysql-connector-java-5.1.34.zip http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.34.zip
(cd $(pwd)/buildstuff; unzip mysql-connector-java-5.1.34.zip)

# Modify antbuild.properties (Use absolute paths)
sed -e "s/junit\.lib=.*/junit.lib=$(pwd | sed -e 's/\//\\\//g')\/buildstuff\/junit-4.8.2.jar/" $(pwd)/antbuild.properties > ${HOME}/build.properties
echo "bndtool.lib=$(pwd)/buildstuff/bnd-0.0.384.jar" >> ${HOME}/build.properties

echo "db.driver com.mysql.jdbc.Driver" >> ${HOME}/build.properties
echo "db.name eclipselink" >> ${HOME}/build.properties
echo "db.platform org.eclipse.persistence.platform.database.MySQLPlatform" >> ${HOME}/build.properties
echo "db.pwd  p0yvasd23" >> ${HOME}/build.properties
echo "db.url  jdbc:mysql://localhost/eclipselink" >> ${HOME}/build.properties
echo "db.user elink_rw" >> ${HOME}/build.properties 

echo "jdbc.driver.jar $BUILDSTUFF/mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar" >> ${HOME}/build.properties
echo "jdbc.driver.lib $BUILDSTUFF/mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar" >> ${HOME}/build.properties
echo "jdbc.driver.lib.dir $BUILDSTUFF/mysql-connector-java-5.1.34"  >> ${HOME}/build.properties
echo "jdbc.jar.exist  true" >> ${HOME}/build.properties
echo "max.heap.memory 2048m" >> ${HOME}/build.properties
echo "min.heap.memory 2048m" >> ${HOME}/build.properties
echo "user.country US" >> ${HOME}/build.properties

# Link (or copy) antbuild.properties to $HOME/build.properties
# ln -s $(pwd)/antbuild.properties $HOME/build.properties

# Build fails if this is missins
mkdir -p $(pwd)/utils/eclipselink.utils.jaxb/resource

# Run the build

#sh -x $(pwd)/buildstuff/apache-ant-1.7.1/bin/ant -f antbuild.xml clean build
#sh -x $(pwd)/buildstuff/apache-ant-1.7.1/bin/ant -f antbuild.xml test-core
#sh -x $(pwd)/buildstuff/apache-ant-1.7.1/bin/ant -f antbuild.xml test-jpa


sh -x $(pwd)/buildstuff/apache-ant-1.7.1/bin/ant -f antbuild.xml clean build-eclipselink-jar

# cleanup
rm -f ${HOME}/build.properties
rm -rf $(pwd)/buildstuff
