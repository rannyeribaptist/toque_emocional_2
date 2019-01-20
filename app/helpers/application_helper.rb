module ApplicationHelper
  def salute
    case Time.now.hour

      when 6..12
        "Olá, Bom dia!"
      when 12
        "Já almoçou?"
      when 13..17
        "Boa tarde!"
      when 18..24
        "Boa noite!"
      when 1..5
        "Boa madrugada!"
    end
  end

  def show_flash_message
    if flash.any?
      flash.each do |f|
        return ("<div class='flash flash--#{f[0]} animated fadeInDown'>#{f[1]}</div>").html_safe
      end
    end
  end

  def is_admin?
    current_user.role == "Admin"
  end

  def remove_old_appointments
    appointments = Appointment.all

    appointments.each do |ap|
      ap.destroy if ap.appointment_date.strftime("%m %y") < Date.today.strftime("%m %y")
    end
  end
end
