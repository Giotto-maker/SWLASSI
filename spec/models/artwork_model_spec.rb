require 'rails_helper'

RSpec.describe Artwork do

    subject { described_class.new }

    describe "artwork" do

        it "is valid with valid attributes" do
            subject.nome = 'Test name'
            subject.autore = 'Test author'
            expect(subject).to be_valid
        end

        it "is NOT valid if its name is missing" do
            subject.autore = 'Test author'
            expect(subject).to_not be_valid
        end

        it "is NOT valid if its author is missing" do
            subject.nome = 'Test name'
            expect(subject).to_not be_valid
        end

        it "is NOT valid if category is different from star/architecture/painting/sculpure" do
            subject.nome = 'Test name'
            subject.autore = 'Test author'
            subject.categoria = 'Test category'
            expect(subject).to_not be_valid
        end
    end

    describe "association" do
        it { should have_many(:reviews) }
    end
end