#
# Add cluster specific environment variables in this file.
#

#
# Set Java options, i.e., -Dproperty=xyz
#
#JAVA_OPTS=

# IMPORTANT:
#    If you are running on Windows, then you must convert the file paths from Unix notations
#    Windows notations. For example,
# HIBERNATE_CONFIG_FILE="$CLUSTER_DIR/etc/hibernate.cfg-mysql.xml"
# if [[ ${OS_NAME} == CYGWIN* ]]; then
#    HIBERNATE_CONFIG_FILE="$(cygpath -wp "$HIBERNATE_CONFIG_FILE")"
# fi
# JAVA_OPTS=" --J=-Dgeode-addon.hibernate.config="

# To use Hibernate backed CacheWriterLoaderPkDbImpl, set the following property and
# configure CacheWriterLoaderPkDbImpl in the $CLUSTER_DIR/etc/cache.xml file.
# MySQL and PostgreSQL Hibernate configuration files are provided to get
# you started. You should copy one of them and enter your DB information.
# You can include your JDBC driver in the ../pom.xml file and run ./build_app
# which downloads and places it in the $GEODE_ADDON_WORKSPACE/lib
# directory. CLASSPATH includes all the jar files in that directory for
# the apps and clusters running in this workspace.
#
#JAVA_OPTS="$JAVA_OPTS -Dgeode-addon.hibernate.config=$CLUSTER_DIR/etc/hibernate.cfg-mysql.xml"
#JAVA_OPTS="$JAVA_OPTS -Dgeode-addon.hibernate.config=$CLUSTER_DIR/etc/hibernate.cfg-postgresql.xml"

#
# Set RUN_SCRIPT. Absolute path required.
# If set, the 'start_member' command will run this script instead of 'gfsh start server'.
# Your run script will inherit the following:
#    JAVA      - Java executable.
#    JAVA_OPTS - Java options set by geode-addon.
#    CLASSPATH - Class path set by geode-addon. You can include additional libary paths.
#                You should, however, place your library files in the plugins directories
#                if possible.
#  CLUSTER_DIR - This cluster's top directory path, i.e., /cygdrive/c/Users/dpark/Work/Geode/workspaces-cygwin/ws-wan/clusters/ln
#
# Run Script Example:
#    "$JAVA" $JAVA_OPTS com.newco.MyMember &
#
# Although it is not required, your script should be placed in the bin_sh directory.
#
#RUN_SCRIPT=$CLUSTER_DIR/bin_sh/your-script
