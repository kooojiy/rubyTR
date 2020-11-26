# 求人募集のスクレイピング(ランニング)
require 'mechanize'

    agent = Mechanize.new
    page = agent.get("https://api.moshicom.com/api/events.xml?ymd_between=20201001,20201205")

    elements = page.search('title')
    elements.each do |element|
        ele = element.inner_text
        p ele
    end

    names = page.search('owner name')
    names.each do |name|
        na = name.inner_text
        p na
    end

    dates = page.search('started_at')
    dates.each do |date|
        da = date.inner_text
        p da
    end