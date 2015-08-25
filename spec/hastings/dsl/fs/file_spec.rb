describe Hastings::Dsl::FS::File do
  subject { Class.new { extend Hastings::Dsl::FS::File } }
  before  { FileUtils.touch("foo") }
  after   { FileUtils.rm("foo") }

  describe "#file" do
    subject { super().file path }
    let(:path) {}

    context "given a path" do
      let(:path) { "foo" }
      it { is_expected.to be_a Hastings::File }
    end

    context "with no parameters" do
      it { is_expected.to be Hastings::File }
    end
  end

  describe "#absolute_path" do
    subject { super().absolute_path "foo" }
    it "returns the absolute path" do
      expect(subject).to eq(File.absolute_path "foo")
    end
  end
end
