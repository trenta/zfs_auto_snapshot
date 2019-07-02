require 'spec_helper'

describe 'zfs_auto_snapshot::install' do
  let(:pre_condition) { 'include zfs_auto_snapshot' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
