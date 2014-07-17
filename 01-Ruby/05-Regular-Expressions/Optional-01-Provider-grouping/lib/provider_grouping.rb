def group_mails( emails )
  #TODO: group email by provider
  email_hash = {}

  emails.each do |email|
    match_email   = email.match(/\A([^@])+@(?<domain>[^@\.]+)\.([^@\.]+)\z/)
    mail_provider = match_email['domain']

    email_array = [email]

    if email_hash.has_key?(mail_provider)

      email_hash[mail_provider] += email_array
    else
      email_hash[mail_provider] = email_array
    end
  end

  email_hash
end

users_emails = %w( bob@yahoo.fr
                   roger57@hotmail.fr
                   bigbox@yahoo.fr
                   boris@lewagon.org
                   monsieur.olivier@gmail.com
                   monsieur.mack@gmail.com )


puts group_mails( users_emails )

# => {"yahoo" => ["bob@yahoo.fr", "bigbox@yahoo.fr"],
#     "hotmail" => ["roger57@hotmail.fr"],
#     "lewagon" => ["boris@lewagon.org"],
#     "gmail" => ["monsieur.olivier@gmail.com",
#     "monsieur.mack@gmail.com"]}
