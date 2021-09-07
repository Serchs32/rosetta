require "option_parser"

# :nodoc:
module Rosetta::Cli
  extend self

  def run
    # - generates config/rosetta dir
    # - generates config/rosetta/en.yml
    # - generates config/rosetta.cr
    # ```bash
    # mkdir -p config/rosetta
    # echo -e 'en:\n  welcome_message: "Hello %{name}!"' >> config/rosetta/en.yml
    # echo -e 'es:\n  welcome_message: "¡Hola %{name}!"' >> config/rosetta/es.yml
    # echo -e 'nl:\n  welcome_message: "Hallo %{name}!"' >> config/rosetta/nl.yml
    # # ... repeat for every available locale
    # touch config/rosetta.cr
    # ```

    # ```
    # # config/rosetta.cr
    # require "rosetta"

    # module Rosetta
    #   DEFAULT_LOCALE = "en"
    #   AVAILABLE_LOCALES = %w[en es nl]
    # end

    # Rosetta::Backend.load("config/rosetta")
    # ```
  end

  private def generate_dir
  end

  private def generate_initializer
  end

  private def generate_localization_rules
  end

  private def generate_example
  end
end
