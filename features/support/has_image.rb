module Capybara
  class Session
    def has_image?(src)      
      has_xpath?("//img[@src=\"#{src}\"]")
    end
  end
end