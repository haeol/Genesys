module LinkParser

  def self.included(base)
    base.extend(ClassMethods)
  end

  def domain_id
    self.url.match(regexes[:youtube])
  end

  module ClassMethods
    def regexes
      {
        youtube: /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/
      }
    end
    def embedded_content
      regexes
    end
  end

end
