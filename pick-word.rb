require 'wordnet'

lex = WordNet::Lexicon.new

require 'random-word'
require 'active_support/inflector'

candidate_domains = %w(
  noun.person
  noun.group
)

word = loop do
  c = lex[RandomWord.nouns.next]
  
  next if !c

  # If it's not in our noun domains, it's probably too hard to use
  next if !candidate_domains.include?(c.lexical_domain)

  # A word without hyponyms tends to be too specific to be funny
  next if c.hyponyms.empty?

  # If the noun is an action, check if there's any gerundial forms.  Otherwise,
  # choose the shortest synonym.
  candidates = if c.lexical_domain == 'noun.act'
                 c.words.select { |w| w.lemma =~ /ing$/ }
               else
                 c.words.select { |w| w.lemma.split(/\s+/).length == 1 }
               end

  next if candidates.empty?

  if c.lexical_domain != 'noun.act'
    break candidates.first.lemma.pluralize
  else
    break candidates.first.lemma
  end
end

puts word
