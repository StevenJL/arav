module Arav
  class Helper
    def self.camel_case(str)
      str.split('_').collect(&:capitalize).join 
    end
  end
end
