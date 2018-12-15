class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  belongs_to :school

  has_trash
  default_scope {where(arel_table[:deleted_at].eq(nil)) if arel_table[:deleted_at]}

  before_create :check_school, :validate_user_permission

  validates_presence_of :school, :role, required: true

  def check_school
    school = School.find(self.school.id)

    if school.user.present?
      errors.add(:base, "Essa escola já tem um usuário.")
      throw(:abort)
    end
  end

  def validate_user_permission
    if self.role == "Admin" and User.count <= 0
      errors.add(:base, "Desculpe mas eu não posso permitir que isso aconteça... Este incidente será relatado.")
      throw(:abort)
    end
  end
end
