describe Hastings::Dir do
  subject(:foo_bar) { described_class.new("foo_bar") }
  let(:path) do
    -> (arr) { arr.map(&:path) }
  end
  let(:files_arr) do
    Dir.chdir("foo_bar") { @files.map(&Hastings::File.method(:new)) }
  end
  let(:dirs_arr) do
    Dir.chdir("foo_bar") { @dirs.map(&Hastings::Dir.method(:new)) }
  end

  before(:all) do
    FileUtils.mkdir_p("foo_bar")
    @files = %w(bazinga caramba yahoo)
    @files.each { |f| File.open("foo_bar/#{f}", "w") {} }
    @dirs = %w(bossa jazz rock)
    @dirs.map { |d| Dir.mkdir("foo_bar/#{d}") }
  end
  after(:all)  { FileUtils.rm_rf("foo_bar") }

  it { is_expected.to be_a Dir }
  it { is_expected.to be_a Hastings::FS::AbsolutePaths }
  it { is_expected.to be_a Hastings::FS::Path }
  it { is_expected.to be_a Hastings::FS::Stat }

  [:created, :accessed, :modified].each do |name|
    describe "##{name[0]}time" do
      it "should have been #{name} at the time of running tests" do
        expect(
          subject.public_send(:"#{name[0]}time").send :to_date
        ).to eq(Date.today)
      end
    end
  end

  describe "#files" do
    context "when not passed hash args" do
      it "lists the files in a directory" do
        expect(path[foo_bar.files]).to eq(path[files_arr])
      end

      it "matches files by glob" do
        expect(path[foo_bar.files("baz*")]).to eq(path[[files_arr.first]])
      end
    end

    context "when passed hash args" do
      it "filters by criteria" do
        expect(
          path[foo_bar.files created_on?: Date.today]
        ).to eq(path[files_arr])
      end

      it "matches files by glob and criteria" do
        expect(
          path[foo_bar.files "baz*", created_on?: Date.today]
        ).to eq(path[[files_arr.first]])
      end
    end
  end

  describe "#dirs" do
    it "lists dirs in a directory" do
      expect(path[foo_bar.dirs]).to eq(path[dirs_arr])
    end

    it "matches dirs by glob" do
      expect(path[foo_bar.dirs "bo*"]).to eq(path[[dirs_arr.first]])
    end
  end
end
