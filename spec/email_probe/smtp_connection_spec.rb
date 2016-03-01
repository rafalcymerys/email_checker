require 'spec_helper'

describe EmailProbe::SMTPConnection do
  let(:smtp_connection) { described_class.new(server, port) }
  let(:server) { 'mail.example.org' }
  let(:port) { 25 }

  let(:sender_email) { 'sender@example.org' }
  let(:email) { 'test@example.org' }
  let(:sender_account) { EmailProbe::EmailAccount.new(sender_email) }
  let(:account) { EmailProbe::EmailAccount.new(email) }

  describe '#account_exists?' do
    subject { smtp_connection.account_exists?(sender_account, account) }

    let(:net_smtp) { double }
    let(:smtp_response) { double }

    before do
      allow(Net::SMTP).to receive(:start).and_return(net_smtp)
      allow(net_smtp).to receive(:mailfrom).with(sender_email)
      allow(net_smtp).to receive(:rcptto).with(email).and_return(smtp_response)
      allow(net_smtp).to receive(:finish)
    end

    context 'when account exists' do
      before { allow(smtp_response).to receive(:status).and_return(250) }

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when account does not exist' do
      before { allow(smtp_response).to receive(:status).and_raise(Net::SMTPFatalError.new('5501.1 Account Not found')) }

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end

    context 'when other thing happens' do
      before { allow(smtp_response).to receive(:status).and_raise(Net::SMTPFatalError.new('501 Fatal error')) }

      it 'raises error' do
        expect { subject }.to raise_error(Net::SMTPFatalError)
      end
    end
  end
end