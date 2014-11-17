module ChineseT2s
  module Middleware
    class TranslationT2s
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, bodies = @app.call(env)
        [status, headers, bodies]
      end
    end
  end
end
