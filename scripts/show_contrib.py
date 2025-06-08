#!/usr/bin/env python3
"""
Fetch GitHub contribution calendar via GraphQL API and render a terminal heatmap similar to GitHub's calendar view.
"""
import os
import sys
import requests
import datetime

# ANSI color codes for levels (green heatmap)
LEVELS = [
  "\u001b[48;5;251m  \u001b[0m",  # 0: light gray
  "\u001b[48;5;120m  \u001b[0m",  # 1-9: light green
  "\u001b[48;5;34m  \u001b[0m",   # 10-19: medium green
  "\u001b[48;5;28m  \u001b[0m",   # 20-29: dark green
  "\u001b[48;5;22m  \u001b[0m"    # 30+: darkest green
]

QUERY = '''
query ($login: String!) {
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
'''

def fetch(username, token):
    headers = {"Authorization": f"bearer {token}"}
    json = {"query": QUERY, "variables": {"login": username}}
    resp = requests.post("https://api.github.com/graphql", json=json, headers=headers)
    resp.raise_for_status()
    return resp.json()


def pick_level(count):
    if count == 0:
        return 0
    elif count < 10:
        return 1
    elif count < 20:
        return 2
    elif count < 30:
        return 3
    else:
        return 4


def main():
    if len(sys.argv) < 2:
        print("Usage: show_contrib.py <github_username>")
        sys.exit(1)
    username = sys.argv[1]
    token = os.getenv('GITHUB_TOKEN')
    if not token:
        print("Please set GITHUB_TOKEN environment variable.")
        sys.exit(1)

    data = fetch(username, token)
    weeks = data['data']['user']['contributionsCollection']['contributionCalendar']['weeks']

    # Transpose weeks into 7 rows (Sun-Sat)
    rows = [[] for _ in range(7)]
    for week in weeks:
        days = week['contributionDays']
        for i, d in enumerate(days):
            level = pick_level(d['contributionCount'])
            rows[i].append(LEVELS[level])

    # Print rows: first row is Sunday
    for row in rows:
        print(''.join(row))

if __name__ == '__main__':
    main()
