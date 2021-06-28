const { environment } = require('@rails/webpacker')

//LISTING 8.20
//Adding jQuery configuration to webpack
const webpack = require('webpack') 
environment.plugins.prepend('Provide', 
    new webpack.ProvidePlugin({ 
        $: 'jquery/src/jquery', 
        jQuery: 'jquery/src/jquery' 
        
    }) 
)

module.exports = environment
