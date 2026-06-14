{
  pkgs,
  osConfig,
  ...
}: let
  isNvidiaOffloadEnabled = osConfig.hardware.nvidia.prime.offload.enable or false;

  # Função que wrapa um pacote com nvidia-offload se NVIDIA estiver ativa,
  # caso contrário retorna o pacote sem modificação
  withNvidiaOffload = pkg:
    if isNvidiaOffloadEnabled
    then
      pkgs.runCommand "${pkg.name}-nvidia-offload"
      {buildInputs = [pkgs.makeWrapper];}
      ''
        makeWrapper ${pkg}/bin/${pkg.meta.mainProgram or pkg.pname or pkg.name} \
          $out/bin/${pkg.meta.mainProgram or pkg.pname or pkg.name} \
          --set __NV_PRIME_RENDER_OFFLOAD 1 \
          --set __NV_PRIME_RENDER_OFFLOAD_PROVIDER NVIDIA-G0 \
          --set __GLX_VENDOR_LIBRARY_NAME nvidia \
          --set __VK_LAYER_NV_optimus NVIDIA_only
      ''
    else pkg;
in {
  # Exporta a função para outros módulos via _module.args
  _module.args.withNvidiaOffload = withNvidiaOffload;
}
