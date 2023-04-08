# frozen_string_literal: true

RSpec.describe DIDX::Key do
  context "when given a valid did:key" do
    let(:did) { DIDX::Key.new("did:key:VALIDKEY") }

    it "can parse a valid did prefix" do
      expect(did.method).to eq("key")
    end

    it "can parse a valid did prefix" do
      expect(did.method_id).to eq("VALIDKEY")
    end

    it "can resolve a did document" do
      expect(did.document).to be_instance_of(DIDX::Document)
    end
  end
end
