# encoding: utf-8

describe "Link checking tests" do
  it "Check all links and images", :integration => true do
    Anemone.crawl("http://localhost:9292/") do |anemone|
      anemone.on_every_page do |page|
        if page.html?
          img_srcs = page.doc.css('img').map { |i| 
            puts i['src'] 
          }
        end
        puts "HTML: #{page.url} <br>" if page.html?
        puts "URL: #{page.url} #{page.code}<br>" unless page.code == 200
      end
    end    
  end
end