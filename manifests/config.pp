# == Class: pureftpd::config
#
# Manages the `pure-ftpd.conf` file.  This class should be considered private.
#
class pureftpd::config (
    $ipv4only           = undef,
    $ipv6only           = undef,
    $chrooteveryone     = undef,
    $brokenclientscompatibility = undef,
    $daemonize          = undef,
    $verboselog         = undef,
    $displaydotfiles    = undef,
    $anonymousonly      = undef,
    $noanonymous        = undef,
    $dontresolve        = undef,
    $anonymouscancreatedirs     = undef,
    $natmode            = undef,
    $calluploadscript   = undef,
    $antiwarez          = undef,
    $allowuserfxp       = undef,
    $allowanonymousfxp  = undef,
    $prohibitdotfileswrite      = undef,
    $prohibitdotfilesread       = undef,
    $allowdotfiles      = undef,
    $autorename         = undef,
    $anonymouscantupload        = undef,
    $logpid             = undef,
    $nochmod            = undef,
    $keepallfiles       = undef,
    $createhomedir      = undef,
    $norename           = undef,
    $customerproof      = undef,
    $notruncate         = undef,
    $fscharset          = undef,
    $clientcharset      = undef,
    $syslogfacility     = undef,
    $fortunesfile       = undef,
    $forcepassiveip     = undef,
    $bind               = undef,
    $anonymousbandwidth = undef,
    $userbandwidth      = undef,
    $trustedip          = undef,
    $altlog             = undef,
    $pidfile            = undef,
    $tlsciphersuite     = undef, # added post 1.0.31
    $maxidletime        = undef,
    $maxdiskusage       = undef,
    $trustedgid         = undef,
    $maxclientsnumber   = undef,
    $maxclientsperip    = undef,
    $maxload            = undef,
    $minuid             = undef,
    $tls                = undef,
    $limitrecursion     = undef,
    $passiveportrange   = undef,
    $anonymousratio     = undef,
    $userratio          = undef,
    $umask              = undef,
    $quota              = undef,
    $peruserlimits      = undef,
    $ldapconfigfile     = undef,
    $mysqlconfigfile    = undef,
    $pgsqlconfigfile    = undef,
    $puredb             = undef,
    $extauth            = undef,
    $pamauthentication  = undef,
    $unixauthentication = undef,) inherits pureftpd::params {
    # options taken from pure-ftpd-1.0.30/configuration-file/pure-config.pl
    [
        'IPV4Only',
        'IPV6Only',
        'ChrootEveryone',
        'BrokenClientsCompatibility',
        'Daemonize',
        'VerboseLog',
        'DisplayDotFiles',
        'AnonymousOnly',
        'NoAnonymous',
        'DontResolve',
        'AnonymousCanCreateDirs',
        'NATmode',
        'CallUploadScript',
        'AntiWarez',
        'AllowUserFXP',
        'AllowAnonymousFXP',
        'ProhibitDotFilesWrite',
        'ProhibitDotFilesRead',
        'AllowDotFiles',
        'AutoRename',
        'AnonymousCantUpload',
        'LogPID',
        'NoChmod',
        'KeepAllFiles',
        'CreateHomeDir',
        'NoRename',
        'CustomerProof',
        'NoTruncate',
        'FSCharset',
        'ClientCharset',
        'SyslogFacility',
        'FortunesFile',
        'ForcePassiveIP',
        'Bind',
        'AnonymousBandwidth',
        'UserBandwidth',
        'TrustedIP',
        'AltLog',
        'PIDFile',
        'TLSCipherSuite',
        'MaxIdleTime',
        'MaxDiskUsage',
        'TrustedGID',
        'MaxClientsNumber',
        'MaxClientsPerIP',
        'MaxLoad',
        'MinUID',
        'TLS',
        'LimitRecursion',
        'PassivePortRange',
        'AnonymousRatio',
        'UserRatio',
        'Umask',
        'Quota',
        'PerUserLimits',
        'LDAPConfigFile',
        'MySQLConfigFile',
        'PGSQLConfigFile',
        'PureDB',
        'ExtAuth',
        'UnixAuthentication',
        'PAMAuthentication',
        ].each |$key| {
        if !empty(inline_template('<%= scope.lookupvar(@key.downcase) %>')) {
            file { "${pureftpd::params::config_dir}/conf/${key}":
                ensure  => file,
                owner   => 'root',
                group   => 'root',
                replace => 'yes',
                content => inline_template('<%= scope.lookupvar(@key.downcase) %>'),
            }
        }
    }
}
