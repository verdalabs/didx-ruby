# frozen_string_literal: true

RSpec.describe DIDX::Key do
  context "when given a valid did:key" do
    let(:did) { DIDX::Ethr.new("did:ethr:0xb9c5714089478a327f09197987f16f9e5d936e8a") }

    it "can parse a valid did prefix" do
      expect(did.method).to eq("ethr")
    end

    it "can parse a valid did prefix" do
      expect(did.eth_address).to eq("0xb9c5714089478a327f09197987f16f9e5d936e8a")
    end

    it "can resolve a did document" do
      expect(did.document).to be_instance_of(DIDX::Document)
    end
  end
end
