{
  description = "PyTorch model architecture support library with auto-detection from .pth files";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-lib = {
      url = "github:jgus/flake-lib/v1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-lib }:
    flake-lib.lib.mkLeafFlake {
      inherit nixpkgs flake-utils;
      source = { type = "pypi"; pname = "spandrel"; format = "sdist"; };
      package = {
        attr = "spandrel";
        description = "PyTorch model architecture support library with auto-detection from .pth files";
        extra = { dontCheckRuntimeDeps = true; };
      };
      pin = import ./pin.nix;
      branches = false;
    };
}
