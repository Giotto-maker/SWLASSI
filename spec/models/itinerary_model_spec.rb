require 'rails_helper'

RSpec.describe Itinerary do

    subject { described_class.new(user_id: 1) }

    describe "itinerary" do

    end

    describe "assosiation" do
        it { should belong_to(:user) }
        
    end

end