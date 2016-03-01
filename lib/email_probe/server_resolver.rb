require 'resolv'

module EmailProbe
  class ServerResolver
    def initialize
      @dns_resolver = Resolv::DNS.new
    end

    def servers_for_domain(domain)
      resources = dns_resolver.getresources(domain, Resolv::DNS::Resource::IN::MX)
      resources.map { |e| e.exchange.to_s }
    end

    private

    attr_reader :dns_resolver
  end
end