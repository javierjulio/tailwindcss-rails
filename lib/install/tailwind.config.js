const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: <%= Tailwindcss::Engine.globs.to_json %>,
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
