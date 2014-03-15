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

require_relative 'lib/areas'
require_relative 'lib/database'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'

use Rack::Auth::Basic, 'jobspotting' do |username, password|
  username == 'yegor' &&
    Digest::MD5.hexdigest(password) == '2a3dfa66c2d8e8c67b77f2a25886e3cf'
end

set :erb, :content_type => 'text/xml'

get '/' do
  @areas = Areas.new(Database.new.connect)
  erb :index
end

post '/' do
  Areas.new(Database.new.connect).create(params[:name], '{}')
  redirect '/'
end

get '/area/:id' do |id|
  @area = Areas.new(Database.new.connect).get(id)
  erb :area
end

post '/area/:id' do |id|
  areas = Areas.new(Database.new.connect)
  area = areas.get(id)
  areas.create(area.name, params[:sources])
  redirect "/area/#{id}"
end

