require 'rails_helper'

RSpec.describe AdminCreation do

    describe "association" do

        it { should belong_to(:user) }
        it { should belong_to(:artwork) }

    end

end