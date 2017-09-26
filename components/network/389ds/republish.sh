#!/usr/bin/ksh

myexit() 
{
	echo "$1"
	exit 1;
}

# clean=clean
clean=

(cd moz-svrcore; gmake $clean publish) || myexit "failed moz-svrcore"
(cd mod_nss; gmake $clean publish) || myexit "failed mod_nss"
(cd adminutil; gmake $clean publish) || myexit "failed adminutil"
(cd jss; gmake $clean publish) || myexit "failed jss"
(cd mozldap; gmake $clean publish) || myexit "failed mozldap"
(cd ldapjdk; gmake $clean publish) || myexit "failed ldapjdk"
sudo pkg refresh --full
sudo pkg install mozldap ldap-jdk jss4 389-adminutil mod_nss

(cd idm-console-framework; gmake $clean publish) || myexit "failed idm-console-framework"
(cd perldap; gmake $clean publish) || myexit "failed perldap"
sudo pkg refresh --full
sudo pkg install idm-console-framework perldap

(cd admin; gmake $clean publish) || myexit "failed admin"
(cd base; gmake $clean publish) || myexit "failed base"
(cd admin-console; gmake $clean publish) || myexit "failed admin-console"
(cd console; gmake $clean publish) || myexit "failed console"
(cd ds-console; gmake $clean publish) || myexit "failed ds-console"


# moz-svrcore
