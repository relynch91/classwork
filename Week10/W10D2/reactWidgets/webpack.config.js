// webpack.config.js
var path = require('path');

module.exports = {
    entry: './frontend/widgets.jsx',
    output: {
        filename: './bundle.js',
        path: path.resolve(__dirname)
    },
    module: {
        rules: [
            {
                test: [/\.jsx?$/],
                exclude: /(node_modules)/,
                use: {
                    loader: 'babel-loader',
                    query: {
                        presets: ['@babel/env', '@babel/react']
                    }
                },
            }
        ]
    },
    devtool: 'source-map',
    resolve: {
        extensions: ['.js', '.jsx', '*']
    }
};