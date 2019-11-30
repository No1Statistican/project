library(wordcloud)
library(tidyverse)
library(tidytext)
library(janeaustenr)
library(shinythemes)
library(shiny)

ui  <- fluidPage(
    theme = shinytheme('yeti'),
    titlePanel('Wordcloud Web App'),
    sidebarLayout(
        sidebarPanel(
            sliderInput('ngramCount', '# of Grams', min = 1, max = 5, value = 1),
            hr(),
            sliderInput('cloudCount', '# of Words', min = 50, max = 400, value = 100)
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
        tweets_small %>%
            select(text) %>%
            unnest_tokens(ngram, text, token="ngrams", n=ngrams()) %>%
            count(ngram) %>%
            with(wordcloud(ngram, n, max.words=input$cloudCount, rot.per=.2, colors=c("#cde0c9", "#68b2A0", "#2c6975")))
    })
}

shinyApp(ui = ui, server = server)