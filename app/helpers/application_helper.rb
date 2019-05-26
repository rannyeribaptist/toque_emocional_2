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

  def classies
    [
      ["1º Ano - Fundamental 1", "1º Ano - Fundamental 1"],
      ["2º Ano - Fundamental 1", "2º Ano - Fundamental 1"],
      ["3º Ano - Fundamental 1", "3º Ano - Fundamental 1"],
      ["4º Ano - Fundamental 1", "4º Ano - Fundamental 1"],
      ["5º Ano - Fundamental 1", "5º Ano - Fundamental 1"],
      ["6º Ano - Fundamental 2", "6º Ano - Fundamental 2"],
      ["7º Ano - Fundamental 2", "7º Ano - Fundamental 2"],
      ["8º Ano - Fundamental 2", "8º Ano - Fundamental 2"],
      ["9º Ano - Fundamental 2", "9º Ano - Fundamental 2"],
      ["1º Ano - Médio", "1º Ano - Médio"],
      ["2º Ano - Médio", "2º Ano - Médio"],
      ["3º Ano - Médio", "3º Ano - Médio"]
    ]
  end

  def human_boolean(boolean)
    boolean ? 'Sim' : 'Não'
  end
end
