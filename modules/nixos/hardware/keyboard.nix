{config, ...}: {
  config = {
    # Use capslock as escape and/or control
    # services.keyd = {
    #   enable = true;
    #   settings = { main = { capslock = "overload(control, esc)"; }; };
    # };

    # Enable num lock on login
    home-manager.users.${config.user}.xsession.numlock.enable = true;
  };
}
