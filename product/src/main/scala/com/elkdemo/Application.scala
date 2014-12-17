package com.elkdemo

import akka.actor.{Props, ActorSystem}
import com.typesafe.config.ConfigFactory
import akka.io.IO
import spray.can.Http
import akka.util.Timeout
import scala.concurrent.duration._
import akka.pattern.ask
import com.elkdemo.actor.RestServiceActor
import org.slf4j.LoggerFactory

/**
 * Main App
 */

object Application extends App
{
  implicit val timeout = Timeout(5.seconds)
  def logger = LoggerFactory.getLogger(this.getClass)
  logger.debug(
    """{"testval1":"one","testval2":2}
    """.stripMargin)

  // we need an ActorSystem to host our application in
  implicit val system = ActorSystem(ConfigFactory.load().getString("actor.system.id"))

  // create and start our service actor
  val restService = system.actorOf(Props[RestServiceActor], ConfigFactory.load().getString("service.id"))

  // Create and start our Persistent Actor
//  val mongoService = system.actorOf(MongoManager.props(ConfigFactory.load().getString("application.actor.persistence_manager.id")), ConfigFactory.load().getString("application.actor.persistence_manager.id"))

  // start HTTP server with rest service actor as a handler
  IO(Http) ? Http.Bind(restService, interface = ConfigFactory.load().getString("service.host"), port = ConfigFactory.load().getInt("service.port"))

}

