import AssemblyKeys._ 

seq(assemblySettings: _*)

name := "ELK-Demo"

version := "1.0"

scalaVersion := "2.11.2"

scalacOptions := Seq("-unchecked", "-deprecation", "-encoding", "utf8")

resolvers += "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/"

resolvers += "Sonatype releases" at "https://oss.sonatype.org/content/repositories/releases"

libraryDependencies ++= {
  val akkaV = "2.3.5"
  val sprayV = "1.3.1"
  Seq(
    "io.spray"            %%  "spray-can"           % sprayV,
    "io.spray"            %%  "spray-routing"       % sprayV,
    "io.spray"            %%  "spray-testkit"       % sprayV   % "test",
    "io.spray"            %%  "spray-json"          % sprayV,
    "com.typesafe.akka"   %%  "akka-actor"          % akkaV,
    "com.typesafe.akka"   %%  "akka-testkit"        % akkaV    % "test",
    "org.specs2"          %%  "specs2-core"         % "2.3.11" % "test",
    "org.scalatest"       %   "scalatest_2.11"      % "2.2.1"  % "test",
    "org.mongodb"         %%  "casbah"              % "2.7.3",
    "com.novus"           %%  "salat"               % "1.9.9",
    "ch.qos.logback"      %   "logback-classic"     % "1.0.13",
    "net.logstash.logback" %  "logstash-logback-encoder" % "3.4",
    "com.typesafe.akka"   %%  "akka-slf4j"          % akkaV
  )
}

Revolver.settings

