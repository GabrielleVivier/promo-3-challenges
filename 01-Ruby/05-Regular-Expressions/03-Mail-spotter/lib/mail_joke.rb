# Encoding: utf-8

def mail_joke(email)
  # TODO: Return a joke suited to the email provided
  match_data = email.match(/\A([-\w]+)(\.?)([-\w]+)?@(\w+)\.(\w{3})\z/)
  if email =~ /\A([-\w]+)(\.?)([-\w]+)?@(\w+).(\w{3})\z/
    if  email.match(/lewagon/)
      if match_data[3].nil?
        return "Well done #{match_data[1]}, you're skilled and capable"
      else
        return "Well done #{match_data[1]} #{match_data[3]}, you're skilled and capable"
      end
    elsif email.match(/gmail/)
      if match_data[3].nil?
        return "#{match_data[1]}, you're an average but modern person"
      else
        return "#{match_data[1]} #{match_data[3]}, you're an average but modern person"
      end
    elsif email.match(/live/)
      if match_data[3].nil?
        return "#{match_data[1]}, aren't you born before 1973?"
      else
        return "#{match_data[1]} #{match_data[3]}, aren't you born before 1973?"
      end
    else
      if match_data[3].nil?
        return "Sorry #{match_data[1]}, we don't know how to judge '#{match_data[4]}.#{match_data[5]}'"
      else
        return "Sorry #{match_data[1]} #{match_data[3]}, we don't know how to judge '#{match_data[4]}.#{match_data[5]}'"
      end
    end
  else
    raise ArgumentError
  end
end


 #it "should raise an ArgumentError if input is not an email" do
    #lambda { mail_joke("foo") } .must_raise ArgumentError
  #nd

  #it "should compliment LeWagon email owners" do
    #response = mail_joke "boris@lewagon.org"
    #response.must_equal "Well done boris, you're skilled and capable"
  #end

  #it "should tell Gmail user that they are average and modern" do
    #response = mail_joke "boris@gmail.com"
    #response.must_equal "boris, you're an average but modern person"
  #end

  #it "should tell Live user that they live in the past" do
    #response = mail_joke "jean-marc.alarue@live.com"
    #response.must_equal "jean-marc alarue, aren't you born before 1973?"
  #end

  #it "should tell unknownd domain users that we can't judge them" do
    #response = mail_joke "voyageurdufutur@milkyway.gal"
    #response.must_equal "Sorry voyageurdufutur, we don't know how to judge 'milkyway.gal'"
  #end
