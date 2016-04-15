class WebhookController < ApplicationController

def callback

    token = "CAAX83yAAMF4BAIez69z5AKP95sEgzC6AHU9oAnhJwuHSwtXybkCeF0aWavWYhcvzGPaKu6jCyTuBe9PR1aDh2iGaGy7cwckevZA9Ku6h9ZBiSfZC9fGOlpagrr7dM1OIu6Lur18J9VjN5B8of54VCob3MJkYQg6JVO6WuQgR6vG9dyZAQAbigLYtKeUYzJvPwhbXqBtRYwZDZD"

    message = params["entry"][0]["messaging"][0]

    if message.include?("message")

      #ユーザーの発言

      sender = message["sender"]["id"]
      text = message["message"]["text"]

      endpoint_uri = "https://graph.facebook.com/v2.6/me/messages?access_token=" + token
      request_content = {recipient: {id:sender},
                         message: {text: text}
                        }

      content_json = request_content.to_json

      RestClient.post(endpoint_uri, content_json, {
        'Content-Type' => 'application/json; charset=UTF-8'
      }){ |response, request, result, &block|
        p response
        p request
        p result
      }
    else
      #botの発言
    end
  end
end
