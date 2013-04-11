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
  
  def retrieve_all_image_tag_sources
    img_srcs = []
    Anemone.crawl("http://localhost:9292/") do |anemone|
      anemone.on_every_page do |page|
        next unless page.html?
        
        page.doc.css('img').map do |element|
          img_srcs << URI::Parser.new.parse(element['src'])
        end
      end
    end
    img_srcs
  end

  it "Check all images", :integration => true do
    img_srcs = retrieve_all_image_tag_sources
    retrieve_all_image_tag_sources.each do |image_url|
      host = image_url.host || "localhost"
      port = image_url.port || 9292
      path = image_url.path

      Net::HTTP.new(host, port).request_get(path) do |response|
        begin
          response.kind_of?(Net::HTTPSuccess).should== true
        rescue RSpec::Expectations::ExpectationNotMetError => e
          e.message << "  (For page: #{image_url.to_s})"
          raise e
        end  
      end
    end    
  end
end