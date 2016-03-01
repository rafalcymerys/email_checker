module EmailProbe
  class EmailAccount
    attr_reader :name, :domain

    def initialize(address_string)
      @name, @domain = address_string.split('@')
    end

    def address
      "#{name}@#{domain}"
    end
  end
end