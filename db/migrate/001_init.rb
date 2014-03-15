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

Sequel.migration do
  up do
    execute '''
    CREATE TABLE area (
      id SERIAL PRIMARY KEY,
      name VARCHAR(120) UNIQUE NOT NULL,
      sources TEXT NOT NULL
    )
    '''
    execute '''
    CREATE TABLE office (
      id SERIAL PRIMARY KEY,
      name VARCHAR(120) UNIQUE NOT NULL
    )
    '''
    execute '''
    CREATE TABLE job (
      id SERIAL PRIMARY KEY,
      area INTEGER REFERENCES area(id),
      office INTEGER REFERENCES office(id),
      uri VARCHAR(1024) UNIQUE NOT NULL,
      date TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
      title VARCHAR(1024) NOT NULL
    )
    '''
  end

  down do
    execute 'DROP TABLE job'
    execute 'DROP TABLE office'
    execute 'DROP TABLE area'
  end
end