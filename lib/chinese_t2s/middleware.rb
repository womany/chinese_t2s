module ChineseT2s
  module Middleware
    class TranslationT2s
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, bodies = @app.call(env)

        if status == 200
          case bodies.class.to_s
          when 'ActionDispatch::Response' # Rails
            body = ChineseT2s::translate(bodies.body)
            bodies.body = body
          when 'Rack::BodyProxy' # Grape
          end
        end

        [status, headers, bodies]
      end
    end
  end
end
