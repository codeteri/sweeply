# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "node_modules/bootstrap/dist/js/bootstrap.bundle.min.js", preload: true
pin "@popperjs/core", to: "node_modules/@popperjs/core/dist/cjs/index.js"
