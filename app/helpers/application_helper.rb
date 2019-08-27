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

  def show_emotion_descriptions(ids)
    list = ""
    quantity = Emotion.where(id: ids).count
    emotions = Emotion.where(id: ids)

    entries = ["Pode ser que você tenha sentido ", "Talvez você tenha sentido também ", "Também é correto dizer que você sentiu "]

    emotions.each do |emotion|
      if emotion == emotions.first
        list += '<strong>' + emotion.name + '</strong>' + '. ' + emotion.description
      else
        list += '. <br><br>' + entries.sample + '<strong>' + emotion.name + '</strong>' + '. ' + emotion.description
      end
    end

    return "É correto afirmar que você sentiu " + list + "?"
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
        return appointment.closing.present? ? "Editar encaminhamento" : "Fazer encaminhamento"
      when "action_call"
        return appointment.closing.present? ? "Editar chamada de ação" : "Fazer chamada de ação"
      when "redirecting"
        return appointment.closing.present? ? "Editar direcionamento" : "Fazer direcionamento"
      when "observations"
        return appointment.closing.present? ? "Editar observações" : "Fazer observações"
      end
  end
end
