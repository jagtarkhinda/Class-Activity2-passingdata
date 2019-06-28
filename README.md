# Class-Activity2-passingdata
An app to send message from Apple watch to iPhone and get an Acknowledgement of received message

##### Q:1 On the IOS side, what function is used to receive messages from the watch?

        func session(_ session: WCSession, didReceiveMessage message: [String : Any],
        replyHandler: @escaping ([String : Any]) -> Void) 
        {
          code
        }


##### Q:2 When receiving messages from the watch, you need to use a closure function. What is the reason why a closure is used?

        Colsure is used to pass the reply and send it back as a response to watch.
