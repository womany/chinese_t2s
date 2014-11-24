module ChineseT2s
  module Middleware
    class TranslationT2s
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, bodies = @app.call(env)

        if status == 200
          params = env['rack.request.query_hash']

          case bodies.class.to_s
          when 'ActionDispatch::Response' # Rails
            if params[:set_lang].present?
              env['rack.session'].delete(:chinese_t2s_lang) if params[:set_lang] == 'tw'
              env['rack.session'][:chinese_t2s_lang] = 'cn' if params[:set_lang] == 'cn'
            end

            if (env['rack.session'][:chinese_t2s_lang] || params[:lang]) == 'cn'
              body = ChineseT2s::translate(bodies.body)
              bodies.body = body
            end
          when 'Rack::BodyProxy' # Grape
            if (env['rack.session'][:chinese_t2s_lang] || params[:lang]) == 'cn'
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
