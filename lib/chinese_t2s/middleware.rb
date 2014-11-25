module ChineseT2s
  module Middleware
    class TranslationT2s
      def initialize(app)
        @app = app
      end

      def call(env)
        set_lang = env['QUERY_STRING'][/\bset_lang=(\w+)/, 1]

        unless set_lang.nil?
          env['rack.session'].delete('chinese_t2s_lang') if set_lang == 'tw'
          env['rack.session']['chinese_t2s_lang'] = 'cn' if set_lang == 'cn'
        end

        status, headers, bodies = @app.call(env)

        if status == 200
          params = env['rack.request.query_hash']

          if (env['rack.session']['chinese_t2s_lang'] || params['lang']) == 'cn'
            case bodies
            when ActionDispatch::Response # Rails
              body = ChineseT2s::translate(bodies.body)
              bodies.body = body
            when Rack::BodyProxy # Grape
              body = ChineseT2s::translate(bodies.body.first)
              bodies.body = [body]
            end
          end
        end

        [status, headers, bodies]
      end
    end
  end
end
