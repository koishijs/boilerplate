module.exports = {
  // 使用的传输方式
  // 目前支持 http 或 ws
  type: "http",

  // http 服务器的端口
  // 与 CQHTTP 的 post_url 相对应
  port: 7070,

  // CQHTTP 服务器的地址
  // 与 CQHTTP 的 host, port 相对应
  server: "http://localhost:5700",

  // 要安装的插件列表
  plugins: [
    "common",   // 内置的常用插件
    "."         // index.js
  ]
}
