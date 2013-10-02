Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

#########################################################
#  The below section describes which packages will be  ##
#  loaded into the box. Please include only the        ##
#  needed packages per project. Defaults have been     ##
#  commented for convenience.                          ##
#########################################################

#include nginx
#include postgresql
#include gunicorn
