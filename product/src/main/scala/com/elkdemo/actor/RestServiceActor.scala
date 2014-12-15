package com.elkdemo.actor

import spray.routing._
import spray.http._
import akka.actor.{ActorLogging, Actor}
import com.elkdemo.service.ELKService

/**
 * User: vikash
 * Date: 12/14/14
 * Time: 7:01 PM
 */
class RestServiceActor extends Actor with ActorLogging with ELKService
{
  // the HttpService trait defines only one abstract member, which
  // connects the services environment to the enclosing actor or test
  def actorRefFactory = context


  override def preStart(): Unit =
  {
//    log.debug(s"{'event':'actor-pre-start','actorName':'${self.path}', 'message':'actor starting up...'}")
  }

  // this actor only runs our route, but you could add
  // other things here, like request stream processing
  // or timeout handling
  def receive = runRoute(demoRoute)
}

