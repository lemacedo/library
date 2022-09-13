require 'rails_helper'

RSpec.describe Book, type: :model do

  describe "Validations" do
    before do
      author = Author.create(name: "xpto", genre: "drama", age: 40)

      subject {
        described_class.new(
          title: "Hamlet",
          description: "Written by William Shakespeare",
          genre: "Dramatist",
          author: author,
          publication_at: "1870",
          publisher: "Palladis Tamia"
        )
      }
    end

    context "with attributes valid" do
      it "is success" do
        expect(subject).to be_valid
      end
    end

    context "values to nil" do
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
end
