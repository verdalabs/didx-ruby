# frozen_string_literal: true

RSpec.describe DIDX::Web do
  context "when given a valid did:web" do
    let(:did) { DIDX::Web.new("did:web:identity.foundation") }

    it "can parse a valid did prefix" do
      expect(did.prefix).to eq("did")
    end

    it "can parse a valid did prefix" do
      expect(did.method).to eq("web")
    end

    it "can parse a valid did prefix" do
      expect(did.method_id).to eq("identity.foundation")
    end

    it "can resolve a did document" do
      expect(did.document).to be_instance_of(DIDX::Document)
    end
  end
end
