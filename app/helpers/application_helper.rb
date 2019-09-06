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

  def generate_code()
    require 'securerandom'

    return SecureRandom.urlsafe_base64(5)
  end

  def show_phrase
    if Phrase.all.any?
      element = Phrase.all.sample
      text = element.content
      author = element.author
      return text + " - " + author
    end
  end

  def months
    [
      ["Janeiro", "1"],
      ["Fevereiro", "2"],
      ["Março", "3"],
      ["Abril", "4"],
      ["Maio", "5"],
      ["Junho", "6"],
      ["Julho", "7"],
      ["Agosto", "8"],
      ["Setembro", "9"],
      ["Outubro", "10"],
      ["Novembro", "11"],
      ["Dezembro", "12"],
    ]
  end

  def human_boolean(boolean)
    boolean ? 'Sim' : 'Não'
  end

  def validate_permission
    redirect_to "/" if not is_admin?
  end

  def current_page(book_id)
    saver = ReaderBookPageSaver.find_or_create_by(reader_id: current_reader.id, book_id: book_id)
    return saver.current_page.nil? ? "0" : saver.current_page
  end

  def show_emotions(ids)
    list = ""
    quantity = Emotion.where(id: ids).count
    emotions = Emotion.where(id: ids)
    passed = []

    emotions.each_with_index do |emotion, i|
      if quantity == 1
        list += emotion.name
      elsif quantity == 2
        list += emotion.name if emotion == emotions.first
        list += ' e ' + emotion.name if emotion == emotions.last
      else
        list += emotion.name if emotion == emotions.first
        list += ', ' + emotion.name if (emotion != emotions.first) and (emotion != emotions.last)
        list += ' e ' + emotion.name if emotion == emotions.last
      end
    end

    return "Estes sentimentos estão ligados à " + list
  end

  def show_students_in_occurrencies(histories, emotion)
    list = []
    counter = 0
    students = ""

    histories.each_with_index do |history|
      if history.emotions.include?(emotion.id.to_s)
        list[counter] = Student.find_by_id(history.student_id).name.split(' ').first + ' ' + Student.find_by_id(history.student_id).name.split(' ')[1] if Student.find_by_id(history.student_id).name.split(' ').length > 1
        list[counter] = Student.find_by_id(history.student_id).name.split(' ').first if Student.find_by_id(history.student_id).name.split(' ').length == 1
        counter += 1
      end
    end

    list.each do |student|
      if counter == 1
        students = student
      elsif counter == 2
        students += student if student == list.first
        students += ' e ' + student if student == list.last
      else
        students += student if student == list.first
        students += ', ' + student if (student != list.first) and (student != list.last)
        students += ' e ' + student if student == list.last
      end
    end

    return "<strong>" + students + ".</strong> " + emotion.description
  end

  def pick_emotions(histories)
    emotions = Emotion.all
    ids = []
    counter = 0

    histories.each do |history|
      history.emotions.each do |emotion|
        if not ids.include?(emotion)
          ids[counter] = emotion.to_i
          counter += 1
        end
      end
    end

    return Emotion.where(id: ids)
  end

  def show_appointment_kind(ap_kind)
    return "EM FAMÍLIA" if ap_kind == "family"
    return "EM GRUPO" if ap_kind == "group"
    return "INDIVIDUAL" if ap_kind == "individual"
  end

  def show_students(students)
    list = ""
    quantity = students.count

    students.each do |student|
      if student == students.first
        list += '<strong>' + student.name.split(' ').first.capitalize + ' ' + student.name.split(' ').last.capitalize + '</strong> - ' + student.classy + ' ' + student.groupy
      else
        list +=  '<br> <strong>' + student.name.split(' ').first.capitalize + ' ' + student.name.split(' ').last.capitalize + '</strong> - ' + student.classy + ' ' + student.groupy
      end
    end
    return list
  end

  def show_button_title(type, appointment)
    case type
    when "closing"
      return appointment.closing.present? ? "Editar fechamento do caso" : "Fazer fechamento do caso"
    when "referral"
      return appointment.referral.present? ? "Editar encaminhamento" : "Fazer encaminhamento"
    when "action_call"
      return appointment.action_call.present? ? "Editar chamada de ação" : "Fazer chamada de ação"
    when "redirecting"
      return appointment.redirecting.present? ? "Editar direcionamento" : "Fazer direcionamento"
    when "observations"
      return appointment.observations.present? ? "Editar observações" : "Fazer observações"
    end
  end

  def show_appointment_comment_form_title
    return is_admin? ? "Registrar evolução" : "Fazer um comentário"
  end

  def show_appointment_comment_form(appointment)
    case appointment.appointment_comments.count
    when 0
      return true
    when 1
      if (is_admin?) and (not appointment.appointment_comments.where(user_id: 1).present?)
        return true
      elsif (not is_admin?) and (appointment.appointment_comments.where(user_id: 1).present?)
         return true
      end
    when 2
      return false
    end
  end
end
