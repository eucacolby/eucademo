include roles
node default {
}

node /euca.*/ inherits default{
   case $::role {
      ##
      ## Instal mysql, set the root password and
      ## get it started.
      ## Executed if the agent's /etc/role file contained
      ## 'mysql_server'
      ##
      mysql_server: {
         include mysql
         class { 'mysql::server':
            config_hash => { 'root_password' => 'eucapass'}
         }
      }
      ##
      ## Install apache, give it a basic configuration
      ## and get it started.
      ## Executed if the agent's /etc/role file contained
      ## 'apache_server'
      ##
      apache_server: {
         include apache
         apache::vhost {
            $::fqdn :
            priority        => '10',
            docroot        => '/etc/apache2/http',
            port            => '80',
         }
         file { '/etc/apache2' :
            ensure => 'directory',
         }
         file { '/etc/apache2/http' :
            ensure => 'directory',
         }
      }
      ##
      ## Agents that don't appear to have a role are
      ## left untouched. If running the self-evalution
      ## sequence you shouldn't hit this unless the agent
      ## requests a catalog before /etc/role is created
      ## of if "pluginsync='true'" wasn't defined in the
      ## agent's /etc/puppet/puppet.conf file.
      default: {
      }
   }
}
