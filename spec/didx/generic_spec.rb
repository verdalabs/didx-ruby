RSpec.describe DIDX::Generic do
  context "when given a did with an invalid prefix" do
    let(:invalid_did_string) { "foo:web:bar" }

    it "returns an error" do
      expect(DIDX::Generic.new(invalid_did_string)).to raise_error(DIDX::Error)
    end
  end

  context "when given a did with a prefix" do
    let(:valid_did_string) { "did:foo:bar" }

    it "returns an error" do
      expect(DIDX::Generic.new(valid_did_string)).to be_instance_of(DIDX::Generic)
    end
  end

end
