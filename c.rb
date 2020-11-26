# サービスに登録している団体モデル(ランニング)
require 'mechanize'

for i in 1..45 do
    agent = Mechanize.new
    page = agent.get("https://moshicom.com/user/#{i}/")

    tx = page.search('div.progress-box span').inner_text
    next if tx.include?("未評価") or tx==""

    elements = page.search('div.d-flex.flex-column h1 span')

    elements.each do |element|
        name = element.inner_text
        next if name.include?("モシコム事務局") or name.include?("退会ユーザー") or name.include?("PICKUP")
        p i
        p name
    end
end