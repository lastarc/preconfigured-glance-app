FROM glanceapp/glance:latest

COPY <<-EOF /app/glance.yml
theme:
  light: true
  background-color: 220 23 95
  contrast-multiplier: 1.0
  primary-color: 220 91 54
  positive-color: 109 58 40
  negative-color: 347 87 44
pages:
  - name: Home
    columns:
      - size: small
        widgets:
          - type: clock
            hour-format: 24h
            timezones:
              - timezone: Europe/Berlin
                label: Falkenstein, Germany
              - timezone: EST
                label: Ashburn, VA, US
              - timezone: Asia/Singapore
                label: Singapore, Singapore

          - type: calendar

          - type: bookmarks
            groups:
              - links:
                  - title: Gmail
                    url: https://mail.google.com/mail/u/0/
                  - title: Amazon
                    url: https://www.amazon.com/
                  - title: Github
                    url: https://github.com/
                  - title: Wikipedia
                    url: https://en.wikipedia.org/
              - title: Entertainment
                color: 10 70 50
                links:
                  - title: Netflix
                    url: https://www.netflix.com/
                  - title: Disney+
                    url: https://www.disneyplus.com/
                  - title: YouTube
                    url: https://www.youtube.com/
                  - title: Prime Video
                    url: https://www.primevideo.com/
              - title: Social
                color: 200 50 50
                links:
                  - title: Reddit
                    url: https://www.reddit.com/
                  - title: Twitter
                    url: https://twitter.com/
                  - title: Instagram
                    url: https://www.instagram.com/

          - type: rss
            limit: 10
            collapse-after: 3
            cache: 3h
            feeds:
              - url: https://ciechanow.ski/atom.xml
              - url: https://www.joshwcomeau.com/rss.xml
                title: Josh Comeau
              - url: https://samwho.dev/rss.xml
              - url: https://awesomekling.github.io/feed.xml
              - url: https://ishadeed.com/feed.xml
                title: Ahmad Shadeed

      - size: full
        widgets:
          - type: search
            search-engine: duckduckgo
            bangs:
              - title: Google
                shortcut: "!g"
                url: https://www.google.com/search?q={QUERY}
              - title: YouTube
                shortcut: "!yt"
                url: https://www.youtube.com/results?search_query={QUERY}
              - title: Github
                shortcut: "!gh"
                url: https://github.com/search?q={QUERY}
    
          - type: repository
            repository: glanceapp/glance
            pull-requests-limit: 5
            issues-limit: 3
            commits-limit: 3

          - type: lobsters
            sort-by: hot
            tags:
              - go
              - security
              - linux
            limit: 15
            collapse-after: 5
        
          - type: hacker-news

          - type: reddit
            subreddit: selfhosted

      - size: small
        widgets:
          - type: group
            widgets:
              - type: weather
                title: Budapest
                location: Budapest, Hungary
                hour-format: 24h

              - type: weather
                title: New York
                location: New York, USA
                hour-format: 24h

              - type: weather
                title: Tokyo
                location: Tokyo, Japan
                hour-format: 24h

          - type: iframe
            title: IP address
            source: https://ifconfig.so
            height: 20

          - type: monitor
            cache: 5s
            title: Services
            sites:
              - title: EU 
                url: http://eu.023911.xyz:30080
                icon: si:hetzner
                
              - title: US 
                url: http://us.023911.xyz:30080
                icon: si:hetzner

              - title: ASIA 
                url: http://asia.023911.xyz:30080
                icon: si:hetzner

          - type: releases
            show-source-icon: true
            repositories:
              - go-gitea/gitea
              - jellyfin/jellyfin
              - glanceapp/glance
              - codeberg:redict/redict
              - gitlab:fdroid/fdroidclient
              - dockerhub:gotify/server
EOF
