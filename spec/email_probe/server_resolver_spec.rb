require 'spec_helper'

describe EmailProbe::ServerResolver do
  let(:server_resolver) { described_class.new }

  describe '#servers_for_domain' do
    subject { server_resolver.servers_for_domain(domain) }

    let(:domain) { 'example.org' }
    let(:server1) { 'server1' }
    let(:server2) { 'server2' }

    let(:dns_resolver) { double }
    let(:resource1) { Resolv::DNS::Resource::MX.new(1, server1) }
    let(:resource2) { Resolv::DNS::Resource::MX.new(2, server2) }
    let(:resources) { [resource1, resource2] }

    before do
      server_resolver.instance_variable_set(:@dns_resolver, dns_resolver)

      allow(dns_resolver).to receive(:getresources).with(domain, Resolv::DNS::Resource::IN::MX).and_return(resources)
    end

    it 'returns servers based on MX records for the domain' do
      expect(subject).to match_array([server1, server2])
    end
  end
end