def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message == "I am going to work right now!"
    return ""
  elsif your_message.include?("?")
    return "Silly question, get dressed and go to work!"
  else
    return "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  motivation_message = "I can feel your motivation!"

  if your_message.upcase == your_message
    if your_message == "I AM GOING TO WORK RIGHT NOW!"
      return ""
    elsif your_message.include?("?")
      return "#{motivation_message} Silly question, get dressed and go to work!"
    else
      return "#{motivation_message} I don't care, get dressed and go to work!"
    end
  else
    if your_message == "I am going to work right now!"
      return ""
    elsif your_message.include?("?")
      return "Silly question, get dressed and go to work!"
    else
      return "I don't care, get dressed and go to work!"
    end
  end
end
