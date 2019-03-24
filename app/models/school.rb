class School < ApplicationRecord
  validates_presence_of :name, :color, required: true

  validates_format_of :color, with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i

  has_one :user, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :appointments, dependent: :destroy

  # has_trash
  default_scope {where(arel_table[:deleted_at].eq(nil)) if arel_table[:deleted_at]}
end
