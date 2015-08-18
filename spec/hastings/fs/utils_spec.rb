describe Hastings::FS::Utils do
  context "on its own" do
    subject { Hastings::FS::Utils }
    let(:arg1) { "first" }
    let(:arg2) { "second" }

    describe ".copy" do
      it "calls FileUtils.cp with the arguments" do
        expect(FileUtils).to receive(:cp).with(arg1, arg2)
        subject.copy(arg1, arg2)
      end
    end

    describe ".delete" do
      it "calls FileUtils.rm_r with the argument" do
        expect(FileUtils).to receive(:rm_r).with(arg1)
        subject.delete(arg1)
      end
    end

    describe ".move" do
      it "calls FileUtils.mv with the arguments" do
        expect(FileUtils).to receive(:mv).with(arg1, arg2)
        subject.move(arg1, arg2)
      end
    end

    describe ".rename" do
      it "calls FileUtils.mv" do
        expect(FileUtils).to receive(:mv)
        subject.rename(arg1, arg2)
      end
    end
  end

  context "when included" do
    subject { Struct.new(:path) { include(Hastings::FS::Utils) }.new(arg1) }
    let(:arg1) { "first" }
    let(:arg2) { "second" }

    describe "#copy" do
      it "calls FileUtils.cp with the arguments" do
        expect(FileUtils).to receive(:cp).with(arg1, arg2)
        subject.copy(arg2)
      end
    end

    describe "#delete" do
      it "calls FileUtils.rm_r with the argument" do
        expect(FileUtils).to receive(:rm_r).with(arg1)
        subject.delete
      end
    end

    describe "#move" do
      it "calls FileUtils.mv with the arguments" do
        expect(FileUtils).to receive(:mv).with(arg1, arg2)
        subject.move(arg2)
      end
    end

    describe "#rename" do
      it "calls FileUtils.mv" do
        expect(FileUtils).to receive(:mv)
        subject.rename(arg2)
      end
    end
  end
end
