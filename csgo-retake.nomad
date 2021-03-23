job "csgo-retake" {
  
  datacenters = ["dc1"]
  type = "service"
  group "csgo-retake" {
    count = 1
    network {
      port "csgo-retake" {
        to = 27017
        static = 27017
      }
      mode = "bridge"
    }

    volume "csgo-retake-data" {
      type = "host"
      read_only = false
      source = "csgo-retake-data"
    }


    task "csgo-retake" {
      driver = "docker"
      volume_mount {
        volume = "csgo-retake-data"
        destination = "/home/csgo/server"
        read_only  = false
      }
      config {
        image = "timche/csgo:sourcemod"
        ports = ["csgo-retake"]
      }
      resources {
        cpu    = 3000 # 500 MHz
        memory = 2048 # 256MB
      }
      env {
        CSGO_GSLT = "secret"
        CSGO_WS_API_KEY = "secret"
        CSGO_PORT = 27017 
        CSGO_MAX_PLAYERS = 10
        CSGO_HOSTNAME = "PR1SM Retake"
        CSGO_PW = "secret"
        CSGO_TICKRATE = 128
      } 
    }

  }
}