RSpec.shared_examples "has_valid_fixture" do
  it "has a valid fixture" do
    items = send described_class.model_name.collection
    expect(items).to all(be_valid)
  end
end
