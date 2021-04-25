const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    './app/helpers/**/*.rb',
    './app/views/**/*.html.erb'
  ],
  darkMode: false,
  theme: {
    extend: {
      colors: {
        orange: colors.orange
      }
    }
  },
  variants: {
    extend: {}
  },
  plugins: []
}
