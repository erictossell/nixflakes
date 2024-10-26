# https://github.com/quickemu-project/quickemu?tab=readme-ov-file
{
    pkgs,
    ...
}: {
    environment.systemPackages = with pkgs; [
        unstable.quickemu
    ];

}