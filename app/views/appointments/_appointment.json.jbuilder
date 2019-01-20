json.extract! appointment, :id, :school_id, :student, :appointment_date, :appointment_time, :description, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
