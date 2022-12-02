import ./make-test-python.nix ({ pkgs, lib, ...}:
let
  exampleSecret = pkgs.writeText "example-secret" "EXAMPLE_SECRET_STRING";
in {
  name = "containers-credentials";
  meta = {
    maintainers = with lib.maintainers; [ DeeUnderscore ];
  };

  nodes.machine = { ... }: {
    containers.cred-container = {
      autoStart = true;
      credentials = {
        exampleCred = exampleSecret;
      };
      config = {};
    };
  };

  testScript = ''
    machine.wait_for_unit("default.target")
    assert "cred-container" in machine.succeed("nixos-container list")

    assert "up" in machine.succeed("nixos-container status cred-container")

    with subtest("can cat credential"):
      assert "EXAMPLE_SECRET_STRING" in machine.succeed(
        "nixos-container run cred-container -- cat /run/credentials/@system/exampleCred"
      )
  '';
})
