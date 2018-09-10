## add ensime confige
<project root>/buld.sbt
 -> + ensimeScalaVersion in ThisBuild := "2.11.8"
~/.sbt/0.13/plugins/plugins.sbt
 -> + addSbtPlugin("org.ensime" % "sbt-ensime" % "2.6.1")
~/.sbt/0.13/global.sbt
 ->
    + import org.ensime.EnsimeKeys._
    + ensimeIgnoreMissingDirectories := true

## make ensime file
$ sbt ensimeConfig

## ensime unsupport multi project? let's follow
$ sbt compile

$ cp target/scala_{2.11|2.12}/<project_name + snapshot? + version>.jar <current project>/lib
or
.emacs add subproject target directory for :projects current project :targets

