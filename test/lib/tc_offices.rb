# Copyright (c) 2009-2014, Curiost.com
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met: 1) Redistributions of source code must retain the above
# copyright notice, this list of conditions and the following
# disclaimer. 2) Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following
# disclaimer in the documentation and/or other materials provided
# with the distribution. 3) Neither the name of the curiost.com nor
# the names of its contributors may be used to endorse or promote
# products derived from this software without specific prior written
# permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
# NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
# THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Author:: Yegor Bugayenko (mailto:yegor@tpc2.com)
# Copyright:: Copyright (c) 2009-2014, Curiost.com
# License:: Free to use and change if the author is mentioned

require_relative '../../lib/areas'
require_relative '../../lib/job'
require_relative '../../lib/jobs'
require_relative '../../lib/database'
require 'test/unit'
require 'ramcrest'

class OfficesTest < Test::Unit::TestCase

  include MiniTest::Assertions
  include Ramcrest::Comparable
  include Ramcrest::HasSize

  def test_create
    db = Database.new.connect
    json = '{"hey": 1}'
    area = Areas.new(db).create('offices_test', json)
    area.jobs.push(Job.new('#uri', 'IBM', 'Ruby developer'))
    offices = area.offices
    assert_that(offices.top, has_size(greater_or_equal_to(1)))
    assert_that(offices.top.first[:jobs], greater_or_equal_to(1))
  end

end