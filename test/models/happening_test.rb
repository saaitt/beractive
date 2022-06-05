# == Schema Information
#
# Table name: happenings
#
#  id           :bigint           not null, primary key
#  title        :string
#  subtitle     :string
#  web_source   :string
#  category     :string
#  happening_at :datetime
#  link         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class HappeningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
