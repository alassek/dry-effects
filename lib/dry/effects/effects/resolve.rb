require 'dry/effects/effect'

module Dry
  module Effects
    module Effects
      class Resolve < ::Module
        def initialize(*keys)
          module_eval do
            keys.each do |key|
              effect = Effect.new(type: :resolve, identifier: key, payload: [key])
              define_method(key) { ::Dry::Effects.yield(effect) }
            end
          end
        end
      end
    end
  end
end
