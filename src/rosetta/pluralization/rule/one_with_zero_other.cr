module Rosetta
  module Pluralization
    abstract class Rule
      # Pluralization rule used for: Akan, Amharic, Bihari, Filipino, guw, Hindi, Lingala, Malagasy, Northen Sotho,
      # Tachelhit, Tagalog, Tigrinya, Walloon.
      #
      # This rule was extracted from [crystal-i18n/i18n](https://github.com/crystal-i18n/i18n).
      @[CategoryTags(:one, :other)]
      class OneWithZeroOther < Rule
        def apply(count : Float | Int) : Symbol
          count == 0 || count == 1 ? :one : :other
        end
      end
    end
  end
end
