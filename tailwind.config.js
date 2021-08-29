const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

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
      },
      fontFamily: {
        sans: ['Roboto', ...defaultTheme.fontFamily.sans]
      }
    }
  },
  variants: {
    extend: {}
  },
  plugins: []
}
