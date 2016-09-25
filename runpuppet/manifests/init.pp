#Choose master or node 

class runpuppet {
  if $::hostname == 'serverpuppet' {
    include runpuppet::pupserver
  }
  else {
    include runpuppet::pupnode
  }
}