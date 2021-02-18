const target = 'http://127.0.0.1:3000';

module.exports = {
  devServer: {
    port: 8082,
    proxy: {
      '^/api': {
        target,
        changeOrigin: true
      },
      '^/upload': {
        target,
        changeOrigin: true,
      },
      '^/download': {
        target,
        changeOrigin: true,
      }
    }
  }
}
// 서버 요청시 api 가 들어있으면 target을 통해 mapping 시켜줌 