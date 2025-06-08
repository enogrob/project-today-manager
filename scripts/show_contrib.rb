#!/usr/bin/env ruby
# Fetch GitHub contributions via GraphQL and render a terminal heatmap similar to GitHub's calendar
require 'net/http'
require 'json'

# ANSI blocks for levels 0–4 (green heatmap)
LEVELS = [
  "\e[48;5;251m  \e[0m",  # 0: light gray
  "\e[48;5;120m  \e[0m",  # 1-9: light green
  "\e[48;5;34m  \e[0m",   # 10-19: medium green
  "\e[48;5;28m  \e[0m",   # 20-29: dark green
  "\e[48;5;22m  \e[0m"    # 30+: darkest green
]

QUERY = <<~GRAPHQL
  query($login: String!) {
    user(login: $login) {
      contributionsCollection {
        contributionCalendar {
          weeks {
            contributionDays {
              date
              contributionCount
            }
          }
        }
      }
    }
  }
GRAPHQL

def fetch_calendar(user, token)
  uri = URI('https://api.github.com/graphql')
  req = Net::HTTP::Post.new(uri)
  req['Authorization'] = "bearer #{token}"
  req['User-Agent'] = user
  req.content_type = 'application/json'
  req.body = { query: QUERY, variables: { login: user } }.to_json

  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end
  unless res.is_a?(Net::HTTPSuccess)
    abort "Error #{res.code}: #{res.body}" 
  end
  JSON.parse(res.body)
end

def pick_level(count)
  case count
  when 0 then 0
  when 1..9 then 1
  when 10..19 then 2
  when 20..29 then 3
  else 4
  end
end

if ARGV.empty?
  puts "Usage: show_contrib.rb <github_username>"
  exit 1
end
user = ARGV[0]
token = ENV['GITHUB_TOKEN'] || ENV['GITHUB_PERSONAL_ACCESS_TOKEN'] || abort('Please set GITHUB_TOKEN or GITHUB_PERSONAL_ACCESS_TOKEN')

data = fetch_calendar(user, token)
weeks = data.dig('data', 'user', 'contributionsCollection', 'contributionCalendar', 'weeks')

# transpose to 7 rows (Sun->Sat)
rows = Array.new(7) { [] }
weeks.each do |week|
  week['contributionDays'].each_with_index do |day, i|
    lvl = pick_level(day['contributionCount'])
    rows[i] << LEVELS[lvl]
  end
end

# print Sunday (row 0) to Saturday (row 6)
rows.each { |r| puts r.join }
