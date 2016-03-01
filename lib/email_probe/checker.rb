module EmailProbe
  class Checker
    def initialize(sender_email)
      @sender_account = EmailProbe::EmailAccount.new(sender_email)
      @server_resolver = EmailProbe::ServerResolver.new
    end

    def check(email)
      account = EmailProbe::EmailAccount.new(email)

      server_resolver.servers_for_domain(account.domain).any? do |server|
        smtp = EmailProbe::SMTPConnection.new(server, 25)
        smtp.account_exists?(sender_account, account)
      end
    end

    private

    attr_reader :sender_account, :server_resolver
  end
end