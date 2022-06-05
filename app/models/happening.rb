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
class Happening < ApplicationRecord
end
