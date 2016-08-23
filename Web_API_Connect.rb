require 'net/http'
require 'uri'

# アクセストークンおよびゾーン、APIバージョンを指定
#token = '＜アクセストークン＞'
#secret = '＜アクセストークンシークレット＞'
#zone_id = 'is1a'
#api_version = '1.1'

# アクセスするためのURLを生成
base_url = ""

# 「/servers」にGETリクエストを送信する
uri = URI.parse(base_url)

# HTTPSを使うための設定
http = Net::HTTP.new(uri.host, uri.port)
#https.use_ssl = true
#https.verify_mode = OpenSSL::SSL::VERIFY_NONE

# BASIC認証のための設定
#req = Net::HTTP::Get.new(uri.path)
#req.basic_auth(token, secret)

# リクエスト送信
res = http.start do
  http.get(uri.request_uri)
end

# 取得したレスポンスを表示
puts res.body
