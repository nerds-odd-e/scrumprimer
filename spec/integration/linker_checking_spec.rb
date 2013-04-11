# encoding: utf-8

require 'anemone'

describe "Link checking tests" do
  
  it "Check all links", :integration => true do
    Anemone.crawl("http://localhost:9292/") do |anemone|
      anemone.on_every_page do |page|
        begin        
          page.code.should== 200
        rescue RSpec::Expectations::ExpectationNotMetError => e
          e.message << "  (For page: #{page.url})"
          raise e
        end
      end
    end    
  end

  # it "Check all images", :integration => true do
  #   Anemone.crawl("http://localhost:9292/") do |anemone|
  #     anemone.on_every_page do |page|
  #       if page.html?
  #         img_srcs = page.doc.css('img').map { |i| 
  #           puts i['src'] 
  #         }
  #       end
  #       begin        
  #         page.code.should== 200
  #       rescue RSpec::Expectations::ExpectationNotMetError => e
  #         e.message << "  (For page: #{page.url})"
  #         raise e
  #       end
  #     end
  #   end    
  # end
  
end