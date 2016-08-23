App.chat = App.cable.subscriptions.create { channel: "ChatChannel", friendship_id: if $.isFunction('gon') && gon.friendship then gon.friendship.id else "" },  
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#messages').append(data.message)

  speak: (msg)->
    @perform 'speak', message: msg

$(document).on 'keypress', '#chat-speak', (event) ->
  if event.keyCode is 13
    App.chat.speak(event.target.value)
    event.target.value = ""
    event.preventDefault()