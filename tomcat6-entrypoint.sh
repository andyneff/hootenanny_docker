
# Run Tomcat 6 as this user ID and group ID
TOMCAT6_USER=tomcat6
TOMCAT6_GROUP=tomcat6

CATALINA_BASE="/var/lib/tomcat6"
CATALINA_PID="/var/run/tomcat6.pid"

mkdir -p "$CATALINA_BASE"/logs
chmod 770 "$CATALINA_BASE"/logs
touch "$CATALINA_PID" "$CATALINA_BASE"/logs/catalina.out
chown $TOMCAT6_USER "$CATALINA_PID" "$CATALINA_BASE"/logs/catalina.out

cd "/var/lib/tomcat6"


TOMCAT6_USER=tomcat6 TOMCAT6_GROUP=tomcat6 HOOT_HOME=/home/vagrant/hoot LD_LIBRARY_PATH=/usr/local/lib:/home/vagrant/hoot/lib:/lib/::/usr/local/lib:/home/vagrant/hoot/lib:/home/vagrant/hoot/pretty-pipes/lib GDAL_DATA=/usr/local/share/gdal GDAL_LIB_DIR=/usr/local/lib HOOT_WORKING_NAME=hoot PATH=/home/vagrant/hoot/bin:/home/vagrant/hoot/bin/:/home/vagrant/bin:/home/vagrant/bin:/usr/local/lib:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/vagrant/hoot/bin:/home/vagrant/hoot/bin:/home/vagrant/hoot/bin:/home/vagrant/.gem/ruby/1.9.1/bin:/home/vagrant/bin:/home/vagrant/hoot/bin:/home/vagrant/.gem/ruby/1.9.1/bin:/home/vagrant/bin:/home/vagrant/hoot/bin:/home/vagrant/.gem/ruby/1.9.1/bin:/home/vagrant/bin

sudo -u $TOMCAT6_USER -g $TOMCAT6_GROUP \
JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64" \
CATALINA_HOME="/usr/share/tomcat6" \
CATALINA_BASE="/var/lib/tomcat6" \
JAVA_OPTS="-Djava.awt.headless=true -Xms512m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=4096m -XX:+UseConcMarkSweepGC" \
CATALINA_PID="/var/run/tomcat6.pid" \
CATALINA_TMPDIR="/tmp/tomcat6-tomcat6-tmp" \
LANG="" \
JSSE_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre/" \
TOMCAT6_USER=tomcat6 \
TOMCAT6_GROUP=tomcat6 \
HOOT_HOME=/home/vagrant/hoot \
LD_LIBRARY_PATH=/usr/local/lib:/home/vagrant/hoot/lib:/lib/:/usr/local/lib:/home/vagrant/hoot/lib:/home/vagrant/hoot/pretty-pipes/lib \
GDAL_DATA=/usr/local/share/gdal \
GDAL_LIB_DIR=/usr/local/lib \
HOOT_WORKING_NAME=hoot \
PATH=/home/vagrant/hoot/bin:/home/vagrant/hoot/bin/:/home/vagrant/bin:/home/vagrant/bin:/usr/local/lib:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/vagrant/hoot/bin:/home/vagrant/hoot/bin:/home/vagrant/hoot/bin:/home/vagrant/.gem/ruby/1.9.1/bin:/home/vagrant/bin:/home/vagrant/hoot/bin:/home/vagrant/.gem/ruby/1.9.1/bin:/home/vagrant/bin:/home/vagrant/hoot/bin:/home/vagrant/.gem/ruby/1.9.1/bin:/home/vagrant/bin \
/usr/share/tomcat6/bin/catalina.sh run

