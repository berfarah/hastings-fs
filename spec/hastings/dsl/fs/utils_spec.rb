describe Hastings::Dsl::FS::Utils do
  subject { Class.new { extend Hastings::Dsl::FS::Utils } }
  before(:all) do
    @files = %w(foo bar)
    @dirs  = %w(baz oof)
    @files.each(&FileUtils.method(:touch))
    @dirs.each(&FileUtils.method(:mkdir))
  end

  def abs(str)
    File.absolute_path(str)
  end

  describe " coercion" do
    subject { super().move from, to }
    context "given a String" do
      let(:from) { "foo" }
      let(:to)   { "bar" }
      it "moves it to the path" do
        expect(Hastings::FS::Utils).to receive(:move).with(from, to)
        subject
      end
    end

    context "given a Dir" do
      let(:from) { Hastings::Dir.new "baz" }
      let(:to) { Hastings::Dir.new "oof" }
      it "moves it to the dir's path" do
        expect(Hastings::FS::Utils).to receive(:move).with(abs("baz"),
                                                           abs("oof"))
        subject
      end
    end

    context "given a File" do
      let(:from) { Hastings::File.new "foo" }
      let(:to)  { Hastings::File.new "bar" }
      it "moves it to file's path" do
        expect(Hastings::FS::Utils).to receive(:move).with(abs("foo"),
                                                           abs("bar"))
        subject
      end
    end
  end

  { copy: %w(foo bar), delete: %w(foo), move: %w(foo bar) }.each do |name, args|
    describe "#{name}" do
      it "delegates to Hastings::FS::Utils##{name}" do
        expect(Hastings::FS::Utils).to receive(name)
        subject.public_send name, *args
      end
    end
  end
end
