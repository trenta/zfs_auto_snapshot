# @summary
#   This class handles zfs_auto_snapshot packages.
#
# @api private
#
class zfs_auto_snapshot::install {

  if $zfs_auto_snapshot::package_manage {

    package { $zfs_auto_snapshot::package_name:
      ensure => $zfs_auto_snapshot::package_ensure,
    }

  }

}
