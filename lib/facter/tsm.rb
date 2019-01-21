require 'facter'
require 'timeout'

begin
  kernel = Facter.value(:kernel)
  if kernel == 'Linux'
    if File.exist?('/usr/bin/dsmc')
      begin
        tsm_q = Facter::Core::Execution.execute('/usr/bin/dsmc q fi -date=5 -time=3 < /dev/null', options = {:timeout => 5})
        tsm_access = if $CHILD_STATUS.exitstatus.zero?
                       true
                     else
                       false
                     end
      rescue Facter::Core::Execution::ExecutionFailure
        tsm_access = false
      end
    else
      tsm_access = false
    end
  end
end

Facter.add(:tsm_access) do
  setcode do
    tsm_access
  end
end

if tsm_access
  Facter.add(:tsm_version) do
    setcode do
      tsm_version, tsm_release, tsm_level = %r{^\s+Client Version\s(\d+),\sRelease\s(\d+),\sLevel\s(\d+(.\d+)?)\s+$}.match(tsm_q).captures
      tsm_version + '.' + tsm_release + '.' + tsm_level
    end
  end
end

if tsm_access
  Facter.add(:tsm_filesystems) do
    setcode do
      h = {}
      tsm_q.each_line do |row|
        # if %r{^\s+\d+\s+(\d{4}.\d{2}.\d{2}\s\d{2}.\d{2}.\d{2})\s+(\S+)\s+(Current|Not Current)\s+(/\S*)\s*$}.match(row)
        if %r{^\s+\d+\s+(\d{4}.\d{2}.\d{2}\s\d{2}.\d{2}.\d{2})\s+(\S+)\s+(Current|Not Current)\s+(/\S*)\s*$} =~ row
          last_incremental_date, _filesystem_type, _replication, filespace_name =
            %r{^\s+\d+\s+(\d{4}.\d{2}.\d{2}\s\d{2}.\d{2}.\d{2})\s+(\S+)\s+(Current|Not Current)\s+(/\S*)\s*$}.match(row).captures
        end
        h[filespace_name] = last_incremental_date
        # end
      end
      h
    end
  end
end
