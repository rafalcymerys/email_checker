require 'spec_helper'

describe EmailProbe::EmailAccount do
  let(:account) { described_class.new(email) }

  let(:email) { 'test@example.org' }
  let(:name) { 'test' }
  let(:domain) { 'example.org' }

  describe '#name' do
    subject { account.name }

    it 'returns account name' do
      expect(subject).to eq(name)
    end
  end

  describe '#domain' do
    subject { account.domain }

    it 'returns account domain' do
      expect(subject).to eq(domain)
    end
  end

  describe '#address' do
    subject { account.address }

    it 'returns address' do
      expect(subject).to eq(email)
    end
  end
end