require 'net/smtp'

module EmailProbe
  class SMTPConnection
    module Status
      SUCCESS = 250
      NOT_FOUND = 550
    end

    def initialize(server, port)
      @server = server
      @port = port
    end

    def account_exists?(sender_account, account)
      connection = start_connection(account)
      connection.mailfrom(sender_account.address)

      begin
        account_status = connection.rcptto(account.address).status.to_i
      rescue Net::SMTPFatalError => e
        raise e unless e.message =~ /^550/
        account_status = 550
      end

      connection.finish

      account_status == Status::SUCCESS
    end

    private

    attr_reader :server, :port

    def start_connection(account)
      Net::SMTP.start(server, port, account.domain)
    end
  end
end