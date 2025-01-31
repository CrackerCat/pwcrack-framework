#!/usr/bin/env ruby
#
# Plugin lea
# Author L
# NOTE Added verification code
#

plugin 'md5decrypt' do 
  web_server 'https://md5decrypt.net'
  supported_algorithm :md4, :md5, :sha1, :sha256, :sha384, :sha512, :ntlm

  crack {
    data = {hash: passwd, decrypt: 'Decrypt'}

    enum_algorithm do |algorithm|
      path = algorithm == :md5 ? '/en/' : "/en/#{algorithm.capitalize}/"
      r = post(path, data)
      r.body.extract(%r[: <b>(.*?)</b><br/><br/>])
    end
  }
end

