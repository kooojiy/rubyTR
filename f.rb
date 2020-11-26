# 求人募集のスクレイピング(ランニング) dのバージョンアップ版
# 紐付けを含む
require 'mechanize'

    for i in 0..2 do
        agent = Mechanize.new
        num = 30 * i + 1
        page = agent.get("https://api.moshicom.com/api/events.xml?entry_status=1&limit=30&start=#{num}")

        items = page.search('item')
        items.each do |item|
            title = item.search('title').inner_text
            name = item.search('owner name').inner_text
            date = item.search('started_at').inner_text
            p ("イベント名: #{title}")
            p ("主催者: #{name}")
            p ("日時: #{date}")
            p ('---------------------------------------')

            event = Event.new
            event.name = title
            event.owner = name
            event.date = date
            event.site = "e-moshicom"
            if Owner.find_by(name: event.owner) then
                event.link = true
            else
                event.link = false
            end
        end
    end