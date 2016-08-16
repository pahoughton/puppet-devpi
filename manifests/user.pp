class devpi::user {

  if $::devpi::manage_user {
    @user { $::devpi::user:
      ensure     => $::devpi::ensure,
      home       => $::devpi::user_home,
      gid        => $::devpi::group,
      managehome => true
    }
    @group { $::devpi::group:
      ensure => $::devpi::ensure
    }
  }

  Group <| title == $::devpi::group |> ->
  User <| title == $::devpi::user |>

}
