require 'rails_helper'

RSpec.describe Book, type: :model do
  subject {
    described_class.new(
                        title: "Hamlet",
                         description: "Written by William Shakespeare sometime between 1599 and 1601. It is
                                        Shakespeare's longest play, with 29,551 words. Set in Denmark, the play
                                        depicts Prince Hamlet and his revenge against his uncle",
                         genre: "Dramatist",
                         author: "William Shakespeare",
                         publication_at: "1870",
                         publisher: "Palladis Tamia"
    )
  }

  describe "Validations" do
    context "values to nil"
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an name" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a genre" do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a age" do
      subject.publication_at = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a age" do
      subject.author = nil
      expect(subject).to_not be_valid
      end

    it "is not valid without a age" do
      subject.publisher = nil
      expect(subject).to_not be_valid
    end
  end
end
