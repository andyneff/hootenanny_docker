cd /opt/hoot

USER="tomcat6"
HOOT_HOME="/opt/hoot"
APP_DIR="$HOOT_HOME/node-mapnik-server"
NODE_APP="app.js"
STYLE="hoot_style.xml"
# Change the port as needed
PORT="8000"
PREREQS="source $HOOT_HOME/SetupEnv.sh && source $HOOT_HOME/conf/DatabaseConfig.sh"
LOG_DIR="$APP_DIR/log"
LOG_FILE="$LOG_DIR/app.log"
NODE_EXEC=$(which node)

echo "Starting tomcat..."
sudo service tomcat6 restart
echo "Starting node app..."

