require 'facter'
require 'timeout'

begin
  tsm_q = Facter::Util::Resolution.exec("dsmc q fi -date=5 -time=3 < /dev/null")
  if $?.exitstatus == 0
    tsm_access = true
  else
    tsm_access = false
  end
end

Facter.add(:tsm_version) do
  setcode do
    if tsm_access
      tsm_version,tsm_release,tsm_level = %r{^\s+Client Version\s(\d+),\sRelease\s(\d+),\sLevel\s(\d+(.\d+)?)\s+$}.match(tsm_q).captures
      tsm_version + '.' + tsm_release + '.' + tsm_level
    end
  end
end

Facter.add(:tsm_access) do
  setcode do
    tsm_access
  end
end

Facter.add(:tsm_filesystems) do
  setcode do
    h = Hash.new
    if tsm_access
      last_incremental_date,filesystem_type,filespace_name = %r{^\s+\d+\s+(\d{4}.\d{2}.\d{2}\s\d{2}.\d{2}.\d{2})\s+(\S+)\s+(\S+)\s+.*$}.match(tsm_q).captures
      h[filespace_name] = last_incremental_date
    end
    h
  end
end

    
