module.exports = (context) => ({
  plugins: {
    tailwindcss: {},
    cssnano: context.env === 'production' ? {} : false
  }
})
