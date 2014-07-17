require 'awesome_print'

 STRINGS = {
    home: {
      intro: {
        en: 'Welcome on Le Wagon',
        fr: 'Bienvenue sur Le Wagon'
      },
      content: {
        explanation: {
        en: 'This is an interesting exercise',
        fr: 'C\'est un exercice interessant',
        de: 'Es ist eine interesante Ãbung'
        },
      goodbye: {
        en: 'Goodbye',
        fr: 'Au revoir',
        es: 'Adios'
        }
      }
    }
  }

def getTranslation(path, lang = 'en')
  strings = STRINGS
  matches = path.scan(/(\w+)/).flatten

  matches.each do |position|
    position = position.to_sym
    strings  = strings.has_key?(position) ? strings[position] : {}
  end

  lang = 'en' unless strings.has_key?(lang.to_sym)

  strings.empty? ? '' : strings[lang.to_sym]
end

# testing your program
puts getTranslation('home.intro', 'fr') == 'Bienvenue sur Le Wagon' # => true
puts getTranslation('home.intro', 'es') == 'Welcome on Le Wagon' # => true
puts getTranslation('home.content.goodbye') == 'Goodbye' # => true
puts getTranslation('unvalid.path','en') == '' # => true
puts getTranslation('home.content.poney', 'en') == ''