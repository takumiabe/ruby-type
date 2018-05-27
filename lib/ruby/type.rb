require "ruby/type/version"
require 'parser/current'

module Ruby
  module Type
    # Ruby::Type.Of('1 + 1')
    def self.Of(exp_str)
      location = caller_locations(1).first
      unless File.exist? location.absolute_path
        raise NotImplementedError, 'not now'
      end

      # caller line number
      lineno = location.lineno

      # caller s-expression
      context_sexp =
        File.open(location.absolute_path, 'r') do |f|
          Parser::CurrentRuby.parse(f.read)
        end

      # TODO: static type analysis of context_sexp

      # given expression to s-expression
      target_sexp = Parser::CurrentRuby.parse(exp_str)

      # TODO: eval target_sexp in context_sexp
    end
  end
end
