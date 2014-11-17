module ChineseT2s
  class Engine < ::Rails::Engine
    initializer "chinese_t2s.add_middleware" do |app|
      app.middleware.use ChineseT2s::Middleware::TranslationT2s
    end
  end
end

