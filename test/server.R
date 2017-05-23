library(httr)
library(jsonlite)


a.url <- 'https://accounts.spotify.com/authorize'

query.params <- list(client_id = '5e4615ac0e2240759d7a4213681a9ea3', response_type  = "code",
                     redirect_uri = 'https://zklin.shinyapps.io/test/', scope = 'user-top-read')
response <- GET(a.url, query = query.params)

info <- fromJSON(content(response, "text", encoding="UTF-8"))

spec.url <- ' https://zklin.shinyapps.io/test/'

token_link <- 'https://accounts.spotify.com/api/token'
query.t <- list(grant_type = response$status_code)

POST('https://accounts.spotify.com/api/token')
# qurey.access
function(input, output) {
  
  # You can access the value of the widget with input$text, e.g.
  output$value <- renderPrint({ 
    return()
  })
  
}