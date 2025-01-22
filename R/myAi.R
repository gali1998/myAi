# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

hello <- function() {
  print("Hello, world!")
}

#' @export
ask_gpt<- function(api_key, message = "", model ="gpt-4o-mini") {
  messages = list(
    list(
      "role" = "user",
      "content" = message
    )
  )
  res <- openai::create_chat_completion(openai_api_key = api_key, model= model, messages = messages)
  return(res$choices$message.content)

}

#' @import claudeR
#' @export
ask_claude <- function(api_key, message = "", model = "claude-2") {
  #remotes::install_github("yrvelez/claudeR")
  response <- claudeR::claudeR(prompt = message, model = model, api_key = api_key)
  return(response)
}
