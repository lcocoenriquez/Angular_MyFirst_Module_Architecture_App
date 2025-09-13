{ pkgs, ... }: {
  # We use the unstable channel to get the latest nodejs
  channel = "unstable";

  # Add required packages
  packages = [
    pkgs.nodejs_22
    pkgs.nodePackages."@angular/cli"
  ];

  idx = {
    # Recommended extensions for Angular development
    extensions = [
      "angular.ng-template"
    ];
    workspace = {
      # Run this command when the workspace is created
      onCreate = {
        install-deps = "npm install --prefix my-angular-app";
      };
      # onStart is not needed as the preview starts the server
      onStart = {};
    };
    previews = {
      enable = true;
      previews = {
        web = {
          # The command to start the angular development server
          command = [
            "npm"
            "run"
            "start"
            "--"
            "--port"
            "$PORT"
            "--host"
            "0.0.0.0"
            "--disable-host-check"
          ];
          manager = "web";
          cwd = "my-angular-app";
        };
      };
    };
  };
}
