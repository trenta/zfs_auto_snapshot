# zfs_auto_snapshot
#
# Main class, includes all other classes.
#
# @param enabled
#   Whether zfs-auto-snapshots should be enabled. Default value: true.
#
# @param keep_15min_snaps
#   Number of snapshots with 15 minutes interval to keep.  If 0 then 15 minute snapshots will be disabled.  Default value: 4.
#
# @param keep_hourly_snaps
#   Number of snapshots with 1 hour interval to keep.  If 0 then hourly snapshots will be disabled.  Default value: 24.
#
# @param keep_daily_snaps
#   Number of snapshots with 1 day interval to keep.  If 0 then daily snapshots will be disabled.  Default value: 31.
#
# @param keep_weekly_snaps
#   Number of snapshots with 1 week interval to keep.  If 0 then weekly snapshots will be disabled.  Default value: 8.
#
# @param keep_monthly_snaps
#   Number of snapshots with 1 month interval to keep.  If 0 then monthly snapshots will be disabled.  Default value: 12.
#
# @param package_ensure
#   Whether to install the zfs-auto-snapshot package, and what version to install. 
#       Values: 'present', 'latest', or a specific version number.
#   Default value: 'present'.
#
# @param package_manage
#   Whether to manage the zfs-auto-snapshot package. Default value: true.
#
# @param package_name
#   Specifies the zfs-auto-snapshot package to manage. Default value: ['zfs-auto-snapshot']
#
class zfs_auto_snapshot (
  Boolean $enabled,
  Integer $keep_15min_snaps,
  Integer $keep_hourly_snaps,
  Integer $keep_daily_snaps,
  Integer $keep_weekly_snaps,
  Integer $keep_monthly_snaps,
  String $package_ensure,
  Boolean $package_manage,
  Array[String] $package_name,
) {

  contain zfs_auto_snapshot::install
  contain zfs_auto_snapshot::config

  Class['::zfs_auto_snapshot::install']
  -> Class['::zfs_auto_snapshot::config']
}
