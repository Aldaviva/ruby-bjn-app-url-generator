require "rubygems"
require "bundler/setup"

require "json"
require "base32"

# Using alphabet from agnoster/base32-js
# https://github.com/agnoster/base32-js/blob/v0.0.6/lib/base32.js#L6
Base32.table = "0123456789abcdefghjkmnpqrtuvwxyz"

def createLaunchContext(meetingId, passcode=nil)
  {
    :meeting_id => meetingId.to_s.rjust(5, '0'), # mandatory, numeric meeting id
    :role_passcode => (passcode.to_s.rjust(4, '0') unless passcode.nil?), # optional, numeric meeting passcode
    
    :ctxver => "1.0.0", # mandatory, always 1.0.0

    :user_full_name => nil, # optional, defaults to the name of the logged-in user
    :user_email => nil, # optional, defaults to the email address of the logged-in user
    :user_token => nil, # optional, if you've already logged into Blue Jeans and received an API access token and want the app to be logged in as the same user
    
    :meeting_api => "https://bluejeans.com", # optional, always https://bluejeans.com
    :release_channel => "live" # optional, always live
  }
end

def createLaunchUrl(launchContext)
  encodedContext = Base32.encode(launchContext.to_json).sub(/=+$/, '')
  "bjn://meeting/#{encodedContext}?ctxver=#{launchContext[:ctxver]}"
end


meetingId = "10990"
passcode = "0000"
launchContext = createLaunchContext(meetingId, passcode)
launchUrl = createLaunchUrl(launchContext)

puts "Blue Jeans Desktop App launch URL generator"
puts "Meeting ID: #{meetingId}"
puts "Passcode:   #{passcode}"
puts "\nLaunch context:"
puts JSON.pretty_generate(launchContext)

puts "\nLaunch URL:"
puts createLaunchUrl(launchContext)
