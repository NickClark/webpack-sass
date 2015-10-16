module.exports =
  #context: __dirname
  entry: "./test.coffee"
  output:
      path: __dirname + "/dist"
      filename: "bundle.js"
  devtool: 'source-map'
  module:
    loaders: [
      {
        test: /\.coffee$/
        loader: "coffee"
      }
      {
        test: /\.(jpg|png|gif)$/
        loader: "url?limit=10000&name=./images/[name]-[hash].[ext]"
      }
      {
        test: /\.scss$/
        loader: "style!css!resolve-url!sass?sourceMap"
      }
    ]
  resolve:
    modulesDirectories: ["node_modules", "bower_components"]
