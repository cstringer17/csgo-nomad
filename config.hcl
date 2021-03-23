client {
  servers = []
      host_volume "csgo-retake-data" {
      	path = "/data/csgo/retake"
        read_only = false
      }
      host_volume "csgo-pug-data" {
      	path = "/data/csgo/pug"
        read_only = false
      }
      host_volume "csgo-dm-data" {
      	path = "/data/csgo/dm"
        read_only = false
      }
      host_volume "csgo-execute-data" {
      	path = "/data/csgo/execute"
        read_only = false
      }
}
