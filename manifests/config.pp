# @summary
#   This class handles configuration of the automation of snapshots
#
# @api private
#
class zfs_auto_snapshot::config {

  if $zfs_auto_snapshot::enabled and $zfs_auto_snapshot::keep_15min_snaps != 0 {
    file { '/etc/cron.d/zfs-auto-snapshot':
      ensure  => present,
      content => epp('zfs_auto_snapshot/zfs-auto-snapshot.cron.frequent.epp'),
    }
  }
  else {
    file { '/etc/cron.d/zfs-auto-snapshot':
      ensure => absent,
    }
  }
  if $zfs_auto_snapshot::enabled and $zfs_auto_snapshot::keep_hourly_snaps != 0 {
    file { '/etc/cron.hourly/zfs-auto-snapshot':
      ensure  => present,
      content => epp('zfs_auto_snapshot/zfs-auto-snapshot.cron.hourly.epp'),
    }
  }
  else {
    file { '/etc/cron.hourly/zfs-auto-snapshot':
      ensure => absent,
    }
  }
  if $zfs_auto_snapshot::enabled and $zfs_auto_snapshot::keep_daily_snaps !=0 {
    file { '/etc/cron.daily/zfs-auto-snapshot':
      ensure  => present,
      content => epp('zfs_auto_snapshot/zfs-auto-snapshot.cron.daily.epp'),
    }
  }
  else {
    file { '/etc/cron.daily/zfs-auto-snapshot':
      ensure => absent,
    }
  }
  if $zfs_auto_snapshot::enabled and $zfs_auto_snapshot::keep_weekly_snaps !=0 {
    file { '/etc/cron.weekly/zfs-auto-snapshot':
      ensure  => present,
      content => epp('zfs_auto_snapshot/zfs-auto-snapshot.cron.weekly.epp'),
    }
  }
  else {
    file { '/etc/cron.weekly/zfs-auto-snapshot':
      ensure => absent,
    }
  }
  if $zfs_auto_snapshot::enabled and $zfs_auto_snapshot::keep_monthly_snaps !=0 {
    file { '/etc/cron.monthly/zfs-auto-snapshot':
      ensure  => present,
      content => epp('zfs_auto_snapshot/zfs-auto-snapshot.cron.monthly.epp'),
    }
  }
  else {
    file { '/etc/cron.monthly/zfs-auto-snapshot':
      ensure => absent,
    }
  }

}
