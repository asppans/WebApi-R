#install.packages("httr")
library(httr)
r <- GET("http://httpbin.org/get")
ex1 <- GET("http://swapi.co/api/planets/1")
ex1
status_code(ex1)
str(content(ex1))
http_status(ex1)

# functions
# HEAD(), GET(), POST(), PATCH(), PUT(), DELETE()

# add Headers
r1 <- GET("http://httpbin.org/get", add_headers(Name="Garrett"))

# Add content with the body and encode arguments
url <- "http://httpbin.org/post"
body <- list(a = 1, b = 2, c = 3)
r <- POST(url, body = body, encode = "form")
r <- POST(url, body = body, encode = "multipart")
# r <- POST(url, body = body, encode = "raw")
r <- POST(url, body = body, encode = "json")

url <- "http://httpbin.org/post"
body <- list(a = 1, b = 2, c = 3)
r <- POST(url, body = body, encode = "json")


# View the HTTP request that httr sends.
r <- GET("http://httpbin.org/get", verbose())
# -> GET /get HTTP/1.1
# -> Host: httpbin.org
# -> User-Agent: libcurl/7.43.0 r-curl/2.1 httr/1.2.1
# -> Accept-Encoding: gzip, deflate
# -> Accept: application/json, text/xml, application/xml, */*


# Example
url <- "http://www.omdbapi.com/?t=frozen&y=2013&plot=short&r=json"

frozen <- GET(url)
frozen

details <- content(frozen, "parse")

details$Year