import '@hotwired/turbo-rails'
import * as ActiveStorage from '@rails/activestorage'
import './channels'
import './controllers'

ActiveStorage.start()
