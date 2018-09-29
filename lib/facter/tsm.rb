require 'facter'
require 'timeout'

begin
  kernel = Facter.value(:kernel)
  if kernel == 'Linux'
    if File.exist?('/usr/bin/dsmc')
      tsm_q = Facter::Util::Resolution.exec("/usr/bin/dsmc q fi -date=5 -time=3 < /dev/null")
      if $?.exitstatus == 0
        tsm_access = true
      else
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
      tsm_version,tsm_release,tsm_level = %r{^\s+Client Version\s(\d+),\sRelease\s(\d+),\sLevel\s(\d+(.\d+)?)\s+$}.match(tsm_q).captures
      tsm_version + '.' + tsm_release + '.' + tsm_level
    end
  end
end

if tsm_access
  Facter.add(:tsm_filesystems) do
    setcode do
      h = Hash.new
      tsm_q.each_line do|row|
        if %r{^\s+\d+\s+(\d{4}.\d{2}.\d{2}\s\d{2}.\d{2}.\d{2})\s+(\S+)\s+(Current|Not Current)\s+(/\S*)\s*$}.match(row)
          last_incremental_date,filesystem_type,replication,filespace_name = %r{^\s+\d+\s+(\d{4}.\d{2}.\d{2}\s\d{2}.\d{2}.\d{2})\s+(\S+)\s+(Current|Not Current)\s+(/\S*)\s*$}.match(row).captures
          h[filespace_name] = last_incremental_date
        end
      end
      h
    end
  end
end
