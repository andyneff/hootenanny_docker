USER="vagrant"
HOOT_HOME="/home/vagrant/hoot"
APP_DIR="$HOOT_HOME/node-mapnik-server"
NODE_APP="app.js"
STYLE="hoot_style.xml"
# Change the port as needed
PORT="8000"
PREREQS="source $HOOT_HOME/SetupEnv.sh && source $HOOT_HOME/conf/DatabaseConfig.sh"
LOG_DIR="$APP_DIR/log"
LOG_FILE="$LOG_DIR/app.log"
NODE_EXEC=$(which node)

cd $HOOT_HOME

mkdir -p "$LOG_DIR"
chown $USER:$USER "$LOG_DIR"

sudo -i -u $USER bash -c "cd $HOOT_HOME && $PREREQS && cd $APP_DIR && $NODE_EXEC $APP_DIR/$NODE_APP $STYLE $PORT 1>$LOG_FILE 2>&1"
