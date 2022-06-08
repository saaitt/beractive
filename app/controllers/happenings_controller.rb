class HappeningsController < ApplicationController
  def index
    # TODO: ideally i'd pass the entire result into a job which can only be done once every minute/hour/day but this also works.
    happenings_helper = HappeningsHelper::HappeningsGatherer.new()
    happenings_helper.gatherHappenings
    @happenings = Happening.all

  end
end
