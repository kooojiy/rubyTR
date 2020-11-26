# 求人募集のスクレイピング(ゴミ) aのバージョンアップ版
# uniqunessをtrueにする
require 'mechanize'

for i in 0..5 do
    num = i*18
    agent = Mechanize.new
    page = agent.get("https://blueshipjapan.com/search/event/catalog?per_page=#{num}")
    elements = page.search('h2.event_title a')

    elements.each do |element|
        url = element.get_attribute(:href)
        event_page = agent.get(url)
        event_name = event_page.search('section.container h1').inner_text
        p event_name
        event_group = event_page.search('table a span').inner_text
        p event_group
        event_date = event_page.search('div.event_datetime div.left p.value').inner_text
        p event_date
    end
end