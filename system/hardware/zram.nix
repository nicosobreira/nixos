{...}: {
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50; # ajuste conforme RAM disponível
    priority = 100; # prioridade mais alta que o swap em disco
  };
}
