package com.elkdemo.service

import spray.routing.HttpService
import org.slf4j.LoggerFactory
import spray.http.StatusCodes._
import spray.http._
import spray.httpx.unmarshalling._




//import com.elkdemo.Application.{ system => actorSystem}
//import akka.event.Logging

/**
 * User: vikash
 * Date: 12/14/14
 * Time: 7:05 PM
 */

case class RequestLog(requestType: String, userAgent: String, userIp: String)
{
  def toJson = s"""{"requestType":"$requestType", "userAgent":"$userAgent", "userIp":"$userIp"} """
}

case class ResponseLog(response: String)
{
  def toJson = s"""{"responseCode":"$response"}"""
}


trait ELKService extends HttpService
{
   // get access to system logger
   def logger = LoggerFactory.getLogger(this.getClass)


  val demoRoute =
    path("test") {
      // Retrieve collection of help requests
      get {  ctx => // get request context
        logger.debug(RequestLog(requestType ="GET", userAgent = ctx.request.headers(2).toString(), userIp = "192.168.1.1").toJson)
        logger.debug(ResponseLog("200").toJson)
        ctx.complete{
                      <html>
                        <body>
                          <h1>Spray hello!</h1>
                          <form action="/test" method="post">
                            (POST) Type Some Words: <input type="text" name="teststuff"/>
                            <input type="submit"/>
                          </form>
                          <form action="/test" method="put">
                            (PUT) Type Some Words: <input type="text" name="teststuff"/>
                            <input type="submit"/>
                          </form>
                        </body>
                      </html>
                    }
      } ~
      post { ctx =>
        logger.debug(RequestLog("POST",ctx.request.headers(3).toString(),"192.168.1.1").toJson)
        logger.debug(ResponseLog("201").toJson)
        ctx.complete(StatusCodes.Created)
      } ~
      put { ctx =>
        logger.debug(RequestLog("PUT",ctx.request.headers(3).toString(),"192.168.1.1").toJson)
        logger.debug(ResponseLog("500").toJson)
        ctx.complete(StatusCodes.InternalServerError)
      }
    }

  val demoClientRoute =
    path("client") {
      // Retrieve collection of help requests
      get {  //ctx => // get request context
        //logger.debug(RequestLog(requestType ="GET", userAgent = ctx.request.headers(4).toString(), userIp = "192.168.1.1").toJson)
        //logger.debug(ResponseLog("200").toJson)
        getFromResource("web/index.html")
      } ~
        post { ctx =>
                    logger.debug(RequestLog("POST",ctx.request.headers(3).toString(),"192.168.1.1").toJson)
                    logger.debug(ResponseLog("201").toJson)
                     val entity = ctx.request.entity.data.asString
                    logger.debug(entity)
                    ctx.complete(StatusCodes.Created)
                }

        }



}

