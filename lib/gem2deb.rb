# Copyright © 2011, Lucas Nussbaum <lucas@debian.org>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

if defined?(Encoding) && Encoding.default_external.name == 'US-ASCII'
  Encoding.default_external = 'UTF-8'
end

module Gem2Deb

  class CommandFailed < Exception
  end

  def run(cmd)
    puts(cmd) if $VERBOSE
    system(cmd)
    if $?.exitstatus != 0
      raise Gem2Deb::CommandFailed, "[#{cmd} failed!]"
    end
  end
end

require 'gem2deb/version'
