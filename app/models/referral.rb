class Referral < ActiveRecord::Base
  belongs_to :rolodex
  validates :ref_first_name, presence: true
  validates :ref_address_line_one, presence: true
end