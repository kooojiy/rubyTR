# 求人募集のスクレイピング(ランニング) dのバージョンアップ版
require 'mechanize'

    for i in 0..2 do
        agent = Mechanize.new
        agent.user_agent_alias = "Mac Safari"
        num = 30 * i + 1
        page = agent.get("https://api.moshicom.com/api/events.xml?entry_status=1&limit=30&start=#{num}")

        items = page.search('item')
        items.each do |item|
            title = item.search('title')
            name = item.search('owner name')
            date = item.search('started_at')
            p ("イベント名: #{title.inner_text}")
            p ("主催者: #{name.inner_text}")
            p ("日時: #{date.inner_text}")
            p ('---------------------------------------')
        end
    end