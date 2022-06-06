class HappeningsController < ApplicationController
  def index
    happenings_helper = HappeningsHelper::HappeningsGatherer.new()
    happenings_helper.gatherHappenings
    @happenings = Happening.all

  end
end
