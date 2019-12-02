#Forest Krueger and Victoria Owens

library(wordcloud)
library(tidyverse)
library(tidytext)
library(shinythemes)
library(shiny)

#get data from https://drive.google.com/file/d/1PGEFRaK9IhOyiF2svW_a_OL-ZIAZ_sQO/view
#word cloud of tweets about leading democtatic 2020 canidates from certain states on Twitter
load("tidy_all_tweets_cut.Rda")

ui  <- fluidPage(
  theme = shinytheme('yeti'),
  titlePanel('Democractic Candidate Twitter Mentions Wordcloud'),
  sidebarLayout(
    sidebarPanel(
      sliderInput('cloudCount', '# of Words', min = 50, max = 400, value = 100),
      hr(),
      selectInput('CANDIDATE', 'Choose a candidate:', choices = c('PB', 'KH', 'EW', 'BS', 'JB')),
      hr(),
      selectInput('STATE', 'Choose a state:', choices = c('NV', 'NH', 'SC', 'IA'))
    ),
    mainPanel(
      plotOutput('wordcloud')
    )
  )
)

server  <- function(input, output) {
  ngrams  <- reactive({
    input$ngramCount
  })
  
  output$wordcloud  <- renderPlot({
    tidy_all_tweets_cut %>%
      select(word, CANDIDATE, STATE) %>%
      filter(STATE == input$STATE, CANDIDATE == input$CANDIDATE) %>%
      count(word) %>%
      with(wordcloud(word, n, max.words=input$cloudCount, rot.per=.2, colors=c("#cde0c9", "#68b2A0", "#2c6975"),height=400,width=600))
  })
}

shinyApp(ui = ui, server = server)