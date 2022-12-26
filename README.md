# nginx-waf
nginx-more with ModSecurity3 and preconfigured OWASP ModSecurity Core Rule Set (CRS).
usese：
docker build -t nginx-waf .

docker run -d --name nginx-waf -p 80:80 nginx-waf
