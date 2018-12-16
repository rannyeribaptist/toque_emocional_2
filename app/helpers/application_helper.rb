module ApplicationHelper
  def salute
    name = "Fulano"

    case Time.now.hour

      when 6..12
        "Bom dia, #{name}!"
      when 12
        "Já almoçou, #{name}?"
      when 13..17
        "Boa tarde, #{name}!"
      when 18..24
        "Boa noite, #{name}!"
      when 1..5
        "Boa madrugada, #{name}!"
    end
  end
end
