{
  pkgs,
  osConfig,
  ...
}: let
  nvidiaOffloadEnabled = osConfig.hardware.nvidia.prime.offload.enable or false;

  # If nvidia offload is enable then use it on `pkg` else do nothing
  withNvidiaOffload = pkg:
    if nvidiaOffloadEnabled
    then
      pkg.overrideAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.makeWrapper];
        postInstall =
          (old.postInstall or "")
          + ''
            for bin in $out/bin/*; do
              wrapProgram "$bin" \
                --set __NV_PRIME_RENDER_OFFLOAD 1 \
                --set __NV_PRIME_RENDER_OFFLOAD_PROVIDER NVIDIA-G0 \
                --set __GLX_VENDOR_LIBRARY_NAME nvidia \
                --set __VK_LAYER_NV_optimus NVIDIA_only
            done
          '';
      })
    else pkg;
in {
  # Exporta a função para outros módulos via _module.args
  _module.args.withNvidiaOffload = withNvidiaOffload;
}
