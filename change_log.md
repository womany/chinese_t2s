# v0.0.3

* Remove session[:chinese_t2s_lang] and there is no auto-translating now
* Remove set_lang params and auto translating after settin

# v0.0.2

* Thanks @godfat, get tongwen t2s tables now change to use `File.open().each_line`.
* Thanks @godfat, simplify how to get `set_lang` in middleware.
* Middleware will process `set_lang` before `@app.call` and then store in `env[rack.session]`.
* Fixed: middleware, assign {} to prevent params nil

# v0.0.1

* Provide ChineseT2s.translate.
* Provide ChineseT2s middleware.
* Use ChineseT2s middleware in rails by default.
* Translate Chinese using tongwen t2s tables.