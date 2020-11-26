# サービスに登録している団体モデル(ゴミ)
require 'mechanize'

for i in 0..170 do
    num = i*18
    agent = Mechanize.new
    page = agent.get("https://blueshipjapan.com/search/crew/catalog?per_page=#{num}")
    elements = page.search('h2.crew_name a')

    elements.each do |element|
        content = element.get_attribute(:href)
        registrant_page = agent.get(content)
        registrant_name = registrant_page.search('h1.strong').inner_text
        p registrant_name
    end
end