require 'rails_helper'

RSpec.describe "weathers/show.html.erb", type: :view do
  describe "rendering the show template" do
    let(:data) do
      {
        title: "Yahoo! Weather - Melbourne, VIC, AU",
        last_build_date: "Wed, 09 May 2018 04:41 PM AEST"
      }
    end

    it "displays the show page" do
      assign(:weather, data)

      render

      expect(rendered).to match /Yahoo/
    end
  end
end
