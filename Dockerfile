FROM glanceapp/glance:latest

COPY <<-EOF /app/config.yml
pages:
  - name: Home
    columns:
      - size: small
        widgets:
          - type: calendar

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
          - type: hacker-news

          - type: reddit
            subreddit: selfhosted

      - size: small
        widgets:
          - type: weather
            location: Budapest, Hungary

          - type: markets
            markets:
              - symbol: SPY
                name: S&P 500
              - symbol: BTC-USD
                name: Bitcoin
              - symbol: NVDA
                name: NVIDIA
              - symbol: AAPL
                name: Apple
              - symbol: MSFT
                name: Microsoft
              - symbol: GOOGL
                name: Google
              - symbol: AMD
                name: AMD
              - symbol: RDDT
                name: Reddit
EOF
