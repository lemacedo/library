require 'rails_helper'

RSpec.describe Author, type: :model do
  subject {
    described_class.new(
                        name: "William Shakespeare",
                        genre: "Dramatist",
                        age: 77
    )
  }

  describe "Validations" do
    context "values to nil"
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

      it "is not valid without an name" do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a genre" do
        subject.genre = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a age" do
        subject.age = nil
        expect(subject).to_not be_valid
      end
    end
end
