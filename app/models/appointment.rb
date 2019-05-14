class Appointment < ApplicationRecord
  belongs_to :school

  has_one :appointment_student, dependent: :destroy
  has_many :appointment_comments, dependent: :destroy
  accepts_nested_attributes_for :appointment_student, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :appointment_comments, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :school_id, :appointment_date, :appointment_time, :reason

  # has_trash
  self.per_page = 10

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :student,
      :search_query,
      :with_school_id,
      :date
    ]
  )

  scope :search_query, lambda { |query| where("description LIKE ? OR reason LIKE ?", "%#{query}%", "%#{query}%") }
  scope :student, lambda { |query|
    Appointment.joins(:appointment_student).where('name LIKE ?', "%#{query}%")
  }

  scope :with_school_id, lambda { |school_id| where(:school_id => school_id) }
  scope :date, lambda { |query|
    Appointment.where('extract(month from appointment_date) = ?', query)
  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'

    case sort_option.to_s
    when /^created_at/
      order("LOWER(appointments.created_at) #{ direction }")
    else
      raise(ArgumentError, "Opção inválida: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Data de Registro (novos primeiro)', 'created_at_desc'],
      ['Data de Registro (antigos primeiro)', 'created_at_asc']
    ]
  end
end
