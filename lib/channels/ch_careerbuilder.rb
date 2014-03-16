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

require_relative '../job'
require 'cb'

class ChCareerBuilder

  def initialize(args)
    @key = args['devkey']
    raise 'empty devkey' if @key.empty?
    @args = args
  end

  def fetch
    Cb.configure do |config|
      config.dev_key = @key
      config.time_out = 5
    end
    criteria = Cb.job_search_criteria
    if @args.has_key?('location')
      criteria.location = @args['location']
    end
    if @args.has_key?('country')
      criteria.country_code = @args['country']
    end
    if @args.has_key?('keywords')
      criteria.keywords = @args['keywords']
    end
    criteria.search.map { |entry|
      Job.new(
        "http://www.careerbuilder.com/JobSeeker/Jobs/JobDetails.aspx?Job_DID=#{entry.did}",
        entry.company_name, entry.title
      )
    }
  end

end
