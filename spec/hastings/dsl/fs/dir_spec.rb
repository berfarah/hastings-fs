describe Hastings::Dsl::FS::Dir do
  subject { Class.new { extend Hastings::Dsl::FS::Dir } }
  before  { FileUtils.mkdir("foo") }
  after   { FileUtils.rmdir("foo") }

  describe "#dir" do
    subject { super().dir path }
    let(:path) {}

    context "given a path" do
      let(:path) { "foo" }
      it { is_expected.to be_a Hastings::Dir }
    end

    context "with no arguments" do
      it { is_expected.to be Hastings::Dir }
    end
  end
end
