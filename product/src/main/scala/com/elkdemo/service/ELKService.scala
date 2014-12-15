package com.elkdemo.service

import spray.routing.HttpService
//import com.elkdemo.Application.{ system => actorSystem}
//import akka.event.Logging

/**
 * User: vikash
 * Date: 12/14/14
 * Time: 7:05 PM
 */

//case class RequestLog(requestType: String, userAgent: String, userIp: String)
//{
//  def toJson = s"{'requestType':'$requestType', 'userAgent':'$userAgent', 'userIp':'$userIp'}"
//}

trait ELKService extends HttpService
{
   // get access to system logger
//   val servicelog = Logging.getLogger(actorSystem, this)

  val demoRoute =
  {
    get {
//      ctx => {
        pathSingleSlash {
//          servicelog.debug(RequestLog(requestType ="GET", userAgent = ctx.request.headers.toString(), userIp = "1").toJson)
          complete {
            <html>
              <body>
                <h1>Spray hello!</h1>
              </body>
            </html>
          }
        }
//      }
    }
  }

}
