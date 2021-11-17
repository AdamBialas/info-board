const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery',
    jquery: 'jquery',    
    Popper: ['popper.js', 'default'],
    topbar: 'topbar/topbar'
  })
)

module.exports = environment
