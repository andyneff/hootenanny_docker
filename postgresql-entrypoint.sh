if [ -d /var/run/postgresql ]; then
  chmod 2775 /var/run/postgresql
else
  install -d -m 2775 -o postgres -g postgres /var/run/postgresql
  [ -x /sbin/restorecon ] && restorecon -R /var/run/postgresql || true
fi

sudo -u postgres -g postgres /usr/lib/postgresql/9.1/bin/postgres -D /var/lib/postgresql/9.1/main -c config_file=/etc/postgresql/9.1/main/postgresql.conf
